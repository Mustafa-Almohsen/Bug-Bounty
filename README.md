This Bash script automates the usage of Dirsearch to scan multiple URLs for hidden directories and files, with a focus on discovering specific file extensions. It simplifies bulk URL processing by reading targets from a file and filtering out unwanted response sizes using the --exclude-sizes option.
Key Features:

Extension Focused: Targets files with extensions commonly associated with sensitive information, such as .env, .json, .bak, .sql, .yml, and more.
Bulk Scanning: Supports scanning multiple URLs from a single input file.
Default Wordlist: Automatically uses Dirsearch's default wordlist unless a custom one is specified in Dirsearch itself.
Response Size Filtering: Allows exclusion of unwanted response sizes (default: 0KB).
Customizable: Users can modify extensions or exclude specific response sizes easily.

Usage:
1 - Prepare a URL file: Create a text file (urls.txt) with one target URL per line.
2 - Run the script:
./dirsearch-ext-focused.sh -f urls.txt
3 - Optional: Exclude additional response sizes:
./dirsearch-ext-focused.sh -f urls.txt --exclude-sizes=0KB,1KB

Extensions Scanned:

By default, the script scans for files with the following extensions:
(txt, conf, config, bak, sql, env, ini, json, xml, yml, yaml, old, swp, tmp, php, jsp, asp, aspx, py, rb, db, sqlite3, log)


Prerequisites:

Dirsearch must be installed and available in your system PATH.
