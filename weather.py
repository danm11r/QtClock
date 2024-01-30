# Daniel Miller Jan 2024
# 
# This script will fetch live weather data from open weather API and return temperature data

import requests

API_KEY = ""
ZIP_CODE = ""
UNITS = "imperial"

def get_curr_temp():

    import requests
    api_url = "https://api.openweathermap.org/data/2.5/weather?zip=" + ZIP_CODE + "&appid=" + API_KEY + "&units=" + UNITS
    
    try:
        response = requests.get(api_url)

        if (response.status_code == 200):

            wdata = response.json()
            temp = wdata['main']['temp']
            temp_min = wdata['main']['temp_min']
            temp_max = wdata['main']['temp_max']

        else:

            temp = 12
            temp_min = 11
            temp_max = 13

    except:

        temp = 12
        temp_min = 11
        temp_max = 13

    return [temp, temp_min, temp_max]