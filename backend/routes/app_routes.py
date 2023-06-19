from typing import List
import models
from fastapi import APIRouter, Depends
from schemas import app_schema
from database import SessionLocal, get_db

router= APIRouter(tags=["App"])

@router.get("/app/issues/",response_model=app_schema.HomePage)
def get_issues(user_id:str ,db: SessionLocal = Depends(get_db)):
    issues = db.query(models.Issues).all()
    data = {
        "registered_complaint":9,
        "closed_complaint":0,
        "issues":issues
    }

    return data