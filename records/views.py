from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
import requests
from bs4 import BeautifulSoup

# Create your views here.


def index(request):
    return HttpResponse("Hello, world.")


def upload_meds_data(request):
    base_site = 'https://www.drugs.com/top200'
    response = requests.get(base_site)
    if response.ok is False:
        print('Error Status Code: ', response.status_code)
    else:
        html = response.content
    # make soup object to parse the IMDb html content
    soup = BeautifulSoup(html, 'html.parser')
    unordered_list = soup.find('ul', class_="ddc-list-column-2")
    rows = unordered_list.find_all('li')
    top_200_medications = []

    for row in rows:
        # get medication names
        name = row.text
        top_200_medications.append(name)

    cursor = connection.cursor()
    count = 0
    for name in top_200_medications:
        cursor.callproc('insert_medication', (name,))
        count += 1
    cursor.close()

    return HttpResponse("Added {} medications".format(count))








