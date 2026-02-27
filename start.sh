#!/bin/bash

echo "🚀 AI Knowledge Assistant - Quick Start"
echo "======================================"
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✅ Python3 found: $(python3 --version)"
echo ""

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 is not installed. Please install pip."
    exit 1
fi

echo "✅ pip3 found"
echo ""

# Install dependencies
echo "📦 Installing Python dependencies..."
echo ""

cd backend

# Use venv if it exists, otherwise create one
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

echo "📦 Installing Python dependencies..."
source venv/bin/activate
pip install -r requirements.txt

echo ""
echo "✅ Dependencies installed successfully!"
echo ""

# Create uploads directory if it doesn't exist
mkdir -p ../uploads

echo "🌐 Starting Flask server..."
echo ""
echo "Backend will run on: http://localhost:5001"
echo "Open frontend/index.html in your browser to use the application"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Run the Flask app using venv Python
python app.py
