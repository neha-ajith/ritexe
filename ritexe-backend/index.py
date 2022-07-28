from fastapi import FastAPI
from routes.index import user,question,answer,item,upvote,downvote
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
app.include_router(answer)
app.include_router(item)
app.include_router(upvote)
app.include_router(downvote)