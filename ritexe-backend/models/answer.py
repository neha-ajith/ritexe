from datetime import datetime
from sqlalchemy import ForeignKey, Integer, Table,Column,String,DateTime
from config.db import meta,engine
from .user import users
from .question import questions

answers = Table('answer',meta,
Column('ans_id',Integer,primary_key=True),
Column('ans',String(255)),
Column('upvote',Integer),
Column('downvote',Integer),
Column('date',DateTime, default=datetime.now(), nullable=True),
Column('qs_id',Integer, ForeignKey(questions.c.qs_id)),
Column('user_id',Integer, ForeignKey(users.c.id)))


meta.create_all(engine)