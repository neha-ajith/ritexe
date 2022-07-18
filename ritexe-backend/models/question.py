from datetime import datetime
from sqlalchemy import ForeignKey, Integer, Table,Column,String,DateTime
from config.db import meta,engine
from .user import users

questions = Table('question',meta,
Column('qs_id',Integer,primary_key=True),
Column('qs_title',String(255)),
Column('qs_desc',String(255)),
Column('date',DateTime, default=datetime.now(), nullable=True),
Column('user_id',Integer, ForeignKey(users.c.id))
)

meta.create_all(engine)