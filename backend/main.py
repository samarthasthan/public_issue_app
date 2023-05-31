from fastapi import FastAPI
import models
from database import engine
from routes import auth_route,issue_route
app = FastAPI()

models.Base.metadata.create_all(engine)

app.include_router(auth_route.router)
app.include_router(issue_route.router)

@app.get("/home")
async def home():
    return "Hello Wolrd!"