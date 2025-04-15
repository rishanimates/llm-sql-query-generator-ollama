from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from langchain_ollama import OllamaLLM
from langchain.chains import create_sql_query_chain
from langchain_community.utilities import SQLDatabase

app = FastAPI()

# Enable CORSœ
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Database setup
db = SQLDatabase.from_uri("sqlite:///D:/development/llm/llm-sql-query-generator-ollama/db/sis.db")
llm = OllamaLLM(model="mistral")

class QueryRequest(BaseModel):
    question: str

@app.post("/query")
async def run_query(request: QueryRequest):
    chain = create_sql_query_chain(llm, db)
    sql_query = await chain.ainvoke({"question": request.question})
    result = db.run(sql_query)
    return {"query": sql_query, "result": result}


# Serve frontend
app.mount("/", StaticFiles(directory="static", html=True), name="static")
