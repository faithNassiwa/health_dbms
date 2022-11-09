from django.urls import path

from . import views

urlpatterns = [
    #path('', views.index, name='index'),
    path('', views.upload_meds_data, name='upload_meds_data')
]
