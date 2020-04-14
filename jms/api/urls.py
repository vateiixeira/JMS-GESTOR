from django.contrib import admin
from django.urls import path
from .views import *

app_name = 'api'

urlpatterns = [
    path('desempenho/<str:cidade>/', desempenhoCidade),
    path('desempenho/modelo/<str:regiao>/', desempenhoMotoRegiao),
    path('listagem/motos/', list_motos),
    path('listagem/cidade/<str:regiao>', list_cidade)
]
