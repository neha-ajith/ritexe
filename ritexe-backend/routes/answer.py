from fastapi import APIRouter
from config.db import conn
from models.answer import answers
from schemas.answer import Answer

answer = APIRouter()

@answer.get('/answers/')
def fetch_answers():
    return conn.execute(answers.select()).fetchall()

@answer.get('/answers/{qsId}')
def fetch_those_answers(qsId: int):
    return conn.execute(answers.select().where(answers.c.qs_id==qsId)).fetchall()

@answer.get('/answers/users/{userId}')
def fetch_user_answers(userId: int):
    return conn.execute(answers.select().where(answers.c.user_id==userId)).fetchall()

@answer.post('/answers/')
def post_answer(answer: Answer):
    return conn.execute(answers.insert().values(ans=answer.ans,upvote=answer.upVote,downvote=answer.downVote,date=answer.date,qs_id=answer.qs_id,user_id=answer.user_id))

@answer.put('/answers/{id}')
def update_answer(id: int,answer: Answer):
    return conn.execute(answers.update().values(ans=answer.ans,upvote=answer.upVote,downvote=answer.downVote,date=answer.date,qs_id=answer.qs_id,user_id=answer.user_id).where(answers.c.ans_id == id))

@answer.put('/answers/upvote/{id}')
def update_upvote(id: int,answer: Answer):
    return conn.execute(answers.update().values(upvote=answer.upVote).where(answers.c.ans_id == id))

@answer.put('/answers/downvote/{id}')
def update_upvote(id: int,answer: Answer):
    return conn.execute(answers.update().values(upvote=answer.downVote).where(answers.c.ans_id == id))

@answer.delete('/answers/{id}')
def delete_answer(id: int):
    return conn.execute(answers.delete().where(answers.c.ans_id == id))