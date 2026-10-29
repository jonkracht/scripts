#!/bin/bash

# Check if a file argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Ensure the file actually exists
FILE="$1"
if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' does not exist."
    exit 1
fi

# Convert extension to lowercase for reliable matching
EXTENSION="${FILE##*.}"
EXTENSION=$(echo "$EXTENSION" | tr '[:upper:]' '[:lower:]')

echo "Opening $FILE..."

# Route files based on their extension
case "$EXTENSION" in
    
    # Audio
    mp3|wav|flac|ogg)
        vlc "$FILE" &>/dev/null &
        ;;

    # Video
    mp4|mkv|avi|mov)
        vlc "$FILE" &>/dev/null &
        ;;

    # pdf
    pdf)
        zathura "$FILE" &>/dev/null &
        ;;
    # Image
    png|jpg|jpeg|gif|svg)
        loupe "$FILE" &>/dev/null &
        ;;
    
    # Webpage
    html|htm)
        brave "$FILE" &>/dev/null &
        ;;

    # Text
    md|txt|cfg|conf|sh|py|json)
        # Open text files inside the current terminal using micro or nano
        nvim "$FILE"
        ;;
    
    # Compressed
    zip|tar|gz|7z|rar)
        # Extract archives automatically instead of viewing them
        echo "Extracting archive..."
        mkdir -p "${FILE%.*}_extracted"
        tar -xf "$FILE" -C "${FILE%.*}_extracted" 2>/dev/null || unzip "$FILE" -d "${FILE%.*}_extracted"
        ;;

    *)
        # Fallback to system default if extension is unrecognized
        echo "Unknown extension. Falling back to system default..."
        if command -v xdg-open &> /dev/null; then
            xdg-open "$FILE" &>/dev/null &
        elif command -v open &> /dev/null; then
            open "$FILE" # macOS fallback
        else
            echo "No default handler found. Opening in text mode."
            nano "$FILE"
        fi
        ;;
esac
