#sttart Python Scripts ---
echo "--- Running initial Python scripts ---"

# Run client.py
echo "Running python3 client.py..."
python3 client.py

# Run client2.py
echo "Running python3 client2.py..."
python3 client2.py

sleep 1
# Run list.py
echo "Running python3 list.py..."
python3 list.py

# Run command_cli.py with the specified flag
sleep 1
echo "Running command_cli.py -f git_prompt.txt..."
python3 command_cli.py -f git_prompt.txt

# ----------------------------------------------------------------------
echo ""
echo "--- Changing Directory and Checking Repo Status ---"

# Change directory to the specified path
TARGET_DIR="repo/test-scrubbing"
echo "Changing directory to: $TARGET_DIR"

if cd "$TARGET_DIR"; then
    echo "Successfully changed directory."

    # List contents of the new directory
    echo ""
    echo "Running ls -alh in the new directory:"
    ls -alh

    # Check Git status
    echo ""
    echo "Running git status:"
    git status

    # Show Git log (first 5 commits for brevity)
    echo ""
    echo "Running git log (last 5 entries):"
    git log -5

else
    echo "Error: Failed to change directory to '$TARGET_DIR'. Please ensure the path is correct."
    exit 1
fi

echo ""
echo "--- Script Finished ---"
