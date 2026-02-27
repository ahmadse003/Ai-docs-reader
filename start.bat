@echo off
echo.
echo 🚀 AI Knowledge Assistant - Quick Start
echo ======================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

echo ✅ Python found
echo.

REM Install dependencies
echo 📦 Installing Python dependencies...
echo.

cd backend

pip install flask flask-cors langchain langchain-community langchain-groq pypdf faiss-cpu sentence-transformers huggingface-hub

echo.
echo ✅ Dependencies installed successfully!
echo.

REM Create uploads directory
if not exist "..\uploads" mkdir "..\uploads"

echo 🌐 Starting Flask server...
echo.
echo Backend will run on: http://localhost:5000
echo Open frontend\index.html in your browser to use the application
echo.
echo Press Ctrl+C to stop the server
echo.

REM Run the Flask app
python app.py

pause
