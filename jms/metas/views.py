from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from rest_framework.authtoken.models import Token
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
import json
from rest_framework.decorators import api_view, permission_classes
from ..planejado.models import *
from django.contrib.auth.models import User

@api_view(['POST'])
@permission_classes([AllowAny])
def edit_meta_modelo(request):
    ano = 2020
    data = json.loads(request.body)
    obj_modelo = MotoPerfil.objects.get(nome = data['modelo'])
    query = FirstEtapa.objects.get(regiao = data['regiao'], modelo = obj_modelo, ano = ano)

    query.jan= data['data'][0] 
    query.fev= data['data'][1] 
    query.mar= data['data'][2] 
    query.abr= data['data'][3] 
    query.mai= data['data'][4] 
    query.jun= data['data'][5] 
    query.jul= data['data'][6] 
    query.ago= data['data'][7] 
    query.set= data['data'][8] 
    query.out= data['data'][9] 
    query.nov= data['data'][10]
    query.dez= data['data'][11]             
    query.aplicado = sum(data['data'])  
    query.save()   
    return Response('ok')

@api_view(['POST'])
@permission_classes([AllowAny])
def edit_meta_cidade(request):
    ano = 2020
    data = json.loads(request.body)
    obj_modelo = MotoPerfil.objects.get(nome = data['modelo'])
    obj_cidade = Cidade.objects.get(nome = data['cidade'])
    query = CidadeModelo.objects.get(cidade = obj_cidade, modelo = obj_modelo, ano = ano)

    query.aplicado_jan= data['data'][0] 
    query.aplicado_fev= data['data'][1] 
    query.aplicado_mar= data['data'][2] 
    query.aplicado_abr= data['data'][3] 
    query.aplicado_mai= data['data'][4] 
    query.aplicado_jun= data['data'][5] 
    query.aplicado_jul= data['data'][6] 
    query.aplicado_ago= data['data'][7] 
    query.aplicado_sete= data['data'][8] 
    query.aplicado_out= data['data'][9] 
    query.aplicado_nov= data['data'][10]
    query.aplicado_dez= data['data'][11]             
    query.aplicado = sum(data['data'])  
    query.save() 
    print(query)  
    return Response('ok')

@api_view(['POST'])
@permission_classes([AllowAny])
def edit_meta_vendedor(request):
    ano = 2020
    data = json.loads(request.body)
    obj_modelo = MotoPerfil.objects.get(nome = data['modelo'])
    user = User.objects.get(first_name = data['vendedor'])
    obj_vendedor = Perfil.objects.get(usuario = user)
    query = VendedorModelo.objects.get(vendedor = obj_vendedor, modelo = obj_modelo, ano = ano)
    print(query) 
    query.aplicado_jan= data['data'][0] 
    query.aplicado_fev= data['data'][1] 
    query.aplicado_mar= data['data'][2] 
    query.aplicado_abr= data['data'][3] 
    query.aplicado_mai= data['data'][4] 
    query.aplicado_jun= data['data'][5] 
    query.aplicado_jul= data['data'][6] 
    query.aplicado_ago= data['data'][7] 
    query.aplicado_sete= data['data'][8] 
    query.aplicado_out= data['data'][9] 
    query.aplicado_nov= data['data'][10]
    query.aplicado_dez= data['data'][11]             
    query.aplicado = sum(data['data'])  
    query.save() 
    print(query)  
    return Response('ok')

