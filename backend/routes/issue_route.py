from typing import List
import models
from fastapi import APIRouter, Depends
from schemas import issue_schema
from database import get_db
from sqlalchemy.orm import Session
from fastapi import HTTPException
from sqlalchemy.exc import IntegrityError
from fastapi import Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import func
from sqlalchemy import text

router= APIRouter(tags=["Issue"])

@router.get("/issues",response_model=List[issue_schema.IssueBaseOut])
async def get_issues(page: int = Query(1, alias="page", ge=1), per_page: int = Query(10, alias="per_page", le=100), db: Session = Depends(get_db)):
    offset = (page - 1) * per_page
    print(f"Page: {page}, Per Page: {per_page}, Offset: {offset}")
    issues = db.query(models.Issues).offset(offset).limit(per_page).all()
    return issues

@router.get("/issues/nearest")
async def get_issues(
    page: int = Query(1, alias="page", ge=1),
    per_page: int = Query(10, alias="per_page", le=100),
    longitude: float = Query(-122.4167, alias="longitude"),
    latitude: float = Query(37.7778, alias="latitude"),
    db: Session = Depends(get_db)
):
    offset = (page - 1) * per_page

    # Calculate the square of the distance using SQLite's ABS function
    distance_expr = text(
        "(ABS(issues.longitude - :longitude) * ABS(issues.longitude - :longitude)) + " +
        "(ABS(issues.latitude - :latitude) * ABS(issues.latitude - :latitude))"
    )

    # Query the database with pagination and ordering by distance
    issues = (
        db.query(models.Issues)
        .order_by(distance_expr)
        .params(longitude=longitude, latitude=latitude)
        .offset(offset)
        .limit(per_page)
        .all()
    )

    return issues


@router.post("/issue")
async def create_issue(issue_data: issue_schema.IssueBaseIn, db: Session = Depends(get_db)):
    # Check if the location already exists based on postcode
    existing_location = db.query(models.Locations).filter_by(
        postcode=issue_data.location.postcode,
    ).first()

    if existing_location:
        location_id = existing_location.location_id
    else:
        location = {
            "continent": issue_data.location.continent,
            "continentCode": issue_data.location.continentCode,
            "countryName": issue_data.location.countryName,
            "countryCode": issue_data.location.countryCode,
            "principalSubdivision": issue_data.location.principalSubdivision,
            "principalSubdivisionCode": issue_data.location.principalSubdivisionCode,
            "city": issue_data.location.city,
            "locality": issue_data.location.locality,
            "postcode": issue_data.location.postcode,
        }

        add_location = models.Locations(**location)
        db.add(add_location)
        try:
            db.commit()
        except IntegrityError as e:
            db.rollback()  # Rollback the transaction in case of error
            raise HTTPException(status_code=400, detail="Duplicate postcode")
        db.refresh(add_location)

        location_id = add_location.location_id

    issue = {
        "title": issue_data.title,
        "description": issue_data.description,
        "image": issue_data.image,
        "video": issue_data.video,
        "audio": issue_data.audio,
        "latitude": issue_data.latitude,
        "longitude": issue_data.longitude,
        "pluscode": issue_data.pluscode,
        "owner_id": issue_data.owner_id,
        "location": location_id,
    }

    add_issue = models.Issues(**issue)
    db.add(add_issue)
    db.commit()
    db.refresh(add_issue)
    
    return issue
