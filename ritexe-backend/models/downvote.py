from sqlalchemy import ForeignKey, Integer, Table,Column
from config.db import meta,engine
from .user import users
from .answer import answers

downvotes = Table('downvote',meta,
Column('vote_id',Integer,primary_key=True),
Column('ans_id',Integer, ForeignKey(answers.c.ans_id)),
Column('user_id',Integer, ForeignKey(users.c.id))
)


meta.create_all(engine)