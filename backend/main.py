from fastapi import Depends, FastAPI, Security
import models
from database import engine
from routes import auth_route,issue_route,app_routes

# app = FastAPI(dependencies=[Depends(get_api_key)])
app = FastAPI()
models.Base.metadata.create_all(engine)

# app.include_router(app_routes.router)
app.include_router(auth_route.router)
app.include_router(issue_route.router)
