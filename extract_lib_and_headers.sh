#!/bin/bash

# Name of your ZIP file
ZIP_FILE="libsoftethervpn.zip"

# Folder to extract to
EXTRACT_DIR="artifact_unpacked"

# Subpaths inside the ZIP (adjust if different!)
LIB_SUBPATH="build/Release-iphoneos/libsoftethervpn.a"
INCLUDE_SUBPATH="build/include"

# Destination folders in your project
LIB_DST="WorxVPN_TestApp/lib"
INCLUDE_DST="WorxVPN_TestApp/lib/includes"

# Unzip the artifact
echo "Unzipping $ZIP_FILE..."
rm -rf "$EXTRACT_DIR"
mkdir "$EXTRACT_DIR"
unzip -q "$ZIP_FILE" -d "$EXTRACT_DIR"

# Copy the static library
LIB_SRC="$EXTRACT_DIR/$LIB_SUBPATH"
if [[ -f "$LIB_SRC" ]]; then
    mkdir -p "$LIB_DST"
    cp "$LIB_SRC" "$LIB_DST/"
    echo "Copied $LIB_SRC to $LIB_DST/"
else
    echo "ERROR: $LIB_SRC not found"
    exit 1
fi

# Copy the headers
INCLUDE_SRC="$EXTRACT_DIR/$INCLUDE_SUBPATH"
if [[ -d "$INCLUDE_SRC" ]]; then
    mkdir -p "$INCLUDE_DST"
    cp -r "$INCLUDE_SRC/"* "$INCLUDE_DST/"
    echo "Copied headers from $INCLUDE_SRC to $INCLUDE_DST/"
else
    echo "ERROR: $INCLUDE_SRC not found"
    exit 1
fi

echo "✅ WorxVPN_TestApp is ready!"