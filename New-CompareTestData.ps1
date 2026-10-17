#Requires -Version 5.1
<#
    Creates two folders, Left and Right, full of files to try PowerClipboard's
    Compare folders, Compare text and Find in files on.

        .\New-CompareTestData.ps1                    # creates .\CompareTest next to this script
        .\New-CompareTestData.ps1 -Path D:\Temp\Cmp  # somewhere else
        .\New-CompareTestData.ps1 -Force             # replace an existing test folder

    What you get (Left vs Right):
      same\                 identical files and folders
      changed\              text files with small edits, added and removed lines
      whitespace\           differences only in spaces, tabs, case or line endings (CRLF vs LF)
      encodings\            UTF-8, UTF-8 with BOM, UTF-16 and ANSI versions of the same text
      sizes\                same size but different bytes, empty files, a big file with a few changes
      binary\               identical and different binary files
      only-left\ only-right\  folders that exist on one side only (plus single files at the top)
      deep\                 a nested tree with one change far down
      node_modules\ .git\   junk folders the compare skips by default
      search\               text with words to find (TODO, needle, error codes) in several file types
#>
param(
    [string]$Path = (Join-Path $PSScriptRoot 'CompareTest'),
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

if (Test-Path -LiteralPath $Path) {
    if (-not $Force) { throw "'$Path' already exists. Use -Force to replace it." }
    Remove-Item -LiteralPath $Path -Recurse -Force
}
$Left  = Join-Path $Path 'Left'
$Right = Join-Path $Path 'Right'

$Utf8    = New-Object System.Text.UTF8Encoding($false)
$Utf8Bom = New-Object System.Text.UTF8Encoding($true)
$Ansi    = [System.Text.Encoding]::GetEncoding(1252)

# Writes text to Left and/or Right. Pass $null for a side to leave the file out there.
function Write-Pair([string]$Rel, $LeftText, $RightText, $Encoding = $Utf8, [string]$Eol = "`r`n") {
    foreach ($side in @(@($Left, $LeftText), @($Right, $RightText))) {
        if ($null -eq $side[1]) { continue }
        $file = Join-Path $side[0] $Rel
        $dir = Split-Path -Parent $file
        if (-not (Test-Path -LiteralPath $dir)) { [void](New-Item -ItemType Directory -Path $dir -Force) }
        $text = ($side[1] -replace "`r`n", "`n") -replace "`n", $Eol
        [IO.File]::WriteAllText($file, $text, $Encoding)
    }
}

function Write-Bytes([string]$Rel, [byte[]]$LeftBytes, [byte[]]$RightBytes) {
    foreach ($side in @(@($Left, $LeftBytes), @($Right, $RightBytes))) {
        if ($null -eq $side[1]) { continue }
        $file = Join-Path $side[0] $Rel
        $dir = Split-Path -Parent $file
        if (-not (Test-Path -LiteralPath $dir)) { [void](New-Item -ItemType Directory -Path $dir -Force) }
        [IO.File]::WriteAllBytes($file, $side[1])
    }
}

function New-Dir([string]$Rel) { [void](New-Item -ItemType Directory -Path $Rel -Force) }

$lorem = @'
PowerClipboard keeps everything you copy.
Press Ctrl+Shift+V to open the picker.
Pinned clips stay at the top.
Notes work like pages: click anywhere and type.
Compare shows two texts side by side.
Folder compare shows two folders as one tree.
Find in files searches every line under a folder.
'@

# ---- same -------------------------------------------------------------------------------
Write-Pair 'same\readme.txt' $lorem $lorem
Write-Pair 'same\config.json' "{`n  `"name`": `"demo`",`n  `"version`": 3,`n  `"enabled`": true`n}" "{`n  `"name`": `"demo`",`n  `"version`": 3,`n  `"enabled`": true`n}"
Write-Pair 'same\nested\notes.md' "# Notes`n`n- one`n- two`n" "# Notes`n`n- one`n- two`n"

# ---- changed ----------------------------------------------------------------------------
$codeLeft = @'
function Get-Greeting {
    param([string]$Name)
    # say hello
    $msg = "Hello, $Name"
    Write-Output $msg
}

function Get-Total([int[]]$Numbers) {
    $sum = 0
    foreach ($n in $Numbers) { $sum += $n }
    return $sum
}

Get-Greeting -Name 'World'
'@
$codeRight = @'
function Get-Greeting {
    param([string]$Name, [switch]$Loud)
    $msg = "Hi there, $Name"
    if ($Loud) { $msg = $msg.ToUpper() }
    Write-Output $msg
}

function Get-Total([int[]]$Numbers) {
    $sum = 0
    foreach ($n in $Numbers) { $sum += $n }
    return $sum
}

function Get-Average([int[]]$Numbers) {
    if ($Numbers.Count -eq 0) { return 0 }
    return (Get-Total $Numbers) / $Numbers.Count
}

Get-Greeting -Name 'World' -Loud
'@
Write-Pair 'changed\script.ps1' $codeLeft $codeRight

$listLeft  = (1..40 | ForEach-Object { "Item $_ - in stock" }) -join "`n"
$listRight = (1..40 | Where-Object { $_ -ne 12 -and $_ -ne 13 } | ForEach-Object {
    if ($_ -eq 5) { 'Item 5 - SOLD OUT' } elseif ($_ -eq 30) { "Item 30 - in stock`nItem 30b - new arrival" } else { "Item $_ - in stock" }
}) -join "`n"
Write-Pair 'changed\inventory.txt' $listLeft $listRight
Write-Pair 'changed\one-word.txt' 'The quick brown fox jumps over the lazy dog.' 'The quick red fox jumps over the lazy dog.'
Write-Pair 'changed\settings.ini' "[main]`ntheme=dark`nfont=Consolas`nsize=10`n`n[paths]`ndata=.\data`n" "[main]`ntheme=light`nfont=Consolas`nsize=12`n`n[paths]`ndata=.\data`nbackup=.\backup`n"

# ---- whitespace (try Ignore whitespace, Ignore case and Show whitespace) -----------------
Write-Pair 'whitespace\spaces.txt' "name: Alice`nage:  30`ncity: Paris" "name:    Alice`nage: 30`ncity: Paris   "
Write-Pair 'whitespace\tabs-vs-spaces.txt' "if (x) {`n`treturn 1;`n}" "if (x) {`n    return 1;`n}"
Write-Pair 'whitespace\case.txt' "Hello World`nSELECT * FROM users" "hello world`nselect * from Users"
Write-Pair 'whitespace\line-endings.txt' $lorem $null $Utf8 "`r`n"
Write-Pair 'whitespace\line-endings.txt' $null $lorem $Utf8 "`n"

# ---- encodings (same words, different bytes) --------------------------------------------
$accents = "Caf$([char]0xE9), na$([char]0xEF)ve, $([char]0xFC)ber, $([char]0xF1)and$([char]0xFA)`nPrice: 5 EUR`n"
Write-Pair 'encodings\utf8-vs-bom.txt' $accents $accents $Utf8
Write-Pair 'encodings\utf8-vs-bom.txt' $null $accents $Utf8Bom
Write-Pair 'encodings\ansi-vs-utf8.txt' $accents $null $Ansi
Write-Pair 'encodings\ansi-vs-utf8.txt' $null $accents $Utf8
Write-Pair 'encodings\utf16.txt' $accents $accents ([System.Text.Encoding]::Unicode)

# ---- sizes ------------------------------------------------------------------------------
Write-Pair 'sizes\same-size-different-bytes.txt' 'version=1.0.4' 'version=1.0.5'
Write-Pair 'sizes\empty.txt' '' ''
Write-Pair 'sizes\empty-vs-not.txt' '' 'now there is something here'
$bigLeft = (1..20000 | ForEach-Object { "line $_ : ordinary text that is the same on both sides of the compare" })
$bigRight = [System.Collections.Generic.List[string]]$bigLeft
$bigRight[999]   = 'line 1000 : THIS LINE WAS CHANGED on the right'
$bigRight[11999] = 'line 12000 : edited too'
$bigRight.RemoveAt(14999)
$bigRight.Insert(17999, 'a brand new line added on the right')
Write-Pair 'sizes\big-20000-lines.log' ($bigLeft -join "`n") ($bigRight -join "`n")

# ---- binary -----------------------------------------------------------------------------
$rnd = New-Object System.Random 42
$blob = New-Object byte[] 65536; $rnd.NextBytes($blob)
$blob2 = [byte[]]$blob.Clone(); $blob2[40000] = [byte](($blob2[40000] + 1) % 256)
Write-Bytes 'binary\same.bin' $blob $blob
Write-Bytes 'binary\one-byte-differs.bin' $blob $blob2
Add-Type -AssemblyName System.Drawing
foreach ($side in @(@($Left, 'SteelBlue'), @($Right, 'IndianRed'))) {
    $bmp = New-Object System.Drawing.Bitmap 200, 120
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::FromName($side[1]))
    $g.FillEllipse([System.Drawing.Brushes]::White, 60, 20, 80, 80)
    $g.Dispose()
    $dir = Join-Path $side[0] 'binary'
    $bmp.Save((Join-Path $dir 'picture.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
}

# ---- only on one side ---------------------------------------------------------------------
Write-Pair 'only-left\old-report.txt' "Quarterly report (old)`nTODO: delete after review" $null
Write-Pair 'only-left\archive\2024.csv' "month,total`nJan,10`nFeb,12" $null
Write-Pair 'only-right\new-feature.md' $null "# New feature`n`nDescribed here. TODO: add screenshots."
New-Dir (Join-Path $Right 'only-right\empty-folder')
Write-Pair 'removed.txt' 'This file was deleted on the right.' $null
Write-Pair 'added.txt' $null 'This file is new on the right.'

# ---- deep tree, one change far down ------------------------------------------------------
foreach ($i in 1..5) {
    Write-Pair "deep\level1\level2\file$i.txt" "content $i" "content $i"
}
Write-Pair 'deep\level1\level2\level3\level4\target.txt' "the value is 41`nunchanged line" "the value is 42`nunchanged line"

# ---- junk folders (skipped by default; untick the option to see them) ---------------------
Write-Pair 'node_modules\left-pad\index.js' 'module.exports = 1;' 'module.exports = 2;'
Write-Pair '.git\HEAD' 'ref: refs/heads/main' 'ref: refs/heads/dev'

# ---- things to find with Find in files ----------------------------------------------------
Write-Pair 'search\app.cs' @'
using System;
class App {
    // TODO: handle the error case
    static int Main() {
        var needle = Find("haystack");
        if (needle == null) { Console.WriteLine("ERR-404: not found"); return 1; }
        return 0;
    }
}
'@ $null
Write-Pair 'search\server.log' @'
2026-10-16 09:00:01 INFO  started
2026-10-16 09:00:05 WARN  slow response (1200 ms)
2026-10-16 09:01:12 ERROR ERR-500: database unavailable
2026-10-16 09:02:30 INFO  needle found in cache
2026-10-16 09:03:44 ERROR ERR-404: page /missing not found
'@ $null
Write-Pair 'search\notes.md' "# Ideas`n- TODO: try a regular expression like ERR-\d+`n- Needles and NEEDLE: try Match case and Whole word`n" $null

$files = @(Get-ChildItem -LiteralPath $Path -Recurse -File).Count
Write-Host "Created $files files in:"
Write-Host "  Left : $Left"
Write-Host "  Right: $Right"
Write-Host ''
Write-Host 'Try:'
Write-Host '  Compare folders  - Left vs Right (then untick "Skip ..." to see node_modules and .git)'
Write-Host '  Compare text     - double-click any yellow file in the tree, e.g. changed\script.ps1'
Write-Host "  Find in files    - search $Left for TODO, needle, or the regex ERR-\d+"
