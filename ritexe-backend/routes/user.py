from fastapi import APIRouter
from config.db import conn
from models.user import users
from schemas.user import User

user = APIRouter()

@user.get('/users/')
def fetch_users():
    return conn.execute(users.select()).fetchall()

@user.get('/users/{id}')
def fetch_one_user(id:int):
    return conn.execute(users.select().where(users.c.id==id)).fetchall()

@user.get('/users/auth/{username}')
def fetch_username(username:str):
    return conn.execute(users.select().where(users.c.username==username)).fetchall()

@user.post('/users/')
def post_user(user: User):
    return conn.execute(users.insert().values(username=user.username,name=user.name,email=user.email,password=user.password,upvote=user.upVotes))

@user.put('/users/{id}')
def update_user(id: int,user: User):
    return conn.execute(users.update().values(username=user.username,name=user.name,email=user.email,password=user.password,upvote=user.upVotes).where(users.c.id == id))

@user.put('/users/pwd/{id}')
def update_pwd(id: int,user: User):
    return conn.execute(users.update().values(password=user.password).where(users.c.id == id))

@user.delete('/users/{id}')
def delete_user(id: int):
    return conn.execute(users.delete().where(users.c.id == id))