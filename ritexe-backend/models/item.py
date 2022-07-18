from datetime import datetime
from sqlalchemy import ForeignKey, Integer, Table,Column,String,DateTime
from config.db import meta,engine
from .user import users

items = Table('item',meta,
Column('item_id',Integer,primary_key=True),
Column('name',String(255)),
Column('quantity',Integer),
Column('date',DateTime, default=datetime.now(), nullable=True),
Column('user_id',Integer, ForeignKey(users.c.id))
)


meta.create_all(engine)