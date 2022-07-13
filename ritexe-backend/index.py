from fastapi import FastAPI
# from routes.user import user
# from routes.question import question
from routes.index import user,question
from fastapi.middleware.cors import CORSMiddleware
app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins= ["*"],
    allow_credentials = True,
    allow_methods=["*"],
    allow_headers=["*"],
)
app.include_router(user)
app.include_router(question)