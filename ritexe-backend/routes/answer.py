from fastapi import APIRouter
from config.db import conn
from models.answer import answers
from schemas.answer import Answer

answer = APIRouter()

@answer.get('/answers/')
def fetch_answers():
    return conn.execute(answers.select()).fetchall()

@answer.post('/answers/')
def post_answer(answer: Answer):
    return conn.execute(answers.insert().values(ans=answer.ans,upvote=answer.upVote,downvote=answer.downVote))

@answer.put('/answers/{id}')
def update_answer(id: int,answer: Answer):
    return conn.execute(answers.update().values(ans=answer.ans,upvote=answer.upVote,downvote=answer.downVote).where(answers.c.ans_id == id))

@answer.delete('/answers/{id}')
def delete_answer(id: int):
    return conn.execute(answers.delete().where(answers.c.ans_id == id))