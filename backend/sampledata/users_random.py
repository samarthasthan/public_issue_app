import requests
import random
import string
from datetime import datetime, timedelta

# Function to generate a random phone number
def generate_phone_number():
    return ''.join(random.choice(string.digits) for _ in range(10))

# Function to generate a random Aadhaar number
def generate_aadhaar_number():
    return ''.join(random.choice(string.digits) for _ in range(12))

# Function to generate a random date of birth within the age range of 18 to 60
def generate_dob():
    today = datetime.today()
    max_birth_date = today - timedelta(days=18 * 365)  # Minimum age of 18
    min_birth_date = today - timedelta(days=60 * 365)  # Maximum age of 60
    dob = random_date(min_birth_date, max_birth_date)
    return dob.strftime('%Y-%m-%d')

# Function to generate a random date within a range
def random_date(start, end):
    return start + timedelta(seconds=random.randint(0, int((end - start).total_seconds())))

# Generate 100 sample data entries
sample_data = []
for i in range(1000):
    data = {
        "full_name": f"Full Name {i}",
        "aadhaar_no": generate_aadhaar_number(),
        "dob": generate_dob(),
        "profile": f"https://picsum.photos/id/{i+11}/200/300",
        "phone_no": generate_phone_number(),
        "address": f"Address {i}",
        "mail": f"email{i}@example.com"
    }
    sample_data.append(data)

base_url = "http://127.0.0.1:8000/signup"

for data in sample_data:
    response = requests.post(
        base_url,
        headers={
            "accept": "application/json",
            "Content-Type": "application/json",
        },
        json=data
    )
    
    print(f"Response for {data['full_name']}:")
    print("Status Code:", response.status_code)
    print("Response Content:", response.content)
    print()
