from fastapi import APIRouter
from config.db import conn
from models.notification import notifications
from schemas.notification import Notification

notification = APIRouter()

@notification.get('/notifications/')
def fetch_notifications():
    return conn.execute(notifications.select()).fetchall()

@notification.get('/notifications/{uId}')
def fetch_user_notifications(uId:int):
    return conn.execute(notifications.select().where(notifications.c.user_id==uId)).fetchall()

@notification.get('/notifications/fetch/{id}')
def fetch_one_notification(id: int):
    return conn.execute(notifications.select().where(notifications.c.not_id==id)).fetchall()

@notification.post('/notifications/')
def post_notification(notification: Notification):
    return conn.execute(notifications.insert().values(not_id=notification.not_id,username=notification.username,prod_name=notification.prod_name,user_id=notification.user_id))

@notification.put('/notifications/{id}')
def update_notification(id: int,notification: Notification):
    return conn.execute(notifications.update().values(not_id=notification.not_id,username=notification.username,prod_name=notification.prod_name,user_id=notification.user_id).where(notifications.c.not_id==id))

@notification.delete('/notifications/{id}')
def delete_notification(id: int):
    return conn.execute(notifications.delete().where(notifications.c.not_id == id))