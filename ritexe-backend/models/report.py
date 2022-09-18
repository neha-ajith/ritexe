from sqlalchemy import Integer, Table,Column
from config.db import meta,engine

reports = Table('report',meta,
Column('rep_id',Integer,primary_key=True),
Column('pos_id',Integer),
)

meta.create_all(engine)