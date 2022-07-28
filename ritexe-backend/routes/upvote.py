from fastapi import APIRouter
from config.db import conn
from models.upvote import upvotes
from schemas.upvote import UpVote

upvote = APIRouter()

@upvote.get('/upvotes/')
def fetch_upvotes():
    return conn.execute(upvotes.select()).fetchall()

@upvote.get('/upvotes/{userId}')
def fetch_user_upvotes(userId:int):
    return conn.execute(upvotes.select().where(upvotes.c.user_id==userId)).fetchall()

@upvote.post('/upvotes/')
def post_upvote(upvote: UpVote):
    return conn.execute(upvotes.insert().values(user_id=upvote.user_id,ans_id=upvote.ans_id))

@upvote.put('/upvotes/{id}')
def update_upvote(id: int,upvote: UpVote):
    return conn.execute(upvotes.update().values(user_id=upvote.user_id,ans_id=upvote.ans_id).where(upvotes.c.vote_id == id))

@upvote.delete('/upvotes/{id}')
def delete_upvote(id: int):
    return conn.execute(upvotes.delete().where(upvotes.c.vote_id == id))