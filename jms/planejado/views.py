from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from jms.core.models import *
from .models import * 
from jms.core.utils import get_mes_ano
from django.db.models import Sum
from rest_framework.decorators import api_view, permission_classes
from .serializers import *
from django.contrib.auth.models import User
from jms.account.models import Perfil,PlanejadoUser
import calendar
from django.utils.formats import localize
import locale
from rest_framework.authtoken.models import Token
from rest_framework.authentication import SessionAuthentication, BasicAuthentication
from rest_framework.permissions import IsAuthenticated, AllowAny
from django.core.serializers import serialize 
from django.db import IntegrityError
import json
from django.http import HttpResponse
from jms.account.models import REGIAO_CHOICE
import math 
from django.db.models import Avg, Count, Min, Sum

@api_view(['GET'])
@permission_classes([AllowAny])
def grava_sazonalidade_modeloCidade(request):

    def modelo(ano):
        #obj_modelo = MotoPerfil.objects.distinct('nome')
        obj_modelo = MotoPerfil.objects.all()

        cidades = Cidade.objects.all()

        for x in obj_modelo:
            for cidade in cidades:
                realizado_regiao_ano = Moto.objects.filter(Municipio=cidade.nome, Veiculo=x.nome, Data__gte=f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(
                    Cancelada=True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                if realizado_regiao_ano is None:
                    realizado_regiao_ano = 0
                # if cidade.nome == 'JANAUBA':
                #     print('CIDADE ->', cidade.nome)
                #     print('MODELO ->', x.nome)
                #     print('realizado_regiao_ano', realizado_regiao_ano)
                #     print('realizado_regiao_ano', realizado_regiao_ano)

                for mes in range(1, 13):
                    instancia = SazonalidadeModeloCidade()
                    instancia.regiao = cidade.regiao
                    instancia.cidade = cidade
                    instancia.modelo = x
                    instancia.ano_base = ano
                    instancia.vl_total_anual = realizado_regiao_ano
                    ultimo_dia_mes = calendar.monthrange(ano, mes)
                    instancia.mes = mes
                    realizado_modelo_mes = Moto.objects.filter(Municipio=cidade.nome, Veiculo=x.nome, Data__gte=f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(
                        Cancelada=True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                    if realizado_modelo_mes is None or realizado_modelo_mes < 0 or realizado_regiao_ano == 0:
                        porcentagem_mes = 0
                        instancia.percentual = 0
                    else:
                        #porcentagem_mes = realizado_modelo_mes / realizado_regiao_ano
                        porcentagem_mes = (realizado_modelo_mes / realizado_regiao_ano) * 100
                        instancia.percentual = float(
                            format(porcentagem_mes, '.2f'))
                    # if cidade.nome == 'JANAUBA':
                    #     print('MES', mes)
                    #     print('REALIZADO', porcentagem_mes)
                    instancia.save()
        return 'ok'


    modelo(2019)

    context = {
        'modelo'
    }
    return Response(context)

@api_view(['GET'])
@permission_classes([AllowAny])
def grava_sazonalidade_modeloVendedor(request):

    def modelo(ano):
        obj_modelo = MotoPerfil.objects.distinct('nome')
        vendedores = Perfil.objects.filter(cargo = 'VENDEDOR')
        realizado_modelo_dict = dict()
        realizado_modelo_mes_dict = dict()
        total_dict = dict()
        cidade_dict = dict()

        for x in obj_modelo:
            for vendedor in vendedores:
                realizado_regiao_ano = Moto.objects.filter(Veiculo= x.nome, Vendedor_cpf=vendedor.cpf, Data__gte=f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(
                    Cancelada=True).aggregate(Sum('Quantidade'))['Quantidade__sum']

                if realizado_regiao_ano is None:
                    realizado_regiao_ano = 0
                    continue

                realizado_modelo_mes_dict['anual'] = realizado_regiao_ano

                cidade_dici = {}
                for mes in range(1, 13):
                    instancia = SazonalidadeModeloVendedor()
                    instancia.modelo = x
                    instancia.vendedor_cpf = vendedor.cpf
                    instancia.vendedor_nome = vendedor.usuario.first_name
                    instancia.ano_base = ano
                    instancia.vl_total_anual = realizado_regiao_ano
                    ultimo_dia_mes = calendar.monthrange(ano, mes)
                    instancia.mes = mes
                    realizado_modelo_mes = Moto.objects.filter(Veiculo= x.nome, Vendedor_cpf=vendedor.cpf, Data__gte=f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(
                        Cancelada=True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                    if realizado_modelo_mes is None or realizado_modelo_mes < 0 or realizado_regiao_ano == 0:
                        porcentagem_mes = 0
                        realizado_modelo_mes_dict[mes] = 0
                        instancia.percentual = 0
                    else:
                        #porcentagem_mes = realizado_modelo_mes / realizado_regiao_ano
                        porcentagem_mes = (realizado_modelo_mes / realizado_regiao_ano) * 100
                        instancia.percentual = float(
                            format(porcentagem_mes, '.2f'))
                        realizado_modelo_mes_dict[mes] = float(
                            format(porcentagem_mes, '.2f'))
                    #print(instancia)
                    instancia.save()
                cidade_dici[vendedor.usuario.first_name] = realizado_modelo_mes_dict
                cidade_dict[vendedor.usuario.first_name] = cidade_dici[vendedor.usuario.first_name]
                realizado_modelo_mes_dict = {}
            realizado_modelo_dict[x.nome] = cidade_dict
        return realizado_modelo_dict


    obj = modelo(2019)

    context = {
        'ok' : obj
    }
    return Response(context)



@api_view(['POST'])
@permission_classes([AllowAny])
def grava_planejado_firstEtapa(request):
    data = json.loads(request.body)
    modelos = data['dados']['modelo']
    ano = data['ano']
    regiao = data['regiao']
    context = {}
    for key,value in modelos.items():
        obj_modelo = MotoPerfil.objects.get(nome = key)

        # checa se o registro ja existe no banco
        try:
            check = FirstEtapa.objects.get(regiao = regiao, ano = ano, modelo = obj_modelo)
        except FirstEtapa.DoesNotExist: 
            #Instancia os dados do post e salva no banco
            instancia = FirstEtapa()
            instancia.ano = ano
            instancia.regiao = regiao
            instancia.modelo = obj_modelo
            instancia.jan = value['dados'][0]
            instancia.fev = value['dados'][1]
            instancia.mar = value['dados'][2]
            instancia.abr = value['dados'][3]
            instancia.mai = value['dados'][4]
            instancia.jun = value['dados'][5]
            instancia.jul = value['dados'][6]
            instancia.ago = value['dados'][7]
            instancia.sete =value['dados'][8]
            instancia.out = value['dados'][9]
            instancia.nov = value['dados'][10]
            instancia.dez = value['dados'][11]
            instancia.previsto = value['previsto']
            instancia.aplicado = value['aplicado']
            instancia.save()

            context[key] = 'Registro inserido'
        else:
            check.ano = ano
            check.regiao = regiao
            check.modelo = obj_modelo
            check.jan = value['dados'][0]
            check.fev = value['dados'][1]
            check.mar = value['dados'][2]
            check.abr = value['dados'][3]
            check.mai = value['dados'][4]
            check.jun = value['dados'][5]
            check.jul = value['dados'][6]
            check.ago = value['dados'][7]
            check.sete =value['dados'][8]
            check.out = value['dados'][9]
            check.nov = value['dados'][10]
            check.dez = value['dados'][11]
            check.previsto = value['previsto']
            check.aplicado = value['aplicado']
            check.save()
            context[key] = 'Registro atualizado'
    return Response(context)


@api_view(['GET'])
@permission_classes([AllowAny])
def previsto_planejamento_regiao(request,regiao,valor):

    def cidade(regiao,valor):
        obj_cidade = Cidade.objects.filter(regiao=regiao)
        realizado_cidade_dict = dict()
        realizado_cidade_mes_dict = dict()
        total_dict = dict()

        #realizado_total_ano = SazonalidadeCidade.objects.filter(cidade__in = obj_cidade).aggregate(Sum('vl_total_anual'))['vl_total_anual__sum']
        query = SazonalidadeCidade.objects.filter(cidade__in = obj_cidade).distinct('cidade')
        realizado_total_ano =0
        for x in query:
            realizado_total_ano = realizado_total_ano + x.vl_total_anual
        
        for x in obj_cidade:
            somameses = 0
            for mes in range(1,13):
                sazonalidade = SazonalidadeCidade.objects.get(cidade_id = x.id, mes = mes)
                realizado_cidade_ano = sazonalidade.vl_total_anual
                #CALCULA A PARTICIPAÇÃO DA CIDADE 
                participacao_cidade = realizado_cidade_ano / realizado_total_ano

                # PEGA MEU VALOR GERAL E SUBTRAI DA PARTICIPAÇÃO DA CIDADE EM ESPECIFICO...
                valor_cidade = round(valor * participacao_cidade)
        
                
                realizado_cidade_mes = SazonalidadeCidade.objects.only('percentual').get(cidade = x, mes = mes).percentual 
                previsto =  round((realizado_cidade_mes /100 ) * valor_cidade)
                realizado_cidade_mes_dict[mes] = previsto
                realizado_cidade_dict[x.nome] = realizado_cidade_mes_dict
                
                somameses = somameses + previsto

                # print('----'*30)
                # print(x.nome)
                # print(f'REALIZADO_TOTAL_ANO_TODOS : {realizado_total_ano}')
                # print(f'REALIZADO_CIDADE_ANO : {realizado_cidade_ano}')
                # print(f'PARTICIPACAO DA CIDADE NO ANO : {participacao_cidade}')
                # print(f'PREVISTO PARA O ANO : {valor_cidade}')
                # print(f'SOMA PREVISTO PARA O ANO : {somameses}')
                # print(f'PREVISTO PARA O MES : {previsto}')
                # print('----'*30)
            realizado_cidade_mes_dict['soma_previsto_anual'] = somameses
            realizado_cidade_mes_dict['previsto_anual'] = valor_cidade
            realizado_cidade_mes_dict = {}
        return realizado_cidade_dict            

    def vendedor(regiao,valor):
        obj_vendedor = Perfil.objects.filter(regiao = regiao).exclude(cargo__in = ['ADMIN', 'SUPERVISOR', 'GERENTE'])
        realizado_vendedor_dict = dict()
        realizado_vendedor_mes_dict = dict()
        total_dict = dict()

        list_cpf = []
        for y in obj_vendedor:
            list_cpf.append(y.cpf)
        query = SazonalidadeVendedor.objects.filter(vendedor_cpf__in = list_cpf).distinct('vendedor_cpf')
        realizado_total_ano = 0
        for x in query:
            realizado_total_ano = realizado_total_ano + x.vl_total_anual

        
        for x in obj_vendedor:
            somameses = 0
            for mes in range(1,13):
                realizado_vendedor_ano = SazonalidadeVendedor.objects.only('vl_total_anual').get(vendedor_cpf = x.cpf, mes = mes).vl_total_anual

                participacao_vendedor = realizado_vendedor_ano / realizado_total_ano
                valor_vendedor = round(valor * participacao_vendedor)

                          
                realizado_vendedor_mes = SazonalidadeVendedor.objects.only('percentual').get(vendedor_cpf = x.cpf, mes = mes).percentual 
                previsto = round((realizado_vendedor_mes / 100) * valor_vendedor)
                somameses = somameses + previsto
                realizado_vendedor_mes_dict[mes] = previsto                         
                realizado_vendedor_dict[x.usuario.first_name] = realizado_vendedor_mes_dict 
            realizado_vendedor_mes_dict['soma_previsto_anual'] = somameses
            realizado_vendedor_mes_dict['previsto_anual'] = valor_vendedor
            realizado_vendedor_mes_dict = {}

        return realizado_vendedor_dict

    def modelo(regiao,valor):
        obj_modelo = MotoPerfil.objects.distinct('nome')
        #obj_modelo = MotoPerfil.objects.filter(nome = 'NXR 160 BROS ESDD')
        realizado_modelo_dict = dict()
        realizado_modelo_mes_dict = dict()
        total_dict = dict()

        query = SazonalidadeModelo.objects.filter(modelo__in = obj_modelo, regiao = regiao).distinct('modelo')
        realizado_total_ano = 0
        for x in query:
            realizado_total_ano = realizado_total_ano + x.vl_total_anual

        soma_total_tudo = 0
        for x in obj_modelo:

            #print(x.nome , 'MODELO')    
            #print(realizado_total_ano)
            somameses = 0
            for mes in range(1,13):
                realizado_regiao_ano = SazonalidadeModelo.objects.only('vl_total_anual').get(regiao = regiao, mes = mes, modelo = x).vl_total_anual

                participacao_modelo = realizado_regiao_ano / realizado_total_ano
                valor_modelo = round(valor * participacao_modelo)
                
                # print("-------------------------")
                # print("modelo", x.nome)
                # print("REALIZADO MODELO NO ANO", realizado_regiao_ano)
                # print("porcentagem do modelo ",participacao_modelo * 100)
                # print("valor a ser vendido em 2020 - 1000 motos ",valor_modelo)
                # print("mes", mes)

                realizado_modelo_mes = SazonalidadeModelo.objects.only('percentual').get(regiao = regiao, mes = mes, modelo = x).percentual 
                previsto = round((realizado_modelo_mes / 100) * valor_modelo)
                #print('VALOR MENSAL', previsto)
                somameses = somameses + previsto
                realizado_modelo_mes_dict[mes] = previsto
                realizado_modelo_dict[x.nome] = realizado_modelo_mes_dict
            soma_total_tudo = soma_total_tudo + somameses
            realizado_modelo_mes_dict['soma_previsto_anual'] = somameses
            realizado_modelo_mes_dict['previsto_anual'] = valor_modelo
            realizado_modelo_mes_dict = {}
        #print(soma_total_tudo)
        return realizado_modelo_dict
    
    cidade = cidade(regiao,valor)
    vendedor = vendedor(regiao,valor)
    modelo = modelo(regiao, valor)


    context = {
        'cidade' : cidade,
        'vendedor' : vendedor,
        'modelo' : modelo,
    }
    return Response(context)
        

@api_view(['GET'])
@permission_classes([AllowAny])
def list_planejado_modeloCidade(request,cidade,modelo):


    obj_cidade = Cidade.objects.get(nome = cidade)
    obj_modelo = MotoPerfil.objects.get(nome = modelo)
    regiao = obj_cidade.regiao

    def porcentagem_cidade_modelo(cidade,modelo,regiao):
        realizado_ano = SazonalidadeModeloCidade.objects.filter(modelo = modelo, regiao = regiao, mes = 1).aggregate(Sum('vl_total_anual'))['vl_total_anual__sum']
        realizado_ano_modelo = SazonalidadeModeloCidade.objects.get(modelo = modelo, cidade = cidade, mes = 1).vl_total_anual

        print('VL_TOTAL_ANUAL -> CIDADE', realizado_ano)
        print('realizado_ano_modelo -> ', realizado_ano_modelo)

        if realizado_ano == 0:
            participacao_cidade = 0
        else:
            participacao_cidade = realizado_ano_modelo / realizado_ano

        return realizado_ano,realizado_ano_modelo,participacao_cidade
    
    def calcula_previsto(cidade,modelo,regiao):
        context = {}
        realizado_ano,realizado_ano_modelo,participacao_cidade = porcentagem_cidade_modelo(obj_cidade,obj_modelo,regiao)

        #calcula quantas motos foram pre-aplicadas para o modelo e região
        try:
            preAplicado = FirstEtapa.objects.get(modelo=modelo, regiao=regiao)
        except FirstEtapa.DoesNotExist:
            return 'error'
        else:
            qtd_modelo_regiao = preAplicado.jan + preAplicado.fev + preAplicado.mar + preAplicado.abr + preAplicado.mai + \
                preAplicado.jun + preAplicado.jul + preAplicado.ago + \
                preAplicado.sete + preAplicado.out + preAplicado.nov + preAplicado.dez

            qtd_total_previsto = preAplicado.previsto
            qtd_total_aplicado = preAplicado.aplicado

            # pega a participacao da cidade multiplica pelo numero de qtd_modelo_regiao para achar o numero de motos q irá vender
            #total_previsto = int(participacao_cidade * qtd_modelo_regiao)
            total_previsto = int(participacao_cidade * qtd_total_previsto)
            total_aplicado = int(participacao_cidade * qtd_total_aplicado)

            # calcula o previsto com base na sazonalidade do modelo pegando o total_previsto
            obj_sazonalidade = SazonalidadeModeloCidade.objects.filter(modelo = modelo, cidade = cidade)
            list_previsto_mensal = []
            list_preaplicado_mensal = []
            soma_previsto = 0
            soma_preaplicado = 0
            for x in obj_sazonalidade:
                list_previsto_mensal.append(round(total_previsto * (x.percentual / 100)))
                list_preaplicado_mensal.append(round(total_aplicado * (x.percentual / 100)))
                soma_previsto = soma_previsto + round(total_previsto * (x.percentual / 100))
                soma_preaplicado = soma_preaplicado + round(total_aplicado * (x.percentual / 100))
            context['previsto'] = list_previsto_mensal
            context['preaplicado'] = list_preaplicado_mensal
            context['total_preaplicado'] = soma_preaplicado
            context['total_previsto'] = soma_previsto
            return context
        
    context = calcula_previsto(obj_cidade,obj_modelo,regiao)
    

    return Response(context)

    
@api_view(['GET'])
@permission_classes([AllowAny])
def list_planejado_modeloVendedor(request,vendedor,modelo):

    # pega usuario pelo nome
    obj_user = User.objects.get(first_name = vendedor)
    obj_vendedor = Perfil.objects.get(usuario = obj_user)
    obj_modelo = MotoPerfil.objects.get(nome = modelo)
    regiao = obj_vendedor.regiao

    # pega toda a equipe da região para calcular o total de realizado no ano
    obj_equipe = Perfil.objects.filter(regiao = regiao)
    list_equipe = []
    for x in obj_equipe:
        list_equipe.append(x.cpf)

    def porcentagem_cidade_modelo(modelo,list_equipe):
        
        try:
            realizado_ano = SazonalidadeModeloVendedor.objects.filter(modelo = modelo, vendedor_cpf__in = list_equipe, mes = 1).aggregate(Sum('vl_total_anual'))['vl_total_anual__sum']
        except SazonalidadeModeloVendedor.DoesNotExist:
            realizado_ano = 0
        try:
            realizado_ano_modelo = SazonalidadeModeloVendedor.objects.get(modelo = modelo, vendedor_cpf = obj_vendedor.cpf , mes = 1).vl_total_anual
        except SazonalidadeModeloVendedor.DoesNotExist:
            realizado_ano_modelo = 0


        if realizado_ano_modelo == 0 or realizado_ano_modelo is None:
            realizado_ano_modelo = 0

        if realizado_ano == 0 or realizado_ano is None:
            participacao_cidade = 0
        else:
            participacao_cidade = realizado_ano_modelo / realizado_ano

        print('VL_TOTAL_ANUAL -> CIDADE', realizado_ano)
        print('realizado_ano_modelo -> ', realizado_ano_modelo)
        print('participação do vendedor na equipe total da regiao-> ', participacao_cidade)
        return realizado_ano,realizado_ano_modelo,participacao_cidade
    
    def calcula_previsto(cidade,modelo,regiao):
        context = {}
        realizado_ano,realizado_ano_modelo,participacao_cidade = porcentagem_cidade_modelo(obj_modelo,list_equipe)

        #calcula quantas motos foram pre-aplicadas para o modelo e região
        try:
            preAplicado = FirstEtapa.objects.get(modelo=modelo, regiao=regiao)
        except FirstEtapa.DoesNotExist:
            print(obj_vendedor.cpf)
            return 'error'
        else:
            qtd_modelo_regiao = preAplicado.jan + preAplicado.fev + preAplicado.mar + preAplicado.abr + preAplicado.mai + \
                preAplicado.jun + preAplicado.jul + preAplicado.ago + \
                preAplicado.sete + preAplicado.out + preAplicado.nov + preAplicado.dez

            qtd_total_previsto = preAplicado.previsto
            qtd_total_aplicado = preAplicado.aplicado

            # pega a participacao da cidade multiplica pelo numero de qtd_modelo_regiao para achar o numero de motos q irá vender
            #total_previsto = int(participacao_cidade * qtd_modelo_regiao)
            total_previsto = int(participacao_cidade * qtd_total_previsto)
            total_aplicado = int(participacao_cidade * qtd_total_aplicado)

            # calcula o previsto com base na sazonalidade do modelo pegando o total_previsto
            obj_sazonalidade = SazonalidadeModeloVendedor.objects.filter(modelo = modelo, vendedor_cpf = obj_vendedor.cpf)
            if not obj_sazonalidade.count():
                list_previsto_mensal = [0,0,0,0,0,0,0,0,0,0,0,0]
                list_preaplicado_mensal = [0,0,0,0,0,0,0,0,0,0,0,0]
                context['previsto'] = list_previsto_mensal
                context['preaplicado'] = list_preaplicado_mensal
                context['total_preaplicado'] = total_aplicado
                context['total_previsto'] = total_previsto
            else:
                list_previsto_mensal = []
                list_preaplicado_mensal = []
                soma_previsto = 0
                soma_preaplicado = 0
                for x in obj_sazonalidade:
                    list_previsto_mensal.append(round(total_previsto * (x.percentual / 100)))
                    list_preaplicado_mensal.append(round(total_aplicado * (x.percentual / 100)))
                    soma_previsto = soma_previsto + round(total_previsto * (x.percentual / 100))
                    soma_preaplicado = soma_preaplicado + round(total_aplicado * (x.percentual / 100))
                context['previsto'] = list_previsto_mensal
                context['preaplicado'] = list_preaplicado_mensal
                context['total_preaplicado'] = soma_preaplicado
                context['total_previsto'] = soma_previsto
            return context
        
    context = calcula_previsto(obj_vendedor,obj_modelo,regiao)
    

    return Response(context)

"""
FUNCÇÕES DE EXEMPLOS ABAIXO
"""


@api_view(['GET'])
@permission_classes([AllowAny])
def list_sazonalidade_modeloCidade(request):
    query = SazonalidadeModeloCidade.objects.filter(modelo = 7, cidade= 16)
    serializer = SazonalidadeModeloCidadeSerializer(query, many=True)
    return Response(serializer.data)

@api_view(['GET'])
@permission_classes([AllowAny])
def list_sazonalidade_modeloVendedor(request):
    query = SazonalidadeModeloVendedor.objects.filter(modelo = 7, vendedor_cpf= '07042686632')
    serializer = SazonalidadeModeloVendedorSerializer(query, many=True)
    return Response(serializer.data)
