from sqlalchemy import create_engine, MetaData
engine = create_engine('mysql+pymysql://root:password@localhost:3306/ritexe')
meta = MetaData()
conn = engine.connect()