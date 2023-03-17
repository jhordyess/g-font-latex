#!/bin/bash
set -e

# Ask the user for the Google Fonts URL
read -p "Enter the URL of the Google Fonts you want to install: " FONT_URL

# Extract the font name from the URL
FONT_NAME=$(echo $FONT_URL | sed -E 's/.*\/([^\/]+)/\1/')

# Download the Google Fonts zip file
sudo apt-get update && sudo apt-get install -y wget unzip
wget "https://fonts.google.com/download?family=$FONT_NAME" -O "$FONT_NAME.zip"

# Create a fonts directory if it doesn't exist
sudo mkdir -p "/usr/share/fonts/truetype/google-fonts"

# Extract the zip file into the fonts directory
sudo unzip -o "$FONT_NAME.zip" -d "/usr/share/fonts/truetype/google-fonts"

# Delete the zip file
rm "$FONT_NAME.zip"

# Update the font cache
fc-cache -f -v

echo "The $FONT_NAME font has been installed successfully."
