# 🤖 AI Knowledge Assistant

A powerful AI-powered knowledge assistant that allows you to upload documents (PDF, TXT) and ask questions about them. Built with Flask, LangChain, RAG (Retrieval Augmented Generation), and Groq AI.

## 🌟 Features

- **Document Upload**: Upload PDF and TXT files (up to 16MB)
- **Intelligent Q&A**: Ask questions and get AI-powered answers from your documents
- **RAG Implementation**: Uses Retrieval Augmented Generation for accurate answers
- **Vector Store**: FAISS vector database for efficient document retrieval
- **Source Attribution**: Shows which documents were used to answer questions
- **Modern UI**: Beautiful, responsive JavaScript interface
- **Document Management**: View, delete, and clear uploaded documents

## 🛠️ Technologies Used

### Backend
- **Flask**: Python web framework
- **LangChain**: Framework for LLM applications
- **Groq API**: Fast AI inference with Mixtral model
- **FAISS**: Vector database for similarity search
- **HuggingFace**: Embeddings model (all-MiniLM-L6-v2)
- **PyPDF**: PDF document processing

### Frontend
- **HTML5/CSS3**: Modern, responsive design
- **JavaScript**: Vanilla JS for interactions
- **Fetch API**: RESTful API communication

## 📋 Prerequisites

- Python 3.8 or higher
- pip (Python package manager)
- Groq API key (already included)

## 🚀 Installation & Setup

### 1. Install Python Dependencies

```bash
cd backend
pip install -r requirements.txt
```

Or install packages individually:

```bash
pip install flask flask-cors langchain langchain-community langchain-groq pypdf faiss-cpu sentence-transformers huggingface-hub --break-system-packages
```

### 2. Start the Backend Server

```bash
cd backend
python app.py
```

The Flask server will start on `http://localhost:5000`

### 3. Open the Frontend

Simply open the `frontend/index.html` file in your web browser:

```bash
cd frontend
# On Linux/Mac
open index.html

# On Windows
start index.html

# Or manually open in browser
```

## 📖 Usage Guide

### Step 1: Upload Documents
1. Click on the upload zone or drag & drop files
2. Supported formats: PDF, TXT (max 16MB)
3. Documents will be automatically processed

### Step 2: Ask Questions
1. Type your question in the input field
2. Click "Send" or press Enter
3. The AI will search your documents and provide an answer
4. Sources used will be displayed below the answer

### Step 3: Manage Documents
- View all uploaded documents in the left panel
- Delete individual documents using the "Delete" button
- Clear all documents with the "Clear All Documents" button

## 🏗️ Project Structure

```
ai-knowledge-assistant/
├── backend/
│   ├── app.py              # Flask application with RAG implementation
│   └── requirements.txt    # Python dependencies
├── frontend/
│   └── index.html         # JavaScript UI
├── uploads/               # Document storage (created automatically)
└── README.md             # This file
```

## 🔧 API Endpoints

### POST /upload
Upload a document
- **Body**: multipart/form-data with 'file' field
- **Response**: Success message and filename

### POST /query
Ask a question
- **Body**: `{"question": "your question"}`
- **Response**: `{"answer": "...", "sources": [...]}`

### GET /documents
List all uploaded documents
- **Response**: `{"documents": [{"name": "...", "size": ...}]}`

### DELETE /delete/<filename>
Delete a specific document
- **Response**: Success message

### POST /clear
Clear all documents
- **Response**: Success message

### GET /health
Health check
- **Response**: `{"status": "healthy", "documents_loaded": true/false}`

## ⚙️ Configuration

The Groq API key is already configured in the backend:
GROQ_API_KEY=your_groq_api_key_here
- **Model**: Mixtral-8x7b-32768
- **Embeddings**: sentence-transformers/all-MiniLM-L6-v2

## 🎯 How RAG Works

1. **Document Processing**: Documents are split into chunks (1000 chars, 200 overlap)
2. **Embeddings**: Each chunk is converted to vector embeddings
3. **Vector Store**: Embeddings stored in FAISS for fast retrieval
4. **Query**: When you ask a question:
   - Question is embedded using same model
   - Top 3 most similar chunks are retrieved
   - Retrieved context + question sent to Groq AI
   - AI generates answer based on context

## 🔍 Example Questions

After uploading documents, try:
- "What are the main topics discussed in these documents?"
- "Summarize the key points"
- "What does the document say about [specific topic]?"
- "Can you extract information about [specific subject]?"

## 🐛 Troubleshooting

### Backend won't start
- Ensure all Python packages are installed
- Check Python version (3.8+)
- Verify port 5000 is not in use

### Can't upload files
- Check file size (max 16MB)
- Verify file format (PDF or TXT)
- Ensure uploads folder has write permissions

### No answers from AI
- Upload documents first
- Check that documents processed successfully
- Verify Groq API key is valid

### CORS errors
- Ensure Flask backend is running
- Check that frontend is accessing correct API URL
- Verify flask-cors is installed

## 📝 License

This project is open source and available for educational purposes.

## 👨‍💻 Development

### Running in Development Mode

Backend already runs with debug mode enabled:
```python
app.run(debug=True, port=5000)
```

### Customization

- **Change AI Model**: Edit `model_name` in `app.py`
- **Adjust Chunk Size**: Modify `chunk_size` and `chunk_overlap`
- **UI Styling**: Edit CSS in `index.html`
- **API URL**: Update `API_URL` in frontend JavaScript

## 🎓 Learning Outcomes

This project demonstrates:
- ✅ Flask REST API development
- ✅ LangChain framework usage
- ✅ RAG (Retrieval Augmented Generation) implementation
- ✅ Vector databases (FAISS)
- ✅ Document processing and embeddings
- ✅ Modern JavaScript frontend development
- ✅ File upload handling
- ✅ AI/LLM integration

## 📞 Support

For issues or questions:
1. Check the troubleshooting section
2. Verify all dependencies are installed
3. Ensure the backend is running before opening frontend
4. Check browser console for errors

## 🚀 Next Steps

Potential enhancements:
- Add support for more file types (DOCX, CSV, etc.)
- Implement user authentication
- Add conversation history
- Deploy to cloud (Heroku, AWS, etc.)
- Add more LLM models
- Implement streaming responses
- Add document preview feature

---

**Project Duration**: 26 minutes (Capstone Part I & II)

Built with ❤️ using Flask, LangChain, and Groq AI
