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
- **Top bar**: your **favourite** tools (Notes, Compare and API tester until you change them), then the Toolbox (every tool) and the Command palette, then Pause / Resume, Settings and Exit. Hover an icon to see its name and shortcut. From here Compare compares the two selected clips, and API tester / Transform / Network tools start from the selected clip.
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

- **Links are kept**: when you copy a link that shows only its title (from a browser, Teams, Outlook...), the clip keeps the link. Every linked title gets its address after it in the text, like `Release notes (https://...)`, so it is searchable and pastes into plain-text apps; and pasting into apps that understand formatting (Teams, Outlook, Word, a browser editor) gives the real clickable links again.
- **Clean up text** (right-click a text clip, or the Actions button): trim, join lines, remove empty or duplicate lines, collapse spaces, change case, sort or reverse lines, number them, join with commas or split at commas, quote lines for SQL `IN (...)`. The result is copied.
- **Paste stack**: select several clips and choose **Paste one after another** (or start **Paste stack: collect what I copy next** from the palette or tray, then copy things). Each **Ctrl+Alt+Space** pastes the next one, in order; a small window shows what is left.
- **Merge selected clips...**: joins several text clips with a separator you pick (new line, blank line, comma, space, tab or your own).
- **Combine pictures**: select two or more image clips, right-click, and put them side by side or one under the other.
- **Delete automatically after a while** (Settings > Capture): rules such as `text:(?i)password 10` (delete matching text after 10 minutes) or `app:chrome 1440` (copies from Chrome after a day). Pinned clips are never deleted.
- **Sync between PCs** (Settings): pick a folder both PCs can reach (OneDrive, Dropbox or a network share). Text and picture clips, notes (with folders and pictures) and snippets are synced every 2 minutes; deleting on one PC deletes on the other, and for each note the newest version wins.

## Command palette

**Ctrl+Shift+Space** anywhere (or **Ctrl+K** in the picker, the grid icon, or the tray menu). Type a few letters and press Enter. It finds:

- every tool and action (Compare, Settings, Theme: dark, Back up now, Lock secrets, Exit ...)
- every Toolbox page (JSON, JWT decoder, Regex tester ...)
- snippets (Enter pastes it into the app you came from)
- notes (opens it), saved API requests (opens it), and your recent clips (pastes it)

Matching is forgiving: `thm drk` finds "Theme: dark", `cmp` finds Compare.

**Favourites from the palette**: select a tool and press **Ctrl+D** (or right-click it > **Add to favourites**); again to remove it. Favourites have a star, come first when nothing is typed, and show on the picker's top bar, in the Toolbox and in the tray menu.

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

**Every tool lives here**, in groups: the wrench icon, **Ctrl+B**, the tray menu, or any tool by name from the command palette. The sidebar lists:

| Group | Tools |
|---|---|
| Clipboard & notes | Clipboard history, Notes, Snippets, Secrets, Paste stack |
| Text & data | Transform, JSON / YAML / CSV / XML, Regex tester, JWT decoder, Markdown preview, Number bases, Units, Cron expressions, Time & time zones, Generators |
| Encode & share | QR code, Hide secret messages, Code to image |
| Files | Compare, Find in files, File hash, Log viewer |
| Web & API | API tester, API chains, Test API |
| Data | Diagram studio, SQL client |
| Network | Network tools, DNS lookup & whois, Subnet calculator, Host monitor, Ports, Certificates, Certificate maker |
| System | Environment & PATH, Processes & services, Git |
| Screen & productivity | Screenshot, Text from a picture (OCR), Edit clipboard picture, Colour picker, Screen recorder (GIF), Timer & Pomodoro, Reminder, Mouse mover & clicker |

Tools with an arrow open in their own window; the others open on the right. Type in **Search** to filter the list (Enter opens the first match). Ctrl+PageUp / PageDown switch pages.

**Favourites**: right-click any tool > **Add to favourites** (a star), or press **Ctrl+D** on it in the command palette. Favourites are listed first in the Toolbox, become icons on the picker's top bar and come first in the tray menu; right-click again (or the icon on the top bar) to remove one. The tray menu has the same groups as submenus, and the command palette shows each tool's group.

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
  - **Language**: write the pattern the way your language wants it - .NET (C#, PowerShell), JavaScript, Python, Java / Kotlin, PHP (PCRE), Go (RE2) or grep -E / sed -E (POSIX). DevTools tests it with that language's rules where they differ (`\d` and `\w` are ASCII-only in JavaScript, Java, PHP and Go; Python's `(?P<name>...)`; POSIX classes like `[[:digit:]]`; `\h` and `\R` in PHP / Java; a pasted `/pattern/gi` or `#pattern#i` takes its flags from the literal) and the replacement syntax (`$1`, `\1`, `\g<name>`, `$<name>`, `&`). It warns about what the language can't do, e.g. no lookarounds or back-references in Go, no lazy quantifiers in POSIX, no `\A` in JavaScript.
  - **Code** tab: ready-to-paste code that uses the pattern (and the replacement) in the chosen language, correctly quoted, with the flags from the checkboxes.
  - **Examples**: email, URL, IPv4, dates (with a reorder-to-DD.MM.YYYY replace), time, GUID, phone, numbers, hex colours, quoted strings, repeated words, key = value, log lines with named groups, HTML tags, JSON keys, password rules with lookaheads, trailing spaces, empty lines, text between two words, camelCase to snake_case. Each comes with sample text.
  - **Cheat sheet** tab: the common tokens with what they mean; double-click one to put it into the pattern (or into Replace for `$1` ...).
- **Cron expressions**: explains an expression in plain English and lists the next 12 runs. 5 fields, or 6 with seconds first; `@daily`, `@hourly` and friends; names like MON-FRI.
- **Generators**: GUIDs (several formats), passwords (length and character sets), lorem ipsum (words, sentences, paragraphs), and test data (names, emails, phones, addresses, companies, dates, amounts ...) as JSON, CSV or SQL INSERT.
- **Log viewer**: open or drop a log file and watch it live - new lines appear as they are written (like `tail -f`), even for big files (the last 16 MB are loaded). ERROR / FATAL / Exception lines are red, WARN yellow, DEBUG / TRACE grey. **Filter** keeps only matching lines (text or regex, matches highlighted; **Hide matching lines** does the opposite; **Errors** / **Warnings** are one click). Scrolling up pauses following; End or **Follow new lines** resumes. Click / Shift+click / drag selects lines, Ctrl+C copies them. A log that gets rotated or emptied is read again from the start.
- **Subnet calculator**: `192.168.1.10/24`, `10.0.0.0 255.255.252.0` or `2001:db8::/48` - network, mask, wildcard, broadcast, first and last host, usable hosts, private / public, binary. **Split into** smaller networks (/25, /26 ...) and **Is this address inside?**.
- **DNS lookup & whois**: any record type (A, AAAA, CNAME, MX, TXT, NS, SOA, SRV, PTR, CAA, or all common ones at once) from this PC's DNS, Cloudflare, Google, Quad9 or any server you type; an IP looks up its name. **Whois** asks the registry (and the registrar) who owns a domain or IP. Runs in the background.
- **Certificate maker**: make a **self-signed certificate** (for local HTTPS: names like `localhost`, `*.dev.local`, IPs; RSA 2048 / 4096 or ECDSA P-256 / P-384; any validity) or a **certificate authority**, or a **signing request (CSR)** to send to a CA. **Save files...** writes `.crt`, `.key` (PEM), `.pfx` (with your password) and `.csr`. **Open / convert**: open a `.pem` / `.crt` / `.cer` / `.der` / `.pfx` / `.p12` (or drop it) to see everything inside (names, dates, key, thumbprints, extensions) and save it as PEM, CER or PFX. Keys are made on this PC. Needs .NET Framework 4.7.2+ (Windows 10 1803 and newer).
- **Screen recorder (GIF)**: **Record an area...** (drag a box) or **the whole screen**, 5 - 20 frames a second, with or without the mouse pointer. A small Stop bar shows the time; it isn't in the recording. When you stop, the GIF plays in the window: **Save GIF...** or **Copy file** (paste it into a chat, ticket or email). Up to 2 minutes; frames that don't change cost nothing.
- **Code to image**: paste code and get a nice picture of it - syntax colours (guessed, or pick the language), dark or light, a coloured or transparent background, line numbers, a window frame with a title. **Copy image** or **Save PNG** (twice the screen size, so it stays sharp).
- **QR code**: type text or a link; copy the image or save it as PNG. Error correction L / M / Q / H; up to a few hundred characters.
- **Hide secret messages** (steganography): hide a secret message in a picture, in normal text or in any file so nobody sees it's there, optionally locked with a password (AES-256, key from PBKDF2). **Read the message** gets it back.
  - **In a picture**: stored in the lowest bit of each pixel's red, green and blue, so the picture looks the same. Open, paste or drop any picture (**Close picture** takes it out again); the result is saved as PNG (a 1920 x 1080 picture holds about 750 KB of text). Send the PNG file itself - apps that shrink or re-save pictures (most chats, JPEG) destroy the message. Opening a picture tells you if it carries a message.
  - **In normal text**: the message becomes invisible characters (zero-width spaces) inside a cover text you write; it's copied for you and survives copy and paste in most apps. Paste text you received into the box (or send it to this page) to read it; **Remove it** strips the invisible characters.
  - **In any file**: added after the end of a file (picture, PDF, zip, Office file ...), which still opens normally. **Remove it** takes it out again.
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
- **Host monitor**: add the servers you care about (ping, a TCP port such as 443, or **several ports** like `22, 80, 443` - all checked at once; the host is DOWN when any of them fails and the alert says which). **Folders** (New folder, or right-click a host > Move to folder) group hosts and can be **nested** (Production > EU > Web: New folder with a folder selected, or right-click a folder > New folder inside / Move into); a folder shows how many hosts (in it and its subfolders) are up or DOWN and opens / closes with a click; deleting one moves what was inside up a level. **Move** the selected host (within its folder) or folder up and down with the arrow buttons or Alt+Up / Alt+Down; new hosts go into the selected folder. They are checked in the background every 10 s to 5 min, even while the window is closed. When one goes down (also when it is already down at the first check) an alert pops up in the bottom-right corner of the screen with a sound; it closes by itself after about 9 seconds (pointing at it keeps it open), and a green one shows when the host is back. **Silence 1 hour** or **Silence** on the alert, or right-click a host (silence for 1 hour, until tomorrow 8:00, or until you turn it back on), stops alerts for just that host; the list shows which hosts are silenced. Each row shows the latency and a small history graph. **Export...** saves the hosts and folders to a JSON file (to keep, share or load on another PC); **Import...** adds the hosts from such a file, or from a text file with one host per line (`host`, `host:port`, `name host:port` or `name,host,port`), skipping the ones you already have. The list is kept safe across updates: the last list that loaded is kept as `hosts.json.bak`, and a file that can't be read is never saved over.

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

One window for everything you compare, with four tabs: **Text**, **Folders**, **Images** and **Files** (any two files, byte by byte). Open it from the tray menu (**Compare**), the picker (**Compare** button / Ctrl+D) or the palette (*Compare*, *Compare folders*, *Compare images*, *Compare files byte by byte*). Drop two folders, two pictures or two files of any kind on any tab and the right tab opens for them: folders go to Folders, pictures to Images, text files to Text, everything else (programs, archives, PDFs, databases ...) to Files.

### Text

The Text tab starts empty. Both sides are editors: click into either side and type or paste, and the comparison updates as you type. You can also fill a side with:

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

### Folders

The **Folders** tab of the Compare window (or *Compare folders* in the palette, or drop two folders onto the Compare window). Pick the two folders (Browse, or drop a folder onto each box) and press **Compare** (F5).

The result is one tree of both folders. Each file and folder shows whether it's **same**, **different** (yellow), **only left** (red) or **only right** (green), with the file sizes on both sides and, for folders, how many differences are inside. The status bar sums it up.

- Double-click a file (or press Enter) to compare it: text files open in the Text tab, pictures in Images, anything else in Files (byte by byte).
- Right-click: copy a file or folder to the other side (overwrites, then compares again), open either one, or show it in Explorer.
- **Expand differences** opens every folder that has differences; **Only show differences** hides identical files.
- **Compare file contents** compares files byte by byte. Turn it off to compare only size and date, which is faster for huge folders.
- `.git`, `.svn`, `.hg`, `.vs`, `node_modules`, `bin` and `obj` are skipped unless you untick that box.

### Images

Open two pictures (**Open left...** / **Open right...**), paste one from the clipboard (**Paste left** / **Paste right**, or Ctrl+V: a screenshot works), or drop them. PNG, JPEG, GIF, BMP, TIFF, ICO, EMF and WMF. Three ways to look at them:

- **Side by side**: both at the same zoom and position.
- **Difference**: the left picture faded, with every pixel that differs in red and a dashed box around the changed area. Opens by itself when two pictures differ.
- **Slider**: one picture over the other; drag the line to wipe between them.

The status line says how many pixels differ (and what percentage), where the changed area is, and whether the sizes differ. **Tolerance** ignores tiny colour changes (e.g. from JPEG compression). Pointing at a pixel shows its position and colour on both sides. Mouse wheel zooms, drag moves the picture, double-click or **Fit** fits it to the window, **100%** shows actual size.

### Files (byte by byte)

Compares any two files, whatever they are: programs, DLLs, archives, PDFs, Office files, databases, images. You get both sizes and SHA-256 hashes, whether they are identical, how many bytes differ in how many places and where the first difference is. Below, both files are shown as hex side by side (with the text next to it when the window is wide enough), the differing bytes in red. **Next difference** / **Previous difference** (Alt+Down / Alt+Up) jump between the places that differ. Big files are fine: the compare runs in the background and only the visible rows are read. **Compare as text** opens the two files in the Text tab; **Copy summary** copies the sizes, hashes and result.

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

**Show code in** (next to the output): how to do the selected operation in your own code - **C#, PowerShell, Python, JavaScript (Node.js), Java, Go, Bash or PHP** - filled with your input and coloured, ready to copy. There is a guide for **every operation**: encodings and decodings (hex, binary, decimal bytes, Base64, Base64URL, Base32, URL, HTML, JSON, Unicode), hashes (MD5, SHA-1/256/384/512, CRC32, HMAC-SHA256), encryptions (AES-256, Windows DPAPI, XOR, ROT13/47, Caesar), Morse, NATO, reverse / upside-down / leet, every case style (camelCase, snake_case and the rest, splitting words the same way DevTools does), the line tools (sort, unique, shuffle, number, join, split), formatting (JSON, SQL, XML, HTML, JWT, strip tags), extracting (emails, URLs, IPs, numbers, regex matches), number conversions, counting and the generators (GUIDs, passwords, random bytes, lorem ipsum). Where a language has no built-in way (SQL or HTML formatting, lorem ipsum) the guide names the usual library. The Python, Node.js, PowerShell and Bash guides were run and give the same result as DevTools, and every C# guide compiles on .NET 9. The **AES-256** code uses exactly DevTools' format (AES-256-CBC, key from PBKDF2-SHA256 with 200,000 rounds, HMAC-SHA256 to detect a wrong password), so text encrypted in DevTools can be decrypted by your program and the other way round - checked with Python, Node.js, PowerShell and Bash/OpenSSL.

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

- **Folders**: the **CHAINS** list on the left holds your chains in folders. Right-click anywhere in it for **New chain** / **New folder** (on a folder: inside it; folders can be nested), and drag chains or folders onto a folder to move them. Right-click a folder to rename or delete it (what's inside moves up a level). Only your own chains are there. Drag the line right of the left side to make it wider or narrower, and the line between the two boxes to give either more room.
- **Examples and requests** (the lower box on the left): **Example chains** (click one to open it; right-click for *Copy to my chains* or *Reset to the original example*), older example copies under *Old example copies* (right-click it to delete them all), example requests, templates and your saved API tester requests to drag onto the canvas.

- **Add cards**: drag a template (*Log in (JSON) -> {{token}}*, *Log in (form) -> session cookie*, *Request with Bearer {{token}}*, an empty request) or any saved request from the list on the left onto the canvas (or double-click it), or right-click the canvas. You can also drop a link or a `curl` command (from a browser, an editor or a chat) to get a card for it, or a `.devchain.json` file to import a chain. With a card selected, **Add request** adds the next one already linked.
- **Chain them**: drag from a card's blue dot (right side) to another card. The arrow means "runs after". Loops are refused. Click an arrow and press Del to remove it. **Select several cards** with Ctrl+click, by double-clicking empty space and dragging a box (keep the button down on the second click; Ctrl or Shift + drag works too and adds to the selection), or Ctrl+A; then drag one to move them all, **Del** deletes them, **Ctrl+C / Ctrl+V** copies them with the arrows between them (also into another chain). Move around by dragging empty space (left or middle button) or with the mouse wheel (Shift = sideways). **Zoom** with Ctrl+wheel (around the mouse), Ctrl+plus / Ctrl+minus, Ctrl+0 for 100% and Ctrl+9 to fit every card, or the - / % / + / Fit buttons in the canvas's bottom-right corner; **Arrange** lines the cards up.
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
- **Pages** (pagination, a card's **Pages** tab): one card fetches page after page and collects **every record into one file** - e.g. 100,000 records from an API that gives 1,000 at a time. Next page by **a number that goes up** (`?page={{page}}`, or an offset: starts at 0, + 1000 each page) or **a cursor / link from each answer** (`$.next`, a header, the `Link: <...>; rel="next"` header). Where the records are (`$.items`, `$` for a plain list). It stops at an empty page, a page with fewer records than a full one, an optional condition (`{{hasMore}} == false`) or a page limit; an optional wait between pages; **429 Too Many Requests** and 5xx answers are retried (it waits as long as `Retry-After` says). The records go **straight into the file as each page arrives** - a JSON array, JSON lines or CSV - so memory stays small, a retried page is written once, and stopping halfway still leaves a valid file. The card counts pages and records while it runs; `{{records}}` and `{{pages}}` hold the totals. Tested with 100,000 records (with 429s along the way): one file, every id exactly once.
- **Examples** (top bar, or *Example chains* in the lower box on the left) open a ready-made chain, with notes on what each step does. Your changes are kept; right-click it > **Reset to the original example** to start over, or **Copy to my chains** to build on it. Most run against free public test services, so they work straight away:
  - *Log in, then use the token* - POST a log-in, save `accessToken` as `{{token}}` and `id` as `{{userId}}`, then call with `Authorization: Bearer {{token}}`
  - *Session cookie* - a step gets a cookie, the next one sends it by itself
  - *Read, then create and change* - one step feeding three others; a JSON body built from `{{variables}}`
  - *Headers, regex and status* - Regex, Header and Status rules, a bracket JSON path, and a step that may fail without stopping the chain
  - *Download all records - paging (offline)* - 20,000 records three ways (page numbers to JSON, a cursor with retries to CSV, an offset to JSON lines)
  - *Conditions and go to (offline)* - runs on the Test API: skips the log-in when already logged in, loops "add an item" until there are 5, saves the list to a file, and a step that only runs for one user
- **Export as a script** (**Share** menu): the whole chain as a **PowerShell** script (Windows PowerShell 5.1 or PowerShell 7, nothing to install) or a **Bash** script (curl, plus python3 or jq to read JSON) - to run it on a server, in a scheduled task or a CI pipeline. The steps become data at the top of the script, followed by an engine with the same rules as this window: `{{variables}}` and cookies, Take from response, Run only if, Go to (loops included), Pages (records into one file, retries) and saving responses. You choose whether the variable values (passwords, tokens) go into the script; start values can be changed when you run it (`.\chain.ps1 -Vars @{ user = 'me' }`, `bash chain.sh user=me`). Files without a folder are saved next to the script.
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
| `GET /records` | 10,000 records a page at a time: `?page=1&size=100`, `?offset=0&limit=100` or `?cursor=<next>`; `&total=N` for another count, `&flaky=1` for an occasional 429 with `Retry-After` |

The menu also opens the full list in the browser, shows the **requests it received**, and opens the example chain **Local test API (offline)**: log in, Bearer token, cookie-only call, create, CSRF via Header and Regex rules, delete, check for 404.

**Collections, history and environments**

- **Save** (Ctrl+S) stores the request in a collection folder; Ctrl+Shift+S saves a copy. Click a saved request to open it; right-click to rename / move, duplicate or delete it (or a whole folder). Right-click anywhere in the list (also on empty space) for **New folder...** and **New request**; on a folder, **New request here** saves into it with Ctrl+S. Empty folders stay until you delete them.
- **History** keeps the last 100 requests sent, with their status and time. Click one to load it again.
- **Environments** (the **...** button next to the Environment list) hold variables. Write `{{name}}` anywhere (URL, params, headers, auth, body) and it's replaced with the value from the selected environment, e.g. `{{baseUrl}}/users` with `baseUrl = https://api.example.com`. Unknown variables are reported in the status bar.
- Everything is kept in `data\api\` (collections, history, environments, and the last request, which reopens next time).

## Diagram studio

Diagrams from a few lines of text: architecture maps, flowcharts, org charts and service maps. They are drawn live, you can drag and style them, they animate, and they export as a picture or as **SVG code** for a web page. Open it from the Toolbox (**Data** group) or the command palette.

- **Write it** on the left; the drawing updates as you type. **Mermaid flowcharts** (`graph TD`, `A --> B`, `B{Decision?}`, `subgraph ... end`) work as they are, so you can paste them from your docs. The own syntax adds more:
  - **Cards**: a badge, a status dot, lines of text, small items inside (Device A / TAP / Device B) and a live sparkline.
  - **Categories**: one colour each for light and dark, used by the cards, the links and the legend.
  - **Lanes**: columns with headings.
  - **Groups**: dashed frames.
  - **Links**: right-angled, curved or straight; dashed, thick, two-way, labelled; **animated**, so packets flow along them.

  **Syntax help** (bottom left) lists it all.
- **Charts** live in the same text: `chart column` (or bar, stacked column / bar, line, area, pie, donut, scatter), `x Month`, `y Sales, Costs`, `agg sum` (count, avg, min, max, first), `sort value` (asc, desc), `top 10`, `labels on`, `prefix $` / `suffix %`, then the rows between `data` and `end` (CSV or tab-separated; the first row names the columns). Rows with the same X are combined. Point at a bar, slice or dot for its value; click a legend chip to hide a series. They export like any diagram: PNG, SVG, an interactive page with tooltips and legend.
  ```
  title Monthly sales
  chart column
  x Month
  y Sales, Costs
  data
  Month,Sales,Costs
  Jan,1200,800
  Feb,1400,950
  end
  ```
- **Data** tab: **Paste** cells from Excel or a database tool, **Open file...** (`.csv`, `.tsv`, `.txt`, or Excel `.xlsx`, read directly with nothing installed, any sheet, dates as dates) or try the **Sample**, then **Make**:
  - a **chart**: pick the X column and tick the value columns, the type, how rows with the same X are combined and the order
  - **links**: a from and a to column, optionally a label and a column that colours the links
  - a **tree**: id and parent columns, and optionally the name shown (org charts, folder structures)
- **Examples**: 20 ready-made interactive diagrams to start from. Each opens as a **new copy**: the examples themselves never change.
  - **Architecture**: network visibility map, cloud web app, Kubernetes cluster, microservices, active / standby failover, home network.
  - **Flows**: deploy pipeline, CI/CD stages, login flow (Mermaid), incident runbook, order state machine, customer journey.
  - **Data**: analytics pipeline, database schema, event streaming.
  - **Org**: org chart, team responsibilities.
  - **Ideas**: mind map, every shape, every link style.
  ```
  title Shop platform
  theme corporate light
  category svc "Services" #1f6feb / #58a6ff
  gw: API gateway [badge GW, lines "Auth \u00b7 rate limits"]
  orders: Orders [badge ORD, svc, spark, status ok]
  gw -> orders [svc, animate]
  ```
- **Or draw it** on the canvas:
  - Drag shapes to move them.
  - Drag from a shape's dot to another shape to link them.
  - Double-click a shape to rename it; right-click for **Add a shape here**.
  - Shift+drag selects several; the arrow keys nudge the selection; Del deletes.
  - Click inside a group's frame to select the whole group; drag it to move it all.
  - **Move links**: click a link and drag the dots at its ends to **any point on any side** of their cards (`from top 0.25` / `to left 0.8` in the text), or drag the link itself to move its bend (`via x y`). The link's properties also pick the sides; **Reset route** makes it automatic again. A line with several links (`a -> b, c, d`) is split when you change one of them, so the others stay as they were.
  - **Drag a link's label** to wherever it reads best (**Label back** in its properties puts it back). Right-click > **Add text here** places free text (a `text` shape, no box) anywhere, for notes and captions.
  - **Ctrl+C / Ctrl+V** copy shapes and groups, with their links, looks and categories, into **any other diagram**. They paste where the mouse is, or in free space; clashing names get `_2`. **Ctrl+D** duplicates. The clipboard holds plain diagram text, so you can also paste it into the text editor or keep it in Notes.
  - Everything you do is written back into the text, so the text is always the whole diagram.
  - **Undo / Redo** with Ctrl+Z / Ctrl+Y.
- **Properties** (right):
  - **A shape**: title, badge, category, shape (card, rounded, pill, circle, diamond, hexagon, parallelogram, cylinder, document, note, actor, table), lane, status, sparkline, lines, items, description, tags, link, and fill / border / text colours.
  - **A link**: label, category, solid / dashed / dotted, route, arrows, animated, both ways, colour.
  - **Nothing selected**: the whole diagram. Theme (midnight, daylight, blueprint, pastel, mono, neon, corporate), layout (lanes, layered, grid, circle, force), direction, spacing, corner radius, header / legend / dots, and each category's light and dark colour.
- **Layout** is automatic. Lanes put cards into columns; layered layouts order shapes to cut crossings, and links that skip a level go around the shapes in between. Moved shapes keep their place (`at x y` in the text); **Re-layout** forgets that.
- **Edit / Preview**: in Preview, the canvas behaves like the web page will.
  - Hovering a shape dims everything unrelated.
  - Clicking a shape shows its details: description, tags, what it receives from and sends to.
  - **Simulate outage** stops its traffic.
  - The legend chips hide or show each flow. **Pause** and the speed stop or change the packets; **Dark / Light** switches the colours.
- **Export**:
  - **Copy as picture**, or **PNG** at 1x / 2x / 3x (with a transparent option).
  - **Interactive web page**: the whole experience of the canvas in one self-contained `.html` file (no libraries).
    - pan, Ctrl+wheel zoom and Fit; a dark / light switch
    - hover dimming; a **details panel** on click with the description, tags, a live sparkline, packets seen / dropped, what it receives from and sends to, and **Simulate outage**
    - flowing packets with pause and speed; live rates on the cards and totals in the header
    - legend chips that hide or show each flow; links open from the panel

    Each part can be switched off. The page has a small API, so you can feed in real data: `window.diagrams['prefix'].setStatus('db', 'down')`, `.setMetric(id, '12 ms')`, `.select(id)`, `.on('select', fn)`, `.theme('light')`, `.pause()`.
  - **Embeddable widget**: the same as a block to paste into any existing page (its own height); give each diagram its own prefix and several can share a page.
  - **React component**: a `.jsx` file with `theme` and `onSelect` props.
  - **SVG code**, with a live preview of the code and options:
    - colours as **CSS variables** that follow the system's light / dark theme, or fixed dark or light
    - background, scaling to its container, accessibility title and description
    - hover highlight, draw-in animation, minified
    - a **prefix for every class and id**, so several diagrams can sit on the same page without clashing
  - Every output has a live code view with **Copy**, **Save** and **Open in browser** to see the result.
- **Import...** (top bar), or drop files on the window: each file becomes a diagram in the folder selected in Saved.
  - **DevTools' own exports come back as they were**: every SVG, HTML page, widget, React component and PNG it exports carries the diagram text inside it (a hidden comment / PNG text), so importing one gives back the editable diagram with its positions and styles.
  - `.dgm` / `.txt` (diagram text), **Mermaid** (`.mmd`, or the first ```` ```mermaid ```` block of a `.md` file).
  - **draw.io / diagrams.net**: `.drawio` / `.xml` files (compressed or not; every page becomes its own diagram), and draw.io's SVG and PNG exports that include the diagram. Shapes (rectangles, rounded, ellipses, diamonds, cylinders, actors, notes, text ...), labels, positions and sizes, fill / line / text colours, dashed and two-way links and containers (as frames) are kept.
  - **Graphviz DOT** (`.dot` / `.gv`): nodes with their shapes, labels and colours, records as tables, `cluster` subgraphs as frames, edge chains and `{ a b }` groups, labels, dashed / dotted, `dir`, `rankdir`.
  - **CSV / TSV / Excel** go to the **Data** tab.
- Diagrams are saved as you go under `data\diagrams\` (one `.dgm` text file each). The **Saved** tab shows them in **folders, like Notes** (real folders under it):
  - Click a folder to open or close it (the number is how many diagrams are inside); click a diagram to open it. **Search** filters the list.
  - **New diagram** and **Folder** at the top, or right-click: on a folder **New diagram here...**, **New folder inside...**, **Rename folder...**, **Move to**, **Delete folder...**; on a diagram **Open**, **Duplicate**, **Rename...**, **Move to**, **Delete**, **Show in Explorer**. F2 renames, Del deletes.
  - Deleting a folder never deletes diagrams: what is inside moves up one level.
  - **Drag** diagrams and folders onto a folder to move them (onto empty space = the top). The open diagram follows when its folder moves or is renamed. Closed folders stay closed.
  - New diagrams (**New**, **Examples**, the Data tab, the SQL client's Chart this / ER diagram) are saved in the selected folder.

## SQL client

A database client for **SQL Server** (nothing to install: it uses the SQL Server support built into .NET), and for **PostgreSQL** and **Oracle** when a driver for them is already on the PC. Open it from the Toolbox (**Data** group) or the command palette.

- **PostgreSQL / Oracle drivers**: DevTools installs nothing; it uses what it finds:
  - an **ODBC driver**: psqlODBC ("PostgreSQL Unicode"), or Oracle's ("Oracle in ..."), 64-bit
  - **ODP.NET** in an Oracle home (`Oracle.DataAccess` or `Oracle.ManagedDataAccess`), or a provider registered in .NET
  - `Npgsql.dll` (with the DLLs it needs) or `Oracle.ManagedDataAccess.dll` put into `data\drivers\`
  - When none is found, the connection window says so and what to install.

- **Connections**: the list at the top left, then **New connection...**, and pick the **Database type** (and for PostgreSQL / Oracle the **driver** found on this PC).
  - Server: `localhost`, `.\SQLEXPRESS`, `(localdb)\MSSQLLocalDB` or `server.company.com,1433`; PostgreSQL `host` or `host:port`; Oracle `host:port/service` (e.g. `dbhost:1521/ORCLPDB1`) or a TNS alias.
  - Sign in with your **Windows account** or a **SQL Server login** (PostgreSQL / Oracle: user and password). The password is kept protected for your Windows account.
  - For Oracle the **Schema** box takes the place of the database (empty = your own schema).
  - Database: the **Databases** button lists them.
  - Options: encrypt, trust the server certificate, and **ask before running statements that change data** (on by default).
  - **Test** shows the server, database, login and version.
- **Objects**: databases (Oracle: schemas) > tables, views, procedures and functions > columns, with their types and PK / FK keys.
  - **Filter** box above the tree: the tables, views, procedures and functions of the database selected at the top whose name has every word you type (`sales order`), with how many match in each folder; Esc clears it.
  - Double-click a name to insert it.
  - Right-click a table: **First 100 rows** (`TOP` / `LIMIT` / `FETCH FIRST`), its definition, or an **ER diagram from here** (with the tables linked to it). Right-click a database: **ER diagram of all tables**.
- **Live diagram** (beside the editor, the **Live diagram** button shows / hides it): the query under the cursor drawn as you write it, before anything runs.
  - Every table of the FROM / JOINs (CTEs and subqueries too) with its real columns, alias and PK / FK keys.
  - Joins as links from key column to key column, coloured by type (INNER, LEFT, RIGHT, FULL, CROSS / APPLY) and labelled with the ON condition.
  - **CTEs**: each one is a single table inside a dashed frame "WITH name", together with the tables it reads; its columns show their type or the expression that makes them (`spent =SUM(o.total)`), the aliases it's used under are its badge, and CTEs that build on each other are linked in order. A recursive CTE shows both parts of its `UNION ALL` and is marked "(recursive)". `UNION` / `EXCEPT` parts of the main query are all shown.
  - **Temp tables and table variables** (`#temp`, `##global`, `@table`, PostgreSQL `CREATE TEMP TABLE`, and tables the script creates): their columns and types come from the script itself (`CREATE TABLE`, `DECLARE @t TABLE`, `SELECT ... INTO`, `INSERT INTO ... SELECT`, `CREATE ... AS SELECT`), with where their rows come from in the title. `SELECT ... INTO x` and `INSERT INTO x` show the table they fill.
  - Selected columns highlighted; columns used in joins (J), WHERE (W) and GROUP / ORDER BY (S) marked; unused ones dimmed; the WHERE conditions under their table. `INSERT INTO ... SELECT` shows where the rows go.
  - Tables in **other databases or schemas** are read when the query names them: SQL Server `Db.schema.table` (or `Db..table`), Oracle `OWNER.TABLE` and `TABLE@dblink`. Each is read once (**Refresh columns** reads again); a database you can't open says so on its card, and a linked server (`Server.Db.schema.table`) isn't read.
  - Click a table to find it in the SQL; **drag** tables to arrange them (they stay where you put them while you keep typing; **Tidy up** lays them out again); **Open in Diagram studio** to style or export it.
- **Query plan tuner**: **Plan** (Ctrl+L, the estimated plan; the query is not run) or **Run with plan** (Ctrl+M, the actual plan with real row counts). The **Plan** tab shows:
  - the plan drawn right to left like SSMS, each step with its share of the cost (red = expensive) and links as thick as their rows
  - **suggestions** in plain words, most important first: missing indexes with a ready `CREATE INDEX`, scans that filter rows, key lookups to cover, sorts and hash joins, implicit conversions, spills, estimates far from actual rows (`UPDATE STATISTICS`), missing statistics, joins without a condition, and from the SQL text: `SELECT *`, `LIKE '%...'`, functions on filtered columns, `NOT IN (SELECT ...)`, subqueries in the SELECT list
  - **Copy** or **Into the editor** for each fix (nothing is run for you), **Save .sqlplan** for SSMS / Azure Data Studio, **Open in Diagram studio**
  - PostgreSQL / Oracle: **Plan** and **Run with plan** show the database's own plan as text for the statement under the cursor (`EXPLAIN` / `EXPLAIN (ANALYZE, BUFFERS)`, Oracle `EXPLAIN PLAN` / `DBMS_XPLAN`).
- **Suggestions** as you type (or **Ctrl+Space**): tables after `FROM` / `JOIN`, the columns of the statement's tables, `alias.` lists that table's columns (also tables in other databases), `schema.` its tables, plus keywords and functions of the database type. Up / Down choose, **Tab** puts it in, Esc closes.
- **Joins across connections and files**: name where each table lives, and DevTools does the rest:
  ```sql
  SELECT o.order_id, c.name, r.region
  FROM [Oracle prod].SALES.ORDERS o
  JOIN [Local SQL].dbo.customers c ON c.id = o.customer_id
  JOIN [file:C:\data\regions.xlsx].Sheet1 r ON r.code = c.region_code
  WHERE o.order_date >= DATE '2026-01-01'
  ```
  - `[Name]` is a saved connection (SQL Server, PostgreSQL or Oracle); a table without one uses the current connection. `[file:path]` is a CSV / TSV file, `[file:path].Sheet` a sheet of an .xlsx (first row = column names; numbers and dates are recognised).
  - Each source gets its own query in parallel: only the columns used, and the `WHERE` parts that only touch that table (not for the optional side of an outer join). The rows are then joined, filtered, grouped and sorted inside DevTools; **Messages** shows what each source ran and how many rows it sent.
  - Supported across sources: `SELECT` with `DISTINCT` / `TOP`, every join type, `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY` (also by alias or number), `LIMIT` / `OFFSET` / `FETCH FIRST`, `COUNT / SUM / AVG / MIN / MAX` (with `DISTINCT`), `CASE`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`, `CAST` and common functions (`COALESCE` / `ISNULL` / `NVL`, `UPPER`, `SUBSTRING`, `ROUND`, `YEAR` ...). Not across sources: subqueries, CTEs, window functions, `UNION`.
  - Values match across sources the forgiving way: `42`, `42.0` and `'42'` are equal, text is compared without case.
  - At most 200,000 rows are read from each source; when a source has more, Messages says the result may miss rows (add a `WHERE`).
  - The live diagram and the suggestions follow these names too: after `[` you get your connections and `file:`, after `[Name].` its tables.
- **Examples** (top bar): ready queries to start from, added at the end of the editor and selected (F5 runs just that one):
  - **Files** (they run as they are, on sample files DevTools makes in `data\sql\examples\`): query a CSV; join a CSV with an Excel sheet with GROUP BY / CASE; rows in one file but not the other
  - **Across connections** (your first two saved connections are filled in; change the tables to yours): join two connections; a connection and an Excel file; Oracle + SQL Server + Excel; reconcile two systems (missing rows); compare totals between two systems
  - **Other databases and schemas**: SQL Server `Db.schema.table`; Oracle `OWNER.TABLE` and `TABLE@LINK`
  - **Per database**: SQL Server top / paging / dates; PostgreSQL `LIMIT` / `ILIKE` / `date_trunc`; Oracle `FETCH FIRST` / `NVL` / a PL/SQL block
  - **Tips**: the keys for plans, the live diagram and suggestions
- **Editor** with SQL colours. **Ctrl+Z** undoes typing a word at a time (a paste, an example or a suggestion all at once); **Ctrl+Y** or **Ctrl+Shift+Z** redoes. Pasting (Ctrl+V / Shift+Insert) puts in the text only, without the formatting of where it came from (a note, a web page, Word), and turns non-breaking spaces and curly quotes into plain ones so SQL Server takes them. **F5** or **Ctrl+Enter** runs the selection, or everything; `GO` lines separate batches (as in SSMS). PostgreSQL / Oracle run one statement at a time (`;` between them; an Oracle PL/SQL block ends with a `/` line). **Cancel** (or Esc) stops a long query. **Max rows** caps what is shown per result.
- **Results**: a tab per result set, plus **Messages** (rows affected, PRINT output, errors).
  - An error selects the line it happened on.
  - **Right-click** a result: **Copy** (with or without headers, Excel-ready), **Copy as** the value only, CSV / JSON / a Markdown table / `INSERT` statements of the selected rows, an `IN (...)` list or a `WHERE` condition of the selected cells, the column name, all column names, all values of a column; **Filter** to the rows with this value, hide the rows with it, NULL / not NULL (filters add up; **Clear the filters**; export and Chart this use what is shown); **Column**: sort, hide, show all, freeze up to here, fit widths; **View the value** in its own window (JSON / XML laid out); put the value, or the selection as `WHERE`, into the editor; Chart this, Diagram this, save as CSV / JSON.
  - Selecting several cells shows **Count, Sum, Average, Min, Max** of them in the status line.
  - **Copy** (with headers, pastes into Excel), **CSV...**, **JSON...**.
  - **Chart this** / **Diagram this** send the result to the Diagram studio's Data tab, ready to become a chart, a link graph or a tree.
  - **ER diagram** draws the tables of the database with their columns, keys and the 1 : n links between them.
- **Connections** and **Saved** queries are kept in **folders, like Notes**: click a connection to use it, double-click a saved query to open it (right-click: **Open and run**). **Save query** saves into the selected folder (the same name there is replaced after asking). Right-click for **New folder inside...**, **Rename folder...**, **Move to** and **Delete folder...** (what's inside moves up a level), or drag connections, queries and folders onto a folder. The connection list at the top shows the folder too (`Work > Prod`).
- **History** keeps the last 200 runs (double-click to load one). Everything is kept under `data\sql\` (`folders.json` holds the folders).

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
