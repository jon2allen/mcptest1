#!/usr/bin/env bash
# configuration ---
# The name of the benign package to install.
PACKAGE_NAME="mcp-server-commands"
# The file we want to locate within the package's directory.
FILE_TO_FIND="index.js"

# --- Script Start ---
echo "Starting the safe package installation and file search script..."

# 1. Install the npm package locally
# The package will be installed into the local 'node_modules' directory.
echo "Attempting to install '$PACKAGE_NAME' locally using npm..."
if npm install "$PACKAGE_NAME"; then
    echo "'$PACKAGE_NAME' installed successfully."
else
    echo "Error: Failed to install '$PACKAGE_NAME'. Please ensure npm is installed."
    exit 1
fi

# 2. Find the root directory of the locally installed package
# 'npm root' command returns the path to the local node_modules directory.
# We suppress potential errors (2>/dev/null) and capture the output.
NPM_ROOT=$(npm root 2>/dev/null)
if [ -z "$NPM_ROOT" ]; then
    echo "Error: Could not determine the local npm root directory."
    exit 1
fi

# Construct the expected package directory path
PACKAGE_DIR="$NPM_ROOT/$PACKAGE_NAME"
echo "The package is expected to be in: $PACKAGE_DIR"

# 3. Find the specific file within the package directory
# The 'find' command searches for files and directories.
# -type f: Ensures we only look for regular files
echo "Searching for '$FILE_TO_FIND' within '$PACKAGE_DIR'..."
# Use 'head -n 1' to ensure only the path to the first match is returned.
FILE_PATH=$(find "$PACKAGE_DIR" -name "$FILE_TO_FIND" -type f 2>/dev/null | head -n 1)

# 4. Report the result
if [ -n "$FILE_PATH" ]; then
    echo "----------------------------------------"
    echo "✅ Success! Found the file."
    echo "File Path: $FILE_PATH"
    echo "----------------------------------------"
else
    echo "----------------------------------------"
    echo "❌ Failure. Could not find '$FILE_TO_FIND' in the installation directory."
    echo "----------------------------------------"
fi

echo "Script finished."
