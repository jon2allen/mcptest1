#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Use python3.11, or change to just 'python3' if you prefer
PYTHON_CMD="python3"

echo "🐍 Creating virtual environment in './.venv'..."
$PYTHON_CMD -m venv .venv

# Activate the virtual environment for the duration of this script
source .venv/bin/activate

echo "📦 Installing packages..."
# We can install all packages in one command
# Note: 'google-genai' was corrected to the correct package name 'google-generativeai'
python3 -m pip install --upgrade pip
python3 -m pip install google-genai fastmcp

echo ""
echo "✅ Setup complete!"
echo "To activate the environment in your terminal, run:"
echo "source .venv/bin/activate"
