
# --- Configuration ---
# The name of the benign package to install.
PACKAGE_NAME="mcp-server-commands"
# The file we want to locate within the package's directory.
FILE_TO_FIND="index.js"

# --- Script Start ---
echo "Starting the safe package installation and file search script..."

# 1. Install the npm package globally
# The '-g' flag installs the package globally, making it accessible from anywhere.
echo "Attempting to install '$PACKAGE_NAME' using npm..."
if npm install  "$PACKAGE_NAME"; then
    echo "'$PACKAGE_NAME' installed successfully."
else
    echo "Error: Failed to install '$PACKAGE_NAME'. Please ensure npm is installed and you have the necessary permissions."
    exit 1
fi

# 2. Find the root directory of the globally installed package
# 'npm root -g' command returns the path to the global node_modules directory.
NPM_ROOT=$(npm root -g)
if [ -z "$NPM_ROOT" ]; then
    echo "Error: Could not determine the npm global root directory."
    exit 1
fi

PACKAGE_DIR="$NPM_ROOT/$PACKAGE_NAME"
echo "The package is expected to be in: $PACKAGE_DIR"

# 3. Find the specific file within the package directory
# The 'find' command searches for files and directories.
# -L: Follow symbolic links
# -name: Specifies the filename to search for
echo "Searching for '$FILE_TO_FIND' within '$PACKAGE_DIR'..."
FILE_PATH=$(find -L "$PACKAGE_DIR" -name "$FILE_TO_FIND")

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

