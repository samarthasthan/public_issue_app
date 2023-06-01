from typing import List
import models
from fastapi import APIRouter, Depends
from schemas import users_schema,issue_schema
from database import SessionLocal, get_db

router= APIRouter(tags=["Issue"])

@router.get("/issues",response_model=List[issue_schema.IssueBaseOut])
def get_issues(db: SessionLocal = Depends(get_db)):
    issues = db.query(models.Issues).all()
    return issues

@router.post("/issue",)
def create_issue(issue_data:issue_schema.IssueBaseIn, db: SessionLocal = Depends(get_db)):
    issue = models.Issues(**issue_data.dict())
    db.add(issue)
    db.commit()
    db.refresh(issue)
    return issue

