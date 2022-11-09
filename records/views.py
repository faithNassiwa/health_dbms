from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
import requests
from bs4 import BeautifulSoup

# Create your views here.


def index(request):
    return HttpResponse("Hello, world.")


def get_medications():
    cursor = connection.cursor()
    cursor.callproc('get_all_medications')
    medications_list = []
    # for result in cursor.stored_results(): ## not working, not available probably in the package
    for result in cursor.fetchall():
        medications_list.append(result[0])
    cursor.close()
    return medications_list


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
    meds_list = get_medications()
    for row in rows:
        # get medication names
        name = row.text
        top_200_medications.append(name)
    count = 0
    cursor = connection.cursor()
    for name in top_200_medications:
        if name not in meds_list:
            cursor.callproc('insert_medication', (name,))
            count += 1
    cursor.close()

    return HttpResponse("Added {} new medications".format(count))








