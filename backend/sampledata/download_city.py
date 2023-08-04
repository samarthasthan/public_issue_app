import requests

# URL of the CSV file
csv_url = "https://data.gov.in/files/ogdpv2dms/s3fs-public/all_india_PO_list_without_APS_offices_ver2_lat_long.csv"

# Send an HTTP GET request to the URL
response = requests.get(csv_url)

# Check if the request was successful
if response.status_code == 200:
    # Save the content of the response to a local file
    with open("downloaded_file.csv", "wb") as file:
        file.write(response.content)
    print("CSV file downloaded successfully.")
else:
    print(f"Failed to download the CSV file. Status code: {response.status_code}")
