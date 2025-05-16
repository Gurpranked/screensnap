#!/bin/bash
# Run script for ScreenSnap GUI mode

echo "=== Starting ScreenSnap GUI ==="

# Check if ollama is installed
if ! command -v ollama 2>&1 /dev/null; then
	echo "Ollama not installed. Please visit https://ollama.com/download to install Ollama"
    	exit 1
# Start if exists
else 
	echo "Starting Ollama server..."
    	ollama serve
	sleep 3
fi


# Check if we have Llava model
# if ! ollama list | grep -q "llava"; then
#    echo "Llava model not found. Would you like to pull it? (y/n)"
#     read answer
#     if [[ "$answer" == "y" ]]; then
#         echo "Pulling llava:latest model..."
#         ollama pull llava:latest
#     fi
# fi

# Pull specified model
echo "Which model would you like to pull? For an exhuastive list, visit https://ollama.com/search"
read answer
ollama pull "$answer"

# Run the app in GUI mode
echo "Starting ScreenSnap GUI..."
RUST_LOG=info cargo run -- gui
