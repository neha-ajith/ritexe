from fastapi import APIRouter
from config.db import conn
from models.downvote import downvotes
from schemas.downvote import DownVote

downvote = APIRouter()

@downvote.get('/downvotes/')
def fetch_downvotes():
    return conn.execute(downvotes.select()).fetchall()

@downvote.get('/downvotes/{userId}/{ansId}')
def fetch_user_downvote(userId:int,ansId:int):
    return conn.execute(downvotes.select().where(downvotes.c.user_id==userId and downvotes.c.ans_id==ansId)).fetchall()

@downvote.post('/downvotes/')
def post_downvote(downvote: DownVote):
    return conn.execute(downvotes.insert().values(user_id=downvote.user_id,ans_id=downvote.ans_id))

@downvote.put('/downvotes/{id}')
def update_downvote(id: int,downvote: DownVote):
    return conn.execute(downvotes.update().values(user_id=downvote.user_id,ans_id=downvote.ans_id).where(downvotes.c.vote_id == id))

@downvote.delete('/downvotes/{id}')
def delete_downvote(id: int):
    return conn.execute(downvotes.delete().where(downvotes.c.vote_id == id))