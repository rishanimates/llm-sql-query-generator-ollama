# Natural Language to SQL Query Generator

A web application that converts natural language questions into SQL queries using Ollama and LangChain. The application provides a simple interface where users can ask questions about a student information system database in plain English.

## Features

- Natural language to SQL query conversion
- FastAPI backend with SQLite database
- Simple web interface
- Powered by Ollama and LangChain
- Real-time query execution and results display

## Prerequisites

- Python 3.8 or higher
- Ollama installed and running with the mistral model
- SQLite

## Installation

1. Clone the repository:
   ```bash
   git clone git@github.com:rishanimates/llm-sql-query-generator-ollama.git
   cd llm-sql-query-generator-ollama
   ```

2. Set up the Python virtual environment:
   ```bash
   cd backend
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Initialize the database:
   ```bash
   sqlite3 ../db/sis.db < ../db/create_sis.sql
   ```

## Running the Application

1. Make sure Ollama is running with the mistral model:
   ```Model is 4.1 GB in file size. 
   ```bash
   ollama pull mistral 
   ollama run mistral
   ```

2. Start the FastAPI server:
   ```bash
   cd backend
   uvicorn main:app --reload
   ```

3. Open your web browser and navigate to:
   ```
   http://localhost:8000
   ```

## Usage

1. In the web interface, enter your question in natural language. For example:
   - "Show me all students with marks above 85"
   - "What is the average mark for each course?"
   - "List the top 5 students by their marks"
   - "How many students are enrolled in each course?"

2. Click the "Ask" button to submit your question

3. The application will:
   - Generate an appropriate SQL query
   - Execute the query against the database
   - Display both the SQL query and the results

## Example Questions and Expected Results

1. "Show me all students with marks above 85"
   ```sql
   SELECT Students.name, Enrollments.marks
   FROM Students
   JOIN Enrollments ON Students.id = Enrollments.student_id
   WHERE Enrollments.marks > 85
   ```

2. "What is the average mark for each course?"
   ```sql
   SELECT Courses.name, AVG(Enrollments.marks) as average_marks
   FROM Courses
   JOIN Enrollments ON Courses.id = Enrollments.course_id
   GROUP BY Courses.name
   ```

3. "List the top 5 students by their marks"
   ```sql
   SELECT Students.name, Enrollments.marks
   FROM Students
   JOIN Enrollments ON Students.id = Enrollments.student_id
   ORDER BY Enrollments.marks DESC
   LIMIT 5
   ```

## Project Structure

```
.
├── backend/
│   ├── main.py           # FastAPI application
│   ├── requirements.txt  # Python dependencies
│   └── static/
│       └── index.html    # Web interface
├── db/
│   ├── create_sis.sql    # Database schema
│   └── sis.db           # SQLite database
└── README.md
```

## Troubleshooting

1. If you see a CORS error:
   - Make sure you're accessing the application through `http://localhost:8000`
   - Check that the FastAPI server is running
   - Verify that Ollama is running with the mistral model

2. If queries aren't working:
   - Ensure the database is properly initialized
   - Check that the database file exists and has the correct permissions
   - Verify that the Ollama service is running and accessible

3. If the server won't start:
   - Check if port 8000 is already in use
   - Ensure all dependencies are installed correctly
   - Verify that you're in the correct directory

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details.