import requests
import pandas as pd
import json
import random
import string
import sqlite3

# Load the CSV data
location_data = pd.read_csv("downloaded_file.csv")

# Connect to the SQLite database
conn = sqlite3.connect("/Users/samarthasthan/Desktop/public_issue_app/backend/database.db")
cursor = conn.cursor()

# Fetch user IDs from the database
cursor.execute("SELECT user_id FROM users")
user_ids = [row[0] for row in cursor.fetchall()]
conn.close()

# Function to generate random string
def random_string(length):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for _ in range(length))

# Initialize a counter for successful and failed posts
successful_posts = 0
failed_posts = 0

# Generate 100 posts using random locations within India
for post_number in range(1, 10001):  # Loop with a range to keep track of the post number
    # Generate random latitude and longitude within the approximate geographical range of India
    latitude = random.uniform(8.0, 37.0)
    longitude = random.uniform(68.0, 98.0)
    
    # Ensure latitude and longitude are within valid ranges
    if not (8.0 <= latitude <= 37.0) or not (68.0 <= longitude <= 98.0):
        print(f"Invalid latitude or longitude generated for post {post_number}. Skipping.")
        continue
    
    random_location = location_data.sample(n=1).iloc[0]
    city = random_location['officename']
    state = random_location['statename']
    pincode = int(random_location['pincode'])  # Convert pincode to integer
    
    post = {
        "title": f"Issue - {random_string(5)}",
        "description": f"This is an issue about {random_string(20)}.",
        "image": "image_url.jpg",
        "video": "video_url.mp4",
        "audio": "audio_url.mp3",
        "latitude": latitude,
        "longitude": longitude,
        "pluscode": "string",
        "owner_id": random.choice(user_ids),
        "location": {
            "continent": "Asia",
            "continentCode": "AS",
            "countryName": "India",
            "countryCode": "IN",
            "principalSubdivision": state,
            "principalSubdivisionCode": "XX",  # Replace with actual state code if available
            "city": city,
            "locality": "Random Locality",
            "postcode": pincode
        }
    }

    # Send the post data using requests
    headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json'
    }
    
    response = requests.post('http://127.0.0.1:8000/issue', headers=headers, json=post)
    
    if response.status_code == 200:
        print(f"Post {post_number} successfully created. Response: {response.content}")
        successful_posts += 1
    else:
        print(f"Failed to create post {post_number}. Response: {response.content}")
        failed_posts += 1

# Print the count of successful and failed posts
print(f"Total successful posts: {successful_posts}")
print(f"Total failed posts: {failed_posts}")
