from django.contrib import admin
from django.urls import path
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_jwt.views import refresh_jwt_token
from .views import *

app_name = 'api'

urlpatterns = [
    path('desempenho/<str:cidade>/<int:dia>/<int:mes>/<int:ano>/', desempenhoCidade),
    path('desempenho/geral/cabecalho/<int:dia>/<int:mes>/<int:ano>/', desempenho_geral_cabecalho),
    path('desempenho/regiao/geral/<str:regiao>/<int:id>/<int:dia>/<int:mes>/<int:ano>/', desempenho_regiao_equipe),
    path('desempenho/modelo/<str:regiao>/<int:dia>/<int:mes>/<int:ano>/', desempenhoMotoRegiao),
    path('desempenho/modelo/<str:modelo>/<str:regiao>/<int:dia>/<int:mes>/<int:ano>/', desempenho_modelo),
    path('desempenho/vendedor/<str:vendedor>/<str:regiao>/<int:dia>/<int:mes>/<int:ano>/', desempenho_vendedor),
    path('listagem/motos/<int:dia>/<int:mes>/<int:ano>/', list_motos),
    path('listagem/cidade/<str:regiao>/<int:dia>/<int:mes>/<int:ano>/', list_cidade),
    path('listagem/cidade/vendedor/<str:regiao>', list_dados_regiao),
    path('produto/<str:modelo>/<int:dia>/<int:mes>/<int:ano>', produto_modelo_geral),
    path('produto/<str:modelo>/<int:dia>/<int:mes>/<int:ano>/<str:regiao>', produto_modelo_regiao),
    path('produto/<str:modelo>/<int:dia>/<int:mes>/<int:ano>/<str:cidade>/cidade', produto_modelo_cidade),
    path('produto/<str:modelo>/<int:dia>/<int:mes>/<int:ano>/<str:vendedor>/vendedor', produto_modelo_vendedor),
    path('produto/<str:modelo>/<int:dia>/<int:mes>/<int:ano>/<str:vendedor>/<str:cidade>', produto_modelo_vendedor_cidade),
    path('analitico/<int:dia>/<int:mes>/<int:ano>', analitico),
    path('sazonalidade', sazonalidade),
    path('sazonalidade/<str:regiao>', sazonalidade_regiao),
    path('sazonalidade/modelo/<str:modelo>', sazonalidade_modelo),
    path('sazonalidade/cidade/<str:cidade>', sazonalidade_cidade),
    path('sazonalidade/vendedor/<str:vendedor>', sazonalidade_vendedor),
    path('sazonalidade/previsao/<str:cidade>/<int:valor>', previsto_sazonalidade_cidade),
    path('sazonalidade/previsao/regiao/<str:regiao>/<int:valor>', previsto_sazonalidade_cidade_regiao),
    path('sazonalidade/previsao/regiao/vendedor/<str:regiao>/<int:valor>', previsto_sazonalidade_vendedor_regiao),
    path('login/', obtain_jwt_token),
    path('refresh-token/', refresh_jwt_token),
    path('user/', user_detail),
    path('new-user/', new_user),
]
