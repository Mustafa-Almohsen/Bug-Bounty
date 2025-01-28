#!/bin/bash

# Function to display help menu
show_help() {
    echo "Usage: $0 -f <url_file> [--exclude-sizes=<size1,size2,...>]"
    echo
    echo "Options:"
    echo "  -f <url_file>           File containing target URLs (one per line)"
    echo "  --exclude-sizes         Comma-separated sizes to exclude (default: 0KB)"
    echo "  -h                      Show this help message"
    exit 0
}

# Parse arguments
url_file=""
exclude_sizes="0KB" # Default exclusion size

while [[ $# -gt 0 ]]; do
    case "$1" in
        -f)
            url_file="$2"
            shift 2
            ;;
        --exclude-sizes=*)
            exclude_sizes="${1#*=}"
            shift
            ;;
        -h)
            show_help
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            ;;
    esac
done

# Check if URL file is provided
if [[ -z $url_file ]]; then
    echo "Error: URL file not specified. Use -f to provide a URL file."
    show_help
fi

# Check if the URL file exists
if [[ ! -f $url_file ]]; then
    echo "Error: URL file '$url_file' not found!"
    exit 1
fi

# Process each URL in the file
while IFS= read -r url; do
    echo "Scanning $url ..."
    dirsearch -u "${url}/" -e txt,conf,config,bak,sql,env,ini,json,xml,yml,yaml,old,swp,tmp,php,jsp,asp,aspx,py,rb,db,sqlite3,log --exclude-sizes="$exclude_sizes"
done < "$url_file"
