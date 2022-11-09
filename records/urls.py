from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('upload_meds_data', views.upload_meds_data, name='upload_meds_data'),
]
