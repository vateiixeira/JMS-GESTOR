from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from jms.core.models import Moto,Cota,Equipe,Cidade
from jms.core.utils import get_mes_ano
from django.db.models import Sum
from rest_framework.decorators import api_view
from .serializers import *

@api_view(['GET'])
def desempenhoCidade(request, cidade):
    #mes,ano = get_mes_ano()
    ano = 2020
    mes = 3

    cidade_obj = Cidade.objects.get(nome = cidade)

    query_equipe = Equipe.objects.filter(cidade = cidade_obj)
    equipe = EquipeSerializer(query_equipe, many=True)

    #moto = Moto.objects.filter(Municipio = cidade, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
    #cota = Cota.objects.filter(Municipio = cidade, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
    #visita = 120

    list_moto = ["XRE 300 ABS","SH 150I","CG 160 START","CRF 250F","XRE 190","BIZ 125","CG 160 FAN","CB 250F TWISTER ABS","NXR 160 BROS ESDD","CB 250F TWISTER STD","ELITE 125","POP 110I","CG 160 TITAN","CRF 230F","BIZ 110I","PCX 150"]

    moto_dict = {}
    contador = 1
    for i in list_moto:

        total_moto = Moto.objects.filter(Municipio = cidade, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        total_cota = Cota.objects.filter(Municipio = cidade, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()

       
        if total_moto is None or total_moto < 1:
            total_moto = 0

        if total_cota is None or total_cota < 1:
            total_cota = 0

        area_geral = total_cota + total_moto


        moto = Moto.objects.filter(Veiculo = i, Municipio = cidade, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Modelo= i, Municipio = cidade, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
        


        if moto is None or moto < 1:
            moto = 0

        if cota is None or moto < 1:
            cota = 0
        
        obj_avatar = MotoPerfil.objects.get(nome = i)
        avatar = obj_avatar.avatar

        #caulo da area de cada modelo
        total_modelo = moto + cota
        if area_geral > 0:
            area = int((100 * total_modelo)/area_geral)
        else:
            area = 0 



        newdici = {
            'nome' :  i,
            'moto' : moto,
            'cota' : cota,
            'avatar' : avatar,
            'area' : area,
        }
        contador = contador + 1 
        moto_dict[contador] = newdici

        

    context = {
        'equipe' : equipe.data,
        'moto' : moto_dict
    }

    return Response(context)

@api_view(['GET'])
def list_motos(request):
    query = MotoPerfil.objects.all()
    serializer = MotoSerializer(query, many=True)


    return Response(serializer.data)


@api_view(['GET'])
def desempenhoMotoRegiao(request,regiao):
    motos = MotoPerfil.objects.all()    

    ano = 2020
    mes = 3

    # pega cidades da regiao
    list_cidade = list(Cidade.objects.filter(regiao = regiao))

    # pega o total da regiao em cotas e motos
    total_moto = Moto.objects.filter(Municipio__in = list_cidade, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
    total_cota = Cota.objects.filter(Municipio__in = list_cidade, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
    area_geral = total_cota + total_moto    


    context = {}
    contador = 1

    for value in motos:
        moto = Moto.objects.filter(Veiculo = value.nome, Empresa = regiao, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Modelo = value.nome, Municipio__in = list_cidade, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
        
        if moto is None or moto < 1:
            moto = 0

        if cota is None:
            cota = 0

        #caulo da area de cada modelo
        total_modelo = moto + cota
        area = int((100 * total_modelo)/area_geral)

        new_dict = {
            'modelo' : value.nome,
            'avatar' : value.avatar,
            'moto' : moto,
            'cota' : cota,
            'area' : area
        }
        context[contador] = new_dict
        contador = contador + 1

    return Response(context)

@api_view(['GET'])
def list_cidade(request, regiao):
    cidades = Cidade.objects.filter(regiao=regiao)

    ano=2020
    mes=3

    cidade_dict = {}
    contador = 1
    for cidade in cidades:
         
        moto = Moto.objects.filter(Municipio = cidade.nome, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()

        if moto is None:
            moto = 0

        if cota is None:
            cota = 0


        # print('-'*30)
        # print(f'Modelo =====>>> {i}')
        # print(f'Cidade =====>>> {cidade}')
        # print(f'Moto =====>>> {moto}')
        # print(f'cota =====>>> {cota}')
        # print('-'*30)


        newdici = {
            'nome' :  cidade.nome,
            'moto' : moto,
            'cota' : cota,
        }
        contador = contador + 1 
        cidade_dict[contador] = newdici

    return Response(cidade_dict)


