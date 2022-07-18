from fastapi import APIRouter
from config.db import conn
from models.question import questions
from schemas.question import Question

question = APIRouter()

@question.get('/questions/')
def fetch_questions():
    return conn.execute(questions.select()).fetchall()

@question.post('/questions/')
def post_question(question: Question):
    return conn.execute(questions.insert().values(qs_title=question.qs_title,qs_desc=question.qs_desc,date=question.date,user_id=question.user_id))

@question.put('/questions/{id}')
def update_question(id: int,question: Question):
    return conn.execute(questions.update().values(qs_title=question.qs_title,qs_desc=question.qs_desc,date=question.date,user_id=question.user_id).where(questions.c.qs_id == id))

@question.delete('/questions/{id}')
def delete_question(id: int):
    return conn.execute(questions.delete().where(questions.c.qs_id == id))