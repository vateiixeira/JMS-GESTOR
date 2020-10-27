from django.contrib import admin
from django.urls import path
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_jwt.views import refresh_jwt_token
from .views import *
from ..planejado.views import *
from ..metas.views import *

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
    path('sazonalidade/list/<str:regiao>', list_sazonalidade_regiao),
    path('sazonalidade', sazonalidade),
    path('sazonalidade_cota', sazonalidade_cota),
    path('sazonalidade/<str:regiao>', sazonalidade_regiao),
    path('sazonalidade/modelo/<str:modelo>', sazonalidade_modelo),
    path('sazonalidade/cidade/<str:cidade>', sazonalidade_cidade),
    path('sazonalidade/vendedor/<str:vendedor>', sazonalidade_vendedor),
    #path('sazonalidade/previsao/<str:cidade>/<int:valor>', previsto_sazonalidade_cidade),
    #path('sazonalidade/previsao/regiao/<str:regiao>/<int:valor>', previsto_sazonalidade_cidade_regiao),
    path('sazonalidade/previsao/regiao/vendedor/<str:regiao>/<int:valor>', previsto_sazonalidade_vendedor_regiao),
    path('previsao/regiao/<str:regiao>/<int:valor>', previsto_planejamento_regiao),
    path('edit/previsao/regiao/<str:regiao>', previsto_planejamento_regiao_edit),
    path('previsao/regiao/cota/<str:regiao>/<int:valor>', previsto_planejamento_regiao_cota),
    path('grava/sazonalidade/modelo/cidade', grava_sazonalidade_modeloCidade),
    path('grava/sazonalidade/modelo/vendedor', grava_sazonalidade_modeloVendedor),
    path('grava/planejado/etapa1', grava_planejado_firstEtapa),
    path('grava/planejado/cota/etapa1', grava_planejado_firstEtapa_cota),
    path('salva/planejado', post_planejado),
    path('salva/planejado/cota', post_planejado_cota),
    path('list/sazonalidade/modelo/cidade', list_sazonalidade_modeloCidade),
    path('list/sazonalidade/modelo/vendedor', list_sazonalidade_modeloVendedor),
    path('list/planejado/<str:modelo>/<str:cidade>', list_planejado_modeloCidade),
    path('list/planejado/vendedor/<str:modelo>/<str:vendedor>', list_planejado_modeloVendedor),
    path('remove_moto_cancel/', remove_moto_cancel),
    path('login/', obtain_jwt_token),
    path('refresh-token/', refresh_jwt_token),
    path('user/', user_detail),
    path('new-user/', new_user),
    ### edit metas
    path('edit/meta/modelo', edit_meta_modelo),
    path('edit/meta/cidade', edit_meta_cidade),
    path('edit/meta/vendedor', edit_meta_vendedor),
    ###### listagens 
    path('list/cidades', list_cidade_por_regiao),


]
