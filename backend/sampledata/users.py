import requests

sample_data = [
    {
        "full_name": "Samarth Asthan",
        "aadhaar_no": "000011112222",
        "dob": "2004-07-27",
        "profile": "https://media.licdn.com/dms/image/C4D03AQH7nD5jgTYpUw/profile-displayphoto-shrink_400_400/0/1661285518630?e=1692835200&v=beta&t=TeERvMPBN7t0aGWX5voXvXGNnbOguqmDVa-U7AhhrRA",
        "phone_no": 9557037766,
        "address": "VIT Chennai 600127",
        "mail": "samarthasthan27@gmail.com"
    },
    {
        "full_name": "Aarav Kapoor",
        "aadhaar_no": "111122223333",
        "dob": "1998-03-15",
        "profile": "https://picsum.photos/id/1/200/300",
        "phone_no": 9876543210,
        "address": "1234 Elm Street, Cityville 12345",
        "mail": "aarav.kapoor@example.com"
    },
    {
        "full_name": "Neha Patel",
        "aadhaar_no": "444455556666",
        "dob": "1990-11-02",
        "profile": "https://picsum.photos/id/2/200/300",
        "phone_no": 7890123456,
        "address": "4567 Oak Avenue, Townsville 67890",
        "mail": "neha.patel@example.com"
    },
    {
        "full_name": "Rajiv Sharma",
        "aadhaar_no": "777788889999",
        "dob": "1985-06-20",
        "profile": "https://picsum.photos/id/3/200/300",
        "phone_no": 8765432109,
        "address": "789 Maple Lane, Villageton 45678",
        "mail": "rajiv.sharma@example.com"
    },
    {
        "full_name": "Priya Gupta",
        "aadhaar_no": "123412341234",
        "dob": "2002-09-10",
        "profile": "https://picsum.photos/id/4/200/300",
        "phone_no": 7654321098,
        "address": "5678 Pine Road, Hamletown 23456",
        "mail": "priya.gupta@example.com"
    },
    {
        "full_name": "Kunal Verma",
        "aadhaar_no": "555566667777",
        "dob": "1996-12-28",
        "profile": "https://picsum.photos/id/5/200/300",
        "phone_no": 6543210987,
        "address": "890 Cedar Street, Metropolis 34567",
        "mail": "kunal.verma@example.com"
    },
    {
        "full_name": "Anika Shah",
        "aadhaar_no": "888899991111",
        "dob": "2001-04-18",
        "profile": "https://picsum.photos/id/6/200/300",
        "phone_no": 5432109876,
        "address": "123 Ivy Lane, Suburbia 45678",
        "mail": "anika.shah@example.com"
    },
    {
        "full_name": "Rahul Kumar",
        "aadhaar_no": "121212121212",
        "dob": "1994-07-05",
        "profile": "https://picsum.photos/id/7/200/300",
        "phone_no": 4321098765,
        "address": "456 Birch Avenue, Cityscape 67890",
        "mail": "rahul.kumar@example.com"
    },
    {
        "full_name": "Sneha Rao",
        "aadhaar_no": "131313131313",
        "dob": "2000-02-14",
        "profile": "https://picsum.photos/id/8/200/300",
        "phone_no": 3211098765,
        "address": "789 Elm Lane, Townville 23456",
        "mail": "sneha.rao@example.com"
    },
    {
        "full_name": "Amit Desai",
        "aadhaar_no": "141414141414",
        "dob": "1988-10-22",
        "profile": "https://picsum.photos/id/9/200/300",
        "phone_no": 2109876543,
        "address": "567 Oak Road, Villageton 34567",
        "mail": "amit.desai@example.com"
    },
    {
        "full_name": "Pooja Mehta",
        "aadhaar_no": "151515151515",
        "dob": "1999-05-30",
        "profile": "https://picsum.photos/id/10/200/300",
        "phone_no": 1098765432,
        "address": "890 Maple Lane, Hamletown 45678",
        "mail": "pooja.mehta@example.com"
    }
]

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
