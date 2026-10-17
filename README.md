# DevTools

A portable developer toolbox in a single PowerShell script: a clipboard manager with smart actions, a command palette, snippets, an encrypted secrets vault, side-by-side text compare, folder compare, find in files, a text transformer (hex, Base64, hashes, AES ...), network tools (ping, TCP port test, nslookup), a Postman-style API tester, OneNote-style notes with folders, a screenshot tool with an image editor and text recognition (OCR), and a toolbox (JSON / YAML / CSV / XML converter, JWT, regex, cron, generators, QR codes, colour picker, file hashes, ports, certificates, host monitor, number bases, units, time zones, Markdown preview, environment variables & PATH, processes & services, timer & Pomodoro). Your data files can be encrypted, and synced between PCs. No install, no admin rights. Works with the Windows PowerShell 5.1 that ships with Windows.

## Start

Double-click `DevTools.bat`. A clipboard icon appears in the system tray.

To start it with Windows, turn on **Start with Windows** in Settings (gear icon).

## Use

Three shortcuts work everywhere in Windows:

| Key | Action |
|---|---|
| **Ctrl+Shift+V** | Open the clipboard picker |
| **Ctrl+Shift+Space** | Command palette: type to run any tool or action, open a note, paste a snippet or a recent clip |
| **Ctrl+Alt+V** | Paste the clipboard as plain text (no fonts, colours, links or tables) |
| **Ctrl+Shift+X** | Take a screenshot (see Screenshots) |
| **Ctrl+Alt+Space** | Paste the next item of the paste stack |

You can give any other tool or action its own shortcut in Settings > **Global shortcuts** (for example Ctrl+Alt+N for Notes).

Press **Ctrl+Shift+V** anywhere to open the picker. It opens at the mouse. Pressing it again while the picker is open just brings it back to the front; Esc closes it.

| Key | Action |
|---|---|
| Enter / double-click | Paste into the window you were in |
| Shift+Enter | Copy only, don't paste |
| Ctrl+click, Shift+click | Select several clips |
| Ctrl+P | Pin / unpin (pinned clips stay at the top and are never auto-deleted) |
| F2 / Ctrl+E | Edit the text (Ctrl+Enter saves). On an image it opens the picture; on files it shows them in Explorer |
| Delete | Delete the selected clips |
| Ctrl+D | Open the Compare tool; with two clips selected, compares them (see below) |
| Ctrl+N | Open your notes |
| Ctrl+Shift+F | Find in files |
| Ctrl+T | Transform the selected clip (hex, Base64, hashes, encryption ...) |
| Ctrl+Shift+N | Network tools (ping, TCP port test, nslookup); a selected host name or URL is filled in |
| Ctrl+Shift+A | API tester (like Postman); a selected URL or curl command is loaded |
| Ctrl+Shift+S | Secrets (encrypted vault) |
| Ctrl+B | Toolbox |
| Ctrl+K | Command palette |
| Ctrl+. | Smart actions for the selected clip (see below) |
| Ctrl+1 ... Ctrl+5 | Filter: all, text, images, files, pinned |
| Ctrl+, | Settings |
| Esc | Close |
| Ctrl+Q | Stop DevTools (same as the **Exit** button or the tray menu's Exit) |
| Type anything | Search |

The window has three parts:

- **Quick access** (the strip of round bubbles on the left): your own links, files, programs and folders. Click one to open it, Ctrl+click copies its link / path, right-click to rename, change, move or remove it. Add one with the **+** bubble (a link, a file, a folder, or what's on the clipboard) or drop files, folders or links from the browser onto the strip.
- **Top bar**: icons for every tool (Notes, Compare text, Compare folders, Find in files, Transform, Network tools, API tester, Secrets, Toolbox, Command palette), then Pause / Resume, Settings and Exit. Hover an icon to see its name and shortcut.
- **Search box and filter chips** (All, Text, Images, Files, Pinned).
- **The list**: each clip shows when it was copied, its size and the app it came from, plus a badge such as JSON, JWT or URL when DevTools recognises it.
- **Bottom bar**: Paste, Copy, Actions (smart actions), Pin, Edit, Delete for the selected clip, and Clear all.

The right-click menu does the same things. **Pause** stops capturing until you press it again (the icon turns into a play button). You can also pause from the tray icon menu. The paused state is kept after a restart.

## Smart actions

DevTools recognises common kinds of text and offers one-click actions for them: in the **Actions** button (Ctrl+.), at the top of the right-click menu, and as a badge in the list.

| Clip | Actions |
|---|---|
| JSON | copy formatted, copy minified, open in the JSON tool |
| JWT (also with "Bearer ") | decode it |
| URL | open in the browser or the API tester, check its certificate, copy URL-decoded, make a QR code |
| Email address | write an email |
| GUID | copy in upper case, lower case or without dashes |
| Unix timestamp (seconds or milliseconds) | copy as local time or UTC; the date is shown in the status line |
| Colour (#hex, rgb(), hsl()) | open in the colour picker, copy in another format; a swatch shows in the list |
| Cron expression | explain it (the meaning is shown in the status line) |
| IP address or host:port | ping / test in Network tools, watch it in the host monitor, check its certificate |
| File or folder path that exists | open, show in Explorer, hash the file or search the folder |
| Base64 that decodes to text | copy the decoded text, open in Transform |
| Table: tab-separated (copied from Excel, a database tool, Google Sheets) or CSV | copy as JSON, YAML, XML, CSV (or tab-separated for Excel) or a Markdown table; open in the converter |

Results that are copied land in the history like any other copy.

## Clipboard extras

- **Clean up text** (right-click a text clip, or the Actions button): trim, join lines, remove empty or duplicate lines, collapse spaces, change case, sort or reverse lines, number them, join with commas or split at commas, quote lines for SQL `IN (...)`. The result is copied.
- **Paste stack**: select several clips and choose **Paste one after another** (or start **Paste stack: collect what I copy next** from the palette or tray, then copy things). Each **Ctrl+Alt+Space** pastes the next one, in order; a small window shows what is left.
- **Merge selected clips...**: joins several text clips with a separator you pick (new line, blank line, comma, space, tab or your own).
- **Combine pictures**: select two or more image clips, right-click, and put them side by side or one under the other.
- **Delete automatically after a while** (Settings > Capture): rules such as `text:(?i)password 10` (delete matching text after 10 minutes) or `app:chrome 1440` (copies from Chrome after a day). Pinned clips are never deleted.
- **Sync between PCs** (Settings): pick a folder both PCs can reach (OneDrive, Dropbox or a network share). Text and picture clips, notes (with folders and pictures) and snippets are synced every 2 minutes; deleting on one PC deletes on the other, and for each note the newest version wins.

## Command palette

**Ctrl+Shift+Space** anywhere (or **Ctrl+K** in the picker, the grid icon, or the tray menu). Type a few letters and press Enter. It finds:

- every tool and action (Compare text, Settings, Theme: dark, Back up now, Lock secrets, Exit ...)
- every Toolbox page (JSON, JWT decoder, Regex tester ...)
- snippets (Enter pastes it into the app you came from)
- notes (opens it), saved API requests (opens it), and your recent clips (pastes it)

Matching is forgiving: `thm drk` finds "Theme: dark", `cmp` finds Compare.

## Snippets

Saved text you paste by name: tray menu **Snippets** or the palette (**Snippets** / **New snippet**). Type a snippet's name in the palette and press Enter to paste it into the app you were in. Placeholders are filled in when pasting:

`{date}` `{time}` `{datetime}` `{date:yyyy-MM-dd HH:mm}` (any .NET date format) `{guid}` `{clipboard}` `{user}` `{computer}` and `{input:Name}`, which asks you for a value (each name is asked once).

A few examples are created the first time.

## Secrets

An encrypted vault for passwords, API keys and tokens: the lock icon, **Ctrl+Shift+S**, or the tray menu.

- The first time, choose a master password (at least 8 characters). **It cannot be recovered**, so pick one you will remember.
- Everything is stored in `data\vault.dat`, encrypted with AES-256 and checked with HMAC-SHA256; the key comes from your master password (PBKDF2, 210,000 rounds). The file travels with the data folder.
- Each secret has a name, username, secret, website and notes. **Generate** makes a strong random password.
- **Copy** (or double-click a secret) puts it on the clipboard in a way that DevTools and Windows clipboard history do not record, and clears the clipboard after 30 seconds.
- The vault locks after 5 idle minutes, when you click **Lock** (Ctrl+L), and when its window closes. Both times can be changed in Settings.
- In the picker, right-click a text clip and choose **Move to secrets** to take it out of the history and into the vault.

## Toolbox

All the small developer tools in one window: the wrench icon, **Ctrl+B**, the tray menu, or each page by name from the command palette. Ctrl+PageUp / PageDown switch pages.

- **JSON, YAML, CSV, XML**: converts any of the four into any other. Paste the input (its format is detected, or pick it) and press **JSON**, **Minified**, **Sorted keys**, **YAML**, **CSV**, **Tab-separated** or **XML**. Tab-separated data (copied from Excel or a database tool) is recognised too, and **Tab-separated** converts back to it. CSV: the first row names the columns, `address.city` columns become nested objects (and back), any separator (`,` `;` tab `|`). XML: attributes become `@name` keys, repeated elements become lists. The input is checked as you type.
  - **Tree**: browse the data. Click a value and **Path & loop code** shows its path and ready-to-copy code that loads *your* kind of text, reads that value and loops over its list, in JavaScript, Python, C#, PowerShell and a command-line tool:
    - JSON: JSONPath (`$.store.books[1].title`), `JSON.parse`, `json.load`, `System.Text.Json`, `ConvertFrom-Json`, `jq`
    - YAML: the same paths with `js-yaml`, PyYAML, YamlDotNet, `ConvertFrom-Yaml`, `yq`
    - XML: XPath (`/library/book[2]/title`, `@id` for attributes) with `DOMParser`, ElementTree, LINQ to XML, `[xml]` / `SelectNodes`, `xmllint`
    - CSV / tab-separated: row and column (`rows[1]["name"]`) with Papa Parse, `csv.DictReader`, plain C#, `Import-Csv`, Miller (`mlr`); the right separator is filled in
    - **Code reads: the converted JSON** switches to code for the JSON version instead. Pick one language to see only that.
  - **Query**: JSONPath (`$.items[*].name`, `$..id`, `$.list[0:3]`), with a short cheat sheet.
  - **Compare...** compares the input with the clipboard (any of the formats), ignoring key order and formatting.
- **JWT decoder**: header, payload and the standard claims with readable dates ("expires in 2 h" / "EXPIRED"). Enter the secret to check HS256 / HS384 / HS512 signatures. Nothing is sent anywhere.
- **Regex tester**: matches are highlighted as you type, with a list of matches and groups and a **Replace** preview. Options: ignore case, ^ $ per line, . matches newline, ignore spaces. Matching stops after 2 seconds so a runaway pattern can't hang the window.
- **Cron expressions**: explains an expression in plain English and lists the next 12 runs. 5 fields, or 6 with seconds first; `@daily`, `@hourly` and friends; names like MON-FRI.
- **Generators**: GUIDs (several formats), passwords (length and character sets), lorem ipsum (words, sentences, paragraphs), and test data (names, emails, phones, addresses, companies, dates, amounts ...) as JSON, CSV or SQL INSERT.
- **QR code**: type text or a link; copy the image or save it as PNG. Error correction L / M / Q / H; up to a few hundred characters.
- **Colour picker**: **Pick from screen** shows a magnifier; click to take a pixel's colour (arrow keys move one pixel, Esc cancels) and its HEX is copied. Or type any colour (#hex, rgb(), hsl(), a name). Shows HEX, RGB, HSL, HSV, CMYK, C# and integer forms, lighter / darker shades, contrast with white and black text (WCAG), and your recent colours.
- **File hash**: drop a file (or click to choose one) to get MD5, SHA-1, SHA-256 and SHA-512 in one pass, even for big files. Paste the checksum from a download page into **Expected** to see whether it matches.
- **Ports**: what is listening on which port, with the process behind it ("who is using port 8080?"). Filter by port, process or address; untick Listening only to see connections too. Right-click a row to end its process, show its program file, or test the port.
- **Certificates**: type a host or URL to read its TLS certificate: days until it expires, names (SAN), issuer, chain, key, protocol and cipher.
- **Number bases**: a number in decimal, hex, binary (grouped), octal and base 36 at once; two's complement for negatives, signed views, bytes (big / little endian), and what it could be: a character, a size (KB / MB / GB), a Unix time, an IPv4 address, a colour.
- **Units**: length, weight, data size (KB vs KiB), data rate, time, speed, area, volume, temperature, pressure and energy. Type `5 km`, `100 F` or `3 GiB` and the unit is picked for you; every other unit is listed. Double-click a row to copy it.
- **Time & time zones**: type a Unix timestamp (seconds, ms, µs), a date, `now` or nothing: you get local time, UTC, ISO 8601, RFC 1123, Unix seconds / ms, "in 3 hours", ISO week, Excel and .NET ticks. Below, the same moment in the time zones you add (saved).
- **Markdown preview**: type or open Markdown and see it rendered (headings, lists, task lists, tables, quotes, links, images, code with colours). **Copy HTML**, **Save as...** (.html or .md), **Open in browser**.
- **Environment & PATH**: all your variables and the system ones, with New / Edit / Delete (yours freely; system ones need DevTools to run as administrator). The **PATH** tab lists each folder, marks missing ones and duplicates, and lets you add, edit, reorder, **Clean up** and **Save**. %VARIABLES% are kept. Programs started afterwards see the changes.
- **Processes & services**: processes with memory, CPU time and window title (sort by any column, filter, end a process, copy its command line, see its ports); services with their status and start type, and Start / Stop / Restart (needs administrator).
- **Timer & Pomodoro**: a countdown (with 1-60 minute quick buttons), a stopwatch with laps, and Pomodoro rounds (work, short and long breaks, all adjustable). It keeps running when the window is closed: the tray icon shows the time left and a notification pops up when time is up.
- **Mouse mover & clicker**:
  - **Keep me active**: every N seconds (default 60) it sends a **0-pixel mouse move**. The pointer doesn't move, but Windows counts it as you being there, so Teams / Slack stay *Available* and the screen doesn't lock. Or **nudge 1 px and back**, or no mouse input at all and just keep the PC awake. Options: keep the screen and PC awake, only act when you aren't using the PC yourself, stop after N minutes. Also in the tray menu (**Keep me active**) and the palette.
  - **Auto clicker**: left / right / middle, single or double, every N ms (50 ms minimum), a number of clicks or until stopped, where the mouse is or at a fixed point (**Pick the point** reads where you point within 3 s). It starts after 3 seconds so you can point at the target. **Esc stops it in any app**, and moving the mouse yourself stops it too (can be turned off).
  - Both keep running when the Toolbox is closed; the tray icon's tooltip shows that they are on.
- **Host monitor**: add the servers you care about (ping, or a TCP port such as 443). They are checked in the background every 10 s to 5 min, even while the window is closed. When one goes down (also when it is already down at the first check) an alert pops up in the bottom-right corner of the screen with a sound; it closes by itself after about 9 seconds (pointing at it keeps it open), and a green one shows when the host is back. **Silence 1 hour** or **Silence** on the alert, or right-click a host (silence for 1 hour, until tomorrow 8:00, or until you turn it back on), stops alerts for just that host; the list shows which hosts are silenced. Each row shows the latency and a small history graph.

## Image editor

Select an image clip (a screenshot, or a picture you copied) and press **F2** / **Edit**, or right-click it and choose **Edit image...**. **Edit the picture on the clipboard** in the command palette or the tray menu opens whatever picture is on the clipboard. Screenshots taken with Ctrl+Shift+X open here directly.

- **Tools** (letter = shortcut): Select (V), Crop (C), Arrow (A), Double arrow (D), Line (L), Box (R), Circle (E), Pen (P), Marker (H), Text (T), Number (N: 1, 2, 3 ... markers), Spotlight (S: darkens everything except the area), Magnifier (M: a round zoomed-in bubble), Blur (B: pixelates passwords and names), Speech bubble (I), and the eyedropper (K: picks a colour from the picture). Shift keeps lines straight and boxes square.
- **Change what you drew**: with Select, click a shape to select it, drag it to move it, drag its handles to resize it, Delete removes it, arrow keys nudge it. Changing the colour, line width, text size, **Filled** or **Dashed** restyles the selected shape. Double-click a text to edit it.
- **Style**: colour swatches, **Line** width (1-40 px, or [ and ]), **Text** size (8-300 px, or Ctrl+[ and Ctrl+]), **Filled** boxes and circles, **Dashed** lines.
- **Adjust**: black & white, sepia, invert, brightness / contrast (with a live preview), sharpen, soft blur. **Auto-trim** cuts away plain borders. Also crop, rotate, flip, resize (25 % ... 200 %) and add a border.
- **Undo / redo**: Ctrl+Z / Ctrl+Y, as many steps as you like, wherever the focus is in the window.
- **Zoom**: Fit (Ctrl+0), 100 % (Ctrl+1), Ctrl+mouse wheel or Ctrl + / Ctrl -.
- **Copy** (Ctrl+C), **Save to history** (Ctrl+S, replaces the original clip), **Save as file...** (PNG, JPEG or BMP), **Save smaller...** (JPEG with a quality slider and a smaller size, showing the file size before you save), **Text from image** (copies the text in the picture), **Open in Paint**.
- Closing with unsaved changes asks whether to save them to the history.

## Screenshots and text recognition

- **Ctrl+Shift+X** (or the tray menu / palette **Take a screenshot**) freezes the screen: drag an area, click a window to take just that window, or press Enter for the whole screen; Esc cancels. The shot is added to the history and opens in the image editor. **Take a screenshot in 3 seconds** gives you time to open a menu first.
- **Copy text from picture** (right-click an image clip, the palette, or **Text from image** in the editor) reads the text in a picture with Windows' built-in OCR and copies it. Nothing leaves your PC.

## Settings

Open with the gear icon, **Ctrl+,** or the tray menu.

- **Theme**: System (follows Windows' light / dark app mode, and switches live when Windows does), Light or Dark. Every open window changes at once.
- **Accent colour**: blue, purple, green, orange, pink or teal. Used for buttons, selection and the tray icon.
- **Text size**: Small, Medium or Large. Takes effect after a restart; the **Restart now** button does it for you.
- **Capture**: pause, history size, largest image / file and largest text that get stored, and **Never save copies from**: apps whose copies are ignored (password managers by default; right-click a clip to add the app it came from).
- **Secrets**: how long until the vault locks itself, and how long copied secrets stay on the clipboard.
- **Global shortcuts**: **Add...** gives any command of the palette (any tool, Toolbox page or action) its own keys, e.g. Ctrl+Alt+N for Notes or Ctrl+Alt+U for Units. Press the keys in the dialog. They work in every app; a shortcut another app already uses is marked as taken.
- **Encryption**: **Encrypt my data files...** encrypts the clip history, API tester data, notes, snippets, monitored hosts and colours (AES-256). On this PC they open with your Windows account, without a password. Anywhere else (another PC or Windows user, a restored backup, someone you give the folder to) they open with your Secrets master password. **Turn off** makes them plain text again. Pictures, copied files and note attachments are not encrypted. If you sync, choose **Use the key from the sync folder** on the other PC.
- **Sync between PCs**: see Clipboard extras.
- **Backup**: **Back up now** zips the whole data folder (clips, notes, secrets - still encrypted - API collections, settings). Pick the backup folder (point it at OneDrive or Dropbox to keep a copy in the cloud), turn on automatic backups (every 6 hours, day or week; the newest 10 are kept), or **Restore...** a backup (the current data is backed up first, then DevTools restarts). Automatic backups are off by default because they contain your clipboard history.
- **Start with Windows**: adds or removes a shortcut in your Startup folder.
- **Data**: open the data folder, clear the history, and see how much space it uses.
- A list of all keyboard shortcuts.

## Compare (like WinMerge)

Open it any time from the tray menu (**Compare text**) or the picker (**Compare** button / Ctrl+D). It starts empty. Both sides are editors: click into either side and type or paste, and the comparison updates as you type. You can also fill a side with:

- **Open...** (Ctrl+O): pick a file, or drop a file onto the left or right half (drop two files to fill both sides)
- **From clipboard**: replace the whole side with the clipboard text, or with a text file you copied in Explorer
- Ctrl+Shift+V while typing in a side: pick a clip, and it's pasted where the cursor is

To compare two clips, select them in the picker (click one, Ctrl+click the other) and press **Compare**.

Files are read the way they are stored (UTF-8, UTF-8 with BOM, UTF-16 or Windows ANSI) and saved back in the same encoding and line endings.

The Compare window shows both sides next to each other:

- Changed lines are yellow, with the changed words highlighted. Lines only on the left are red, lines only on the right are green.
- The scrollbar marks where every difference is (yellow changed, red removed, green added, blue the current one), so even one changed line in a huge file is easy to find. Drag the scrollbar, or click a mark to jump there.
- **Show whitespace** (Ctrl+W) shows spaces as `·`, tabs as `→`, and each line's ending as `CRLF`, `LF` or `CR`.
- **Ignore case** and **Ignore whitespace** hide differences you don't care about.
- **Normalize** (structured compare): formats both sides the same way - JSON with its keys sorted, XML with attributes sorted, SQL formatted - so only real differences are left. Your files and clips are not changed.

| Key | Action |
|---|---|
| Alt+Down / Alt+Up | Next / previous difference |
| Alt+Right | Copy the current difference to the right side |
| Alt+Left | Copy the current difference to the left side |
| Ctrl+Z / Ctrl+Y | Undo / redo |
| Ctrl+C / Ctrl+X / Ctrl+V / Ctrl+A | Copy / cut / paste / select all (in the side you clicked) |
| Ctrl+S | Save the changed sides back to their files or clips |
| Ctrl+W | Show / hide whitespace |

Close the window with its X button; it asks to save unsaved changes. (Esc does not close it, so you can't lose work by accident.)

**Save** writes a side back to where it came from: a file is overwritten, a clip is updated. Text you pasted or typed is saved with **Save as...** to a new file. **Copy all** puts a whole side on the clipboard.

## Compare folders

Open it from the tray menu (**Compare folders**) or its icon in the picker's top bar, or drop two folders onto the Compare window. Pick the two folders (Browse, or drop a folder onto each box) and press **Compare** (F5).

The result is one tree of both folders. Each file and folder shows whether it's **same**, **different** (yellow), **only left** (red) or **only right** (green), with the file sizes on both sides and, for folders, how many differences are inside. The status bar sums it up.

- Double-click a file (or press Enter) to open it in the text Compare window.
- Right-click: copy a file or folder to the other side (overwrites, then compares again), open either one, or show it in Explorer.
- **Expand differences** opens every folder that has differences; **Only show differences** hides identical files.
- **Compare file contents** compares files byte by byte. Turn it off to compare only size and date, which is faster for huge folders.
- `.git`, `.svn`, `.hg`, `.vs`, `node_modules`, `bin` and `obj` are skipped unless you untick that box.

## Find in files

Open it with Ctrl+Shift+F in the picker, its icon in the picker's top bar or the tray menu (**Find in files**). Pick a folder, type what to find and press Enter.

- **Files** limits which files are searched, for example `*.cs;*.ps1;*.txt` (`*` = all).
- **Match case**, **Whole word** and **Regular expression** work like in a code editor. **Subfolders** searches the whole tree.
- Every matching line is listed with its file and line number. The pane below shows the lines around the selected match, with the match highlighted.
- Double-click a match (or press Enter) to open the file at that line in VS Code if it's installed, otherwise in its default app. Right-click for more: open in Compare, show in Explorer, copy the path or the line.
- Binary files, files bigger than `MaxTextMB`, and the same tool folders as in folder compare are skipped. Text is read as UTF-8, UTF-16 or Windows ANSI, whichever the file uses.
- Esc stops a running search.

## Transform

Open it with Ctrl+T in the picker (the selected clip becomes the input), the right-click menu on a clip, its icon in the picker's top bar, or the tray menu (**Transform text**). Pick an operation on the left (type in the box to find one, e.g. `hex`, `aes`, `json`); the output updates as you type. **Use as input** (Ctrl+Enter) moves the output up so you can chain steps, e.g. JSON minify, then Base64 encode.

| Group | Operations |
|---|---|
| Encode | text to/from hex, binary, decimal bytes; Base64, Base64URL, Base32; URL and HTML encode/decode; `\uXXXX` and JSON string escape/unescape |
| Hash | MD5, SHA-1, SHA-256, SHA-384, SHA-512, CRC32, HMAC-SHA256 (with a key) |
| Encrypt | AES-256 encrypt/decrypt with a password; Windows protect / unprotect (only your Windows account can open it, no password needed); XOR with a key; ROT13, ROT47, Caesar shift |
| Fun | Morse code (both ways), NATO phonetic alphabet, reverse, upside-down text, leet speak |
| Case | UPPER, lower, Title, Sentence, camelCase, PascalCase, snake_case, kebab-case, CONSTANT_CASE, iNVERT |
| Lines | sort A-Z / Z-A / by length, reverse, shuffle, remove duplicates, remove empty, trim, number, join with / split at a separator |
| Format | JSON pretty print / minify / sorted keys, SQL format / minify, XML pretty print (optionally with sorted attributes) / minify, HTML pretty print, decode a JWT (header, payload, readable dates), strip HTML tags, collapse whitespace |
| Extract | emails, URLs, IP addresses, numbers, or the matches of any regular expression (duplicates removed) |
| Numbers | a number in decimal / hex / binary / octal at once, hex or binary to decimal, Unix time to date and back |
| Info | characters, words, lines, bytes, reading time and the most used words |
| Generate | GUIDs, strong passwords, random hex bytes, lorem ipsum (**Run again** makes new ones) |

AES-256 uses a key made from your password with PBKDF2-SHA256 (200,000 rounds, random salt) and checks the result with HMAC-SHA256, so a wrong password or a changed text is reported instead of producing garbage. Keep the password: without it the text can't be recovered.

## Network tools

Open with Ctrl+Shift+N in the picker, the right-click menu on a clip, its icon in the picker's top bar, or the tray menu. If the selected clip is a host name, IP address or URL, it's filled in; for a URL like `https://server:8443/path` the host and port are taken from it (https = 443, http = 80). Recently used hosts are in the Host drop-down.

- **Ping** (Enter or F2): sends *Ping count* pings and shows each reply, then the loss and the min / average / max time. **Ping until stopped** (Shift+Enter) keeps going until Stop or Esc.
- **TCP test** (Ctrl+Enter or F3): tries to connect to each port. Each port is **open** (with the connect time), **closed** (refused) or **no answer** (a firewall dropped it, or the host is down). *Port(s)* can be one port (`443`), a list (`80,443,3389`) or a range (`1-1024`); big ranges are scanned 64 at a time and only open ports are listed. **Common ports** checks the usual services (SSH, HTTP/HTTPS, RDP, SMB, SQL Server, MySQL, PostgreSQL ...) and names them.
- **nslookup** (F4): runs Windows' `nslookup` for the host. Pick the record type (A + AAAA, MX for mail servers, TXT, CNAME, NS, SOA, SRV, PTR for an IP's name ...) and optionally which DNS server to ask (e.g. `8.8.8.8`).
- **Traceroute** (F6): every router on the way to the host (tick *Resolve hop names* to see their names; slower).
- **This PC**: your network adapters with their IP addresses, gateways, DNS servers and MAC addresses.
- *Timeout ms* applies to pings and TCP connects. **Copy** copies all output; **Clear** empties it.

## API tester

A Postman-style HTTP client. Open it with Ctrl+Shift+A in the picker, the right-click menu on a clip (**Open in API tester**), its icon in the picker's top bar, or the tray menu. If the selected clip is a URL it's loaded as a GET; if it's a `curl` command, the whole request is imported.

**Request**

- **Examples...** (left, above the collections) loads a ready-made request to learn from: GET JSON, query parameters, POST JSON, PUT, DELETE, form fields, headers, Bearer and Basic auth, a real log-in, cookies, status codes.
- Method (GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS) and URL. Press **Send**, Enter in the URL box, or Ctrl+Enter. While it runs, Send turns into Cancel (or press Esc).
- Paste a `curl ...` command into the URL box to import it: method, URL, headers, body, form fields, `-u` user, Bearer token, `-k` and `-L`.
- **Params**: the query string as a table, kept in sync with the URL both ways. Untick a row to leave it out without deleting it.
- **Headers**: name / value table; untick to switch a header off.
- **Copy / paste rows** in every table (params, headers, form fields, and a chain card's *Take from response*): select cells in one or more rows and press Ctrl+C, then Ctrl+V in another table - each line becomes a row, also while a cell is being edited. Lines like `Content-Type: application/json` or `name=value`, and rows copied from Excel, are split into name and value. Right-click a table for Copy rows / Paste rows / Delete rows.
- **Auth**: Bearer token, Basic auth (username + password), or API key sent as a header or query parameter.
- **Body**: JSON, Text, XML (with **Beautify**), Form URL-encoded, or Form-data (multipart). For a file field use **Add file...** or type `@C:\path\file` as the value. The Content-Type is set for you unless you add your own header.
- **Settings**: timeout, follow redirects, verify SSL certificate (untick for self-signed test servers).
- **Code**: the request as a `curl` command or a PowerShell `Invoke-WebRequest` script, ready to copy.

**Response**

- Status (green 2xx, blue 3xx, yellow 4xx, red 5xx or errors), total time, time to first byte, size, HTTP version, and where a redirect ended up.
- **Body**: pretty-printed and colour-coded JSON (or formatted XML); untick **Pretty** for the raw text. **Copy body** and **Save body...** (also for images, PDFs and other binary responses).
- **Headers**, **Cookies** (each `Set-Cookie` with its attributes) and **Request**: the exact request that was sent, headers and body included.
- Errors are spelled out: timeouts, unknown hosts, refused connections, untrusted SSL certificates.

**Request chains** (the **Request chains...** button in the API tester, or **API chains** in the palette)

Build a flow of requests on a canvas, for example: log in, then use the cookie or token in the next calls.

- **Folders**: the **CHAINS** list on the left holds your chains in folders. Right-click anywhere in it for **New chain** / **New folder** (on a folder: inside it; folders can be nested), and drag chains or folders onto a folder to move them. Right-click a folder to rename or delete it (what's inside moves up a level). The **Examples** folder is always first and holds the example chains.

- **Add cards**: drag a template (*Log in (JSON) -> {{token}}*, *Log in (form) -> session cookie*, *Request with Bearer {{token}}*, an empty request) or any saved request from the list on the left onto the canvas (or double-click it), or right-click the canvas. You can also drop a link or a `curl` command (from a browser, an editor or a chat) to get a card for it, or a `.devchain.json` file to import a chain. With a card selected, **Add request** adds the next one already linked.
- **Chain them**: drag from a card's blue dot (right side) to another card. The arrow means "runs after". Loops are refused. Click an arrow and press Del to remove it. **Select several cards** with Ctrl+click, by dragging a box on empty space, or Ctrl+A; then drag one to move them all, **Del** deletes them, **Ctrl+C / Ctrl+V** copies them with the arrows between them (also into another chain). Scroll with the mouse wheel (Shift = sideways) or drag with the middle button; **Arrange** lines the cards up.
- **Edit a card** on the right: name, method, URL, headers, body. **Open in API tester** edits everything (auth, params, form-data ...) and **Take from API tester** brings it back.
- **Take from response**: save values into `{{variables}}` for the later steps - a JSON path (`$.token`, `$.data.items[0].id`), a response header, a cookie, a regex (first group), the status or the whole body.
- **Cookies** a response sets are sent along with the next requests to the same site, like a browser (**Send cookies along**).
- **Pick a value** (tab next to Result): after a step has run, its response is shown as a tree - body, headers, cookies, status. Double-click a value (a token, an id ...): DevTools makes the *Take from response* rule for you, sets the variable straight away and copies `{{name}}`; paste it into the URL, a header or the body of a later step.
- **Copy between requests**: right-click a card > **Copy** the whole request, its headers, body or auth; right-click another card > **Paste into this card** (headers are added, body and auth replaced). **Ctrl+C / Ctrl+V** on the canvas copy a card - also into another chain. The API tester has the same under **Copy / paste** (next to its tabs), so requests and their parts move both ways between the API tester and chains. What's copied is a small JSON note, so it can also be sent to a colleague as text.
- **Variables...** sets start values (`baseUrl`, `user`, `password` ...); an API tester environment can be used as well.
- **Run chain** (F5) runs the steps in order; each card turns green or red with the status, time and what it set. Steps after a failed or skipped step are skipped. **Run selected** (Shift+F5, or right-click) runs only the selected cards, in chain order, with the variables and cookies of the last run - e.g. log in once, then re-run just the steps you are working on. The **Result** tab shows the request sent and the full response, **Variables & cookies** the current values.
- **Run only if** (a card's **If & save** tab): the step runs only when its condition is true, otherwise it's skipped (yellow, with what was compared). Compare with `==` `!=` `>` `<` `>=` `<=` `contains` `startsWith` `endsWith` `matches` (regex); numbers are compared as numbers, text ignoring case. A value on its own (`{{token}}`) is true when it isn't empty; combine with `and` / `or`, negate with `not`. `{{lastStatus}}` is the status of the step that ran just before. Examples: `{{count}} > 0`, `{{role}} == admin`, `{{lastStatus}} == 401 or {{token}} == ''`. Tick **Run even if a step before it failed or was skipped** for error branches. Cards with a condition show an **if** mark.
- **Go to** (a card's **Go to** tab): after the step has run, the first rule whose *If* is true decides where the chain goes next - **back** to an earlier step (repeat, retry, poll until something is done), **forward** (the steps in between are skipped), to **itself**, or **(end the chain here)**. An empty *If* means always; **Wait ms** pauses first (handy for polling). Rules are drawn as dashed yellow arrows with their condition. A step runs at most 100 times per run, so a loop that never ends is stopped.
- **Save the response to a file** (**If & save** tab): a path such as `C:\results\orders-{{timestamp}}.json` - `{{timestamp}}`, `{{date}}`, `{{time}}` and your variables work in it; without a folder it goes to *Documents\DevTools API results*. Save the body only (binary bodies such as images are saved as they are) or status + headers + body, and overwrite or add to the end. Cards that save show a **save** mark. **Share > Save all results of the last run to a folder...** writes every step's request and response, one file per step.
- **Examples** (top bar, or the **Examples** folder on the left) open a ready-made chain, with notes on what each step does. Your changes are kept; right-click it > **Reset to the original example** to start over. Most run against free public test services, so they work straight away:
  - *Log in, then use the token* - POST a log-in, save `accessToken` as `{{token}}` and `id` as `{{userId}}`, then call with `Authorization: Bearer {{token}}`
  - *Session cookie* - a step gets a cookie, the next one sends it by itself
  - *Read, then create and change* - one step feeding three others; a JSON body built from `{{variables}}`
  - *Headers, regex and status* - Regex, Header and Status rules, a bracket JSON path, and a step that may fail without stopping the chain
  - *Conditions and go to (offline)* - runs on the Test API: skips the log-in when already logged in, loops "add an item" until there are 5, saves the list to a file, and a step that only runs for one user
- **Share** exports the chain to a `.devchain.json` file, or copies it as text to paste into a chat or email; you choose whether variable values (passwords, tokens) go along. Your colleague uses **Share > Import from a file / from the clipboard**; it comes in as a new chain and tells them which variables to fill in.
- Chains are saved in `data\api\chains.json`, their folders in `data\api\chainfolders.json`.

**Test API** (button in the API tester and in API chains, or *Test API: start / stop* in the palette)

A small practice API that runs inside DevTools on this PC only (`http://127.0.0.1:8799`) - no internet, nothing installed, fresh data every start. Starting it also creates the environment **Local test API** (`baseUrl`, `user` = demo, `password` = demo). Users: `demo / demo` and `ann / secret`.

| Endpoint | What it does |
|---|---|
| `POST /login` | JSON `{"username":"demo","password":"demo"}` -> `{"token":...,"userId":1}` and a `session` cookie; wrong password -> 401 |
| `POST /login-form` | the same as a form (`username=demo&password=demo`) -> only the cookie |
| `GET /me` | who you are - needs `Authorization: Bearer <token>` or the cookie, else 401 |
| `GET /items`, `POST /items`, `GET/PUT/DELETE /items/{id}` | a list you can change; POST answers 201 with the new id, a missing id 404 |
| `GET /csrf` | a token in the `X-CSRF-Token` header and in the HTML; **DELETE** needs it (else 403) |
| `GET /status/{code}`, `GET /slow?ms=2000`, `ANY /echo` | any status, a slow answer, and your request sent back |

The menu also opens the full list in the browser, shows the **requests it received**, and opens the example chain **Local test API (offline)**: log in, Bearer token, cookie-only call, create, CSRF via Header and Regex rules, delete, check for 404.

**Collections, history and environments**

- **Save** (Ctrl+S) stores the request in a collection folder; Ctrl+Shift+S saves a copy. Click a saved request to open it; right-click to rename / move, duplicate or delete it (or a whole folder). Right-click anywhere in the list (also on empty space) for **New folder...** and **New request**; on a folder, **New request here** saves into it with Ctrl+S. Empty folders stay until you delete them.
- **History** keeps the last 100 requests sent, with their status and time. Click one to load it again.
- **Environments** (the **...** button next to the Environment list) hold variables. Write `{{name}}` anywhere (URL, params, headers, auth, body) and it's replaced with the value from the selected environment, e.g. `{{baseUrl}}/users` with `baseUrl = https://api.example.com`. Unknown variables are reported in the status bar.
- Everything is kept in `data\api\` (collections, history, environments, and the last request, which reopens next time).

## Git

**Git** in the command palette or the tray menu. It uses the `git.exe` already on the PC (Git for Windows, or the one inside GitHub Desktop); DevTools installs nothing. Without git the window just says that git isn't installed.

- **Repository**: open any folder (if it isn't a repository yet you can `git init` it), or **Clone...** from a URL. Recent repositories are remembered.
- **Graph** (middle): every branch with coloured lanes, merge commits, and badges for branches, remote branches, tags and HEAD. Find a commit by text, hash, author or branch. Click a commit for its message and files; double-click a file to compare it with the version before.
  - Right-click a commit: check it out, create a branch or tag there, merge it into your branch, rebase onto it, cherry-pick, revert, reset (soft / mixed / hard), copy its hash.
- **Changes** (left): staged and unstaged files. Space or **Stage** / **Unstage** (or **All**), **Discard** (asks first), double-click to compare with the last commit, open the file, add it to `.gitignore`. Write the message and **Commit** (Ctrl+Enter), **Commit & push**, or **Amend last commit**.
- **Branches**: switch (double-click or the Branch list at the top), new, rename, delete, merge, rebase, push, check out a remote branch. **Tags**, **Stashes** (stash with new files, apply, pop, show, drop) and **Remotes** (add, change URL, fetch, remove).
- **Fetch**, **Pull**, **Push** (the first push sets the upstream) and **Force push** (with lease) run in the background; the line under the toolbar shows your branch, its upstream and how many commits are ahead / behind.
- A merge, rebase, cherry-pick or revert with conflicts shows a yellow bar: fix the files (double-click opens them), **Mark resolved**, then **Continue** - or **Abort**.
- **Any git command**: type it in the box at the bottom (`log --oneline -5`, `bisect start`, `submodule update` ...) and press Enter. Everything DevTools runs is shown in the log there.
- Passwords for remotes come from Git Credential Manager; DevTools never asks for them itself.

## Notes

Open with **Notes** in the picker, Ctrl+N, or the tray menu. The list on the left shows all notes, newest first; the search box finds notes by title or text.

Each note is a free page, like OneNote:

- **Click anywhere** on the page and type. Each spot you click becomes its own text box.
- **Paste anywhere**: click a spot and press Ctrl+V. A screenshot lands right there as a picture; text becomes a text box there. Pasting a picture inside text that's already there puts it inline in that text.
- **Move things**: drag a picture anywhere, or drag a text box by the bar that appears at its top when you point at it.
- **Resize**: drag a picture's bottom-right corner, or a text box's right edge.
- Empty text boxes disappear on their own.

Working with several things at once:

- **Select**: click a picture or a text box's bar. Ctrl+click adds or removes one. Drag on empty space to draw a box: everything it touches is selected. **Select all** (or Ctrl+A on the page; inside a text box, Ctrl+A twice) selects everything.
- **Move**: drag any selected item and all of them move together. Arrow keys nudge the selection (Shift+arrow for bigger steps).
- **Copy / Cut / Paste** (Ctrl+C / Ctrl+X / Ctrl+V, or **Copy** on the toolbar): with nothing selected, Copy takes the whole page. Pasting into a note (where you clicked) brings back the same layout with text and pictures; pasting into other apps gives the text (and the picture, if exactly one is selected).
- **Delete** (Del, or **Delete selected**): removes everything selected.
- **Undo / redo** (Ctrl+Z, Ctrl+Y or Ctrl+Shift+Z, also in the right-click menu): works for everything on the page - typing, pasting text or pictures, moving, resizing, formatting and deleting. Typing is undone in chunks (each pause starts a new step). The history is per note and starts fresh when you open a note.
- Esc inside a text box selects that box, so Delete / Ctrl+C / arrows then act on the whole box.
- Right-click the page or an item for the same actions plus Bring to front / Send to back.
- Text is rich: **B**, *I*, U, headings and bullet lists (buttons or Ctrl+B / Ctrl+I / Ctrl+U) for the text box you're in.
- **Folders**: **Folder** (Ctrl+Shift+N) makes a folder inside the selected folder (or at the top when no folder is selected); right-click a folder for **New subfolder...**. Right-click empty space in the list for **New note** / **New folder...**, or a note for **New folder...** next to it. Folders can be nested as deep as you like and show as a tree you open and close with a click (or the arrow keys); the number is how many notes are inside, subfolders included.
  - Drag a note onto a folder to move it there, or right-click it and choose **Move to folder**.
  - Drag a folder onto another folder to move it there with everything inside; drag it onto empty space (or use **Move to the top level**) to take it out.
  - Right-click a folder to rename or delete it. Deleting never deletes notes: its notes and subfolders move up one level.
  - **New note** creates the note in the selected folder. While searching, folders open to show their matches.
- Drop picture files onto the page to place them; other files are attached below the page. Double-click an attachment to open it; right-click to show it in Explorer or remove it.
- The page grows as you add things; scroll to get more room.
- Notes save automatically about a second after each change. Notes from before pages existed open as one text box at the top.
- **Code**: put the caret in a paragraph (or select lines) and press **Code** to make it a code block: monospace, shaded and coloured for its language (detected, or pick PowerShell, C#, JavaScript, Python, SQL, JSON, XML, Bash, YAML ...). **Back to normal text** undoes it.
- **More** button:
  - **Remind me...**: pick a date and time (or In 10 min, In 1 hour, Tomorrow 9:00 ...) and whether it repeats (every day, weekday, week or month). At that time a notification pops up; click it to open the note. The list shows upcoming reminders. **New reminder...** in the palette or tray makes a quick one.
  - **Lock with the master password**: the note's text and pictures are encrypted with your Secrets master password (the vault must exist). The title stays visible; the text is left out of search. A locked note opens without asking while Secrets are unlocked, otherwise press **Unlock** and enter the master password. It locks again when Secrets lock. **Remove the lock** decrypts it for good. Attachments are not encrypted.
  - **Export** as Markdown (.md), web page (.html) or text (.txt); pictures and attachments go into a `<name>_files` folder next to it. **Copy as Markdown** and **Preview as Markdown** too.
- In the picker, right-click clips and choose **Save to new note**, or **Add to open note** while the Notes window is open. They're placed on the page one below the other: text as text, images as pictures, files as attachments.

## Data

Everything is stored next to the script in `data\`:

- `history.json`: your clips (plain text unless you turn on Settings > Encryption)
- `images\`: screenshots and copied pictures, saved as PNG
- `files\`: copies of the files and folders you copied
- `notes\`: `index.json` lists your notes, `folders.json` your note folders; for each note, `<id>.page.json` is its page (text boxes and picture positions), `<id>.images\` holds its pictures and `<id>\` its attachments; a locked note is one encrypted `<id>.page.enc`
- `vault.dat`: your secrets, encrypted (see Secrets)
- `keys.dat`: only when data encryption is on - the data key, wrapped for your Windows account and for your master password
- `snippets.json`, `hosts.json` (host monitor), `colors.json` (recent colours), `api\` (API tester collections, history and environments)
- `settings.json`:
  - `Paused`
  - `MaxItems`: how many unpinned clips to keep (default 500; older ones are removed together with their images and files)
  - `MaxFileMB`: size limit for copied files and images (default 10). Anything bigger is not saved. Note attachments have no limit.
  - `MaxTextMB`: size limit for copied text (default 50). Bigger text is not saved. Texts over 256 KB are kept in `data\texts\` so that `history.json` stays small and fast.

Copy the whole folder to a USB stick and your history and notes come with it. Settings > Backup makes zip backups of it.

## Images and files

- Screenshots (Win+Shift+S, Print Screen, Snipping Tool) and images copied from apps or browsers are saved with a thumbnail in the list. Search for "image" to show only those.
- Files and folders copied in Explorer are saved only when their total size is under `MaxFileMB`. A copy is kept in `data\files\`, so pasting still works after the original is moved or deleted. Bigger copies are skipped without a message.
- Pasting an image or file clip puts it back on the clipboard exactly as when you copied it, so Ctrl+V works in Explorer, chat apps, Paint and so on.

## Good to know

- If the clipboard holds both text and an image (for example cells copied from Excel), the text is saved.
- Clips that password managers mark as private (for example KeePass) are not recorded, and neither are copies from the apps in Settings > Never save copies from.
- Ctrl+Alt+V is AltGr+V on some keyboard layouts. If that clashes with a character you type, pause DevTools while you need it.
- While DevTools runs, it takes over Ctrl+Shift+V everywhere. Apps that use that shortcut for "paste as plain text" won't get it. If another clipboard tool (such as CopyQ) already uses Ctrl+Shift+V, DevTools still catches it, so run only one of them.
- Troubleshooting: set the environment variable `POWERCLIP_DEBUG=1` before starting to get a log in `data\debug.log`. (In that mode DevTools also runs PowerShell commands placed in `data\debug-cmd.ps1`, which is used for automated testing, so don't leave the variable set.)
