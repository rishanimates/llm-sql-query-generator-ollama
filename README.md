# LLM SQL Query Generator with Ollama

This project demonstrates a natural language to SQL query generator using Ollama and LangChain. It allows users to ask questions about a student information system database in natural language and get SQL queries and results.

## Features

- Natural language to SQL query conversion
- FastAPI backend with SQLite database
- Simple and intuitive web interface
- Powered by Ollama and LangChain

## Prerequisites

- Python 3.8+
- Ollama installed and running with the mistral model
- SQLite

## Setup

1. Clone the repository:
   ```bash
   git clone git@github.com:rishanimates/llm-sql-query-generator-ollama.git
   cd llm-sql-query-generator-ollama
   ```

2. Create and activate a virtual environment:
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Initialize the database:
   ```bash
   sqlite3 ../db/sis.db < ../db/create_sis.sql
   ```

5. Start the server:
   ```bash
   uvicorn main:app --reload
   ```

6. Open your browser and navigate to:
   ```
   http://localhost:8000
   ```

## Usage

1. Enter your question in natural language (e.g., "Show me all students with marks above 85")
2. Click "Generate Query"
3. View the generated SQL query and results

## Example Questions

- What is the average mark for each course?
- Show me all students in grade 10
- List the top 5 students by their marks
- How many students are enrolled in each course?

## License

MIT License