
from django.urls import path, include
from . import views

urlpatterns = [
    path("data-json/", views.datajson, name="datajson"),
    # path("index/", views.index, name="index"),
]
