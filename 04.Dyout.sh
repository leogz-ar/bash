#!/bin/bash
############################
#..:: Requirements ::..
#sudo apt update
#sudo apt install yt-dlp
#..:: audio conversion (MP3) ::..
#sudo apt install ffmpeg
############################
#url example: https://www.youtube.com/watch?v=OPf0YbXqDm0
############################
# Ask for URL
read -rp "📺 Enter the YouTube video URL: " URL

# Ask for format
echo "🎞️ Choose format:"
echo "1) Best quality video+audio"
echo "2) Audio only (MP3)"
read -rp "Option [1-2]: " OPTION

# Set output path (optional)
OUTDIR="$HOME/Videos/youtube"
mkdir -p "$OUTDIR"

# Download based on option
case "$OPTION" in
  1)
    yt-dlp -f "bestvideo+bestaudio" --merge-output-format mp4 -o "$OUTDIR/%(title)s.%(ext)s" "$URL"
    ;;
  2)
    yt-dlp -x --audio-format mp3 -o "$OUTDIR/%(title)s.%(ext)s" "$URL"
    ;;
  *)
    echo "❌ Invalid option. Exiting."
    exit 1
    ;;
esac

echo "✅ Download completed. Files saved to: $OUTDIR"
