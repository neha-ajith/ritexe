from fastapi import APIRouter
from config.db import conn
from models.item import items
from schemas.item import Item

item = APIRouter()

@item.get('/items/')
def fetch_items():
    return conn.execute(items.select()).fetchall()

@item.get('/items/{id}')
def fetch_user_items(id:int):
    return conn.execute(items.select().where(items.c.user_id == id)).fetchall()

@item.post('/items/')
def post_item(item: Item):
    return conn.execute(items.insert().values(name=item.name,quantity=item.quantity,date=item.date,user_id=item.user_id))

@item.put('/items/{id}')
def update_item(id: int,item: Item):
    return conn.execute(items.update().values(name=item.name,quantity=item.quantity,date=item.date,user_id=item.user_id).where(items.c.item_id == id))

@item.delete('/items/{id}')
def delete_item(id: int):
    return conn.execute(items.delete().where(items.c.item_id == id))