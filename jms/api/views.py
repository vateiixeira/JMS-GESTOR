from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from jms.core.models import Moto, Cota, Equipe, Cidade, MetaMotoCidade, MetaCotaCidade, TotalMensalMoto2019, MotoPerfil, SazonalidadeCidade, SazonalidadeVendedor,SazonalidadeRegiao
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


@api_view(['GET'])
def desempenho_vendedor(request,vendedor,regiao,dia,mes,ano):
    ultimo_dia_mes = calendar.monthrange(ano,mes)

    list_cidades = list(Cidade.objects.filter(regiao = regiao))
    
    motos = MotoPerfil.objects.all()  
    ########### CAPTURA DADOS DAS MOTOS    
    contador = 1
    dict_moto = {}

    for x in motos:
        moto = Moto.objects.filter(Vendedor_cpf = vendedor, Veiculo = x.nome, Municipio__in = list_cidades, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Cpf_Vendedor = vendedor, Modelo = x.nome, Municipio__in = list_cidades, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        
        if moto is None or moto < 1:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA AS CIDADES DA REGIAO
        user = request.user
        perfil = Perfil.objects.get(usuario = user)
        
        
        geral_moto = Moto.objects.filter(Vendedor_cpf = vendedor, Municipio__in = list_cidades, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        # PORCENTAGEM DA QUANTIDADE DO MODELO EM RELACAO AO TOTAL DA REGIAO
        if geral_moto is None:
            area_moto = 0
        elif geral_moto > 0:
            area_moto = int((100 * moto)/ geral_moto)
        else:
            area_moto = 0
        

        geral_cota = Cota.objects.filter(Cpf_Vendedor = vendedor, Municipio__in = list_cidades, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        if geral_cota > 0 :
            area_cota = int((100 * cota)/ geral_cota)
        else:
            area_cota = 0

        new_dict = {
            'modelo' : x.nome,
            'avatar' : x.avatar,
            'moto' : moto,
            'cota' : cota,
            'area_moto' : area_moto,
            'area_cota' : area_cota,
        }
        dict_moto[contador] = new_dict
        contador = contador + 1 


    ########### CAPTURA DADOS DA CIDADE 
    cidades = Cidade.objects.filter(regiao = regiao)
    cidade_dict = {}
    contador = 1
    for cidade in cidades:
         
        moto = Moto.objects.filter(Vendedor_cpf = vendedor, Municipio = cidade.nome, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Cpf_Vendedor = vendedor, Municipio = cidade.nome, Data_da_Venda=f'{ano}-{mes}-{dia}').count()

        if moto is None:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA DESEMPENHO DA CIDADE
        obj_desempenho = TotalMensalMoto2019.objects.get(cidade = cidade.nome , mes=mes)
        total_mensal_meta = obj_desempenho.qtd
        

        acumulado_mes = Moto.objects.filter(Municipio = cidade.nome, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        
        if total_mensal_meta == 0 or acumulado_mes is None:
            porcen_desempenho = 0
        else:
            porcen_desempenho = acumulado_mes * 100 / total_mensal_meta

        if porcen_desempenho >= 100:
            desempenho = 'success'
        elif 40 < porcen_desempenho < 99:
            desempenho = 'warning'
        else:
            desempenho = 'error'

        # DESEMPENHO COTA
        acumulado_mes_cota = Cota.objects.filter(Cpf_Vendedor = vendedor,Municipio = cidade.nome, Data_da_Venda__lte=f'{ano}-{mes}-{dia}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
        total_mensal_cota = Cota.objects.filter(Cpf_Vendedor = vendedor, Municipio = cidade.nome, Data_da_Venda__lte=f'2019-{mes}-{ultimo_dia_mes[1]}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()

        if acumulado_mes_cota is None:
            porcen_desempenho_cota = 0
        elif total_mensal_cota == 0:
            porcen_desempenho_cota = 100
            print(cidade.nome.encode('ascii', 'ignore'))
        else:
            porcen_desempenho_cota = acumulado_mes_cota * 100 / total_mensal_cota

        if porcen_desempenho_cota >= 100:
            desempenho_cota = 'success'
        elif 40 < porcen_desempenho_cota < 99:
            desempenho_cota = 'warning'
        else:
            desempenho_cota = 'error'

        #verifica dia do mes e aplica regra de porcentagem
        # if 1 <= dia <=15:
        #     regra dia
        # elif 15 < dia < 24:
        #     regra 40
        # else:


        newdici = {
            'nome' :  cidade.nome,
            'moto' : moto,
            'cota' : cota,
            'desempenho' : desempenho,
            'desempenho_porcen' : "{:.2f}".format(porcen_desempenho),
            'porcen_desempenho_cota' : "{:.2f}".format(porcen_desempenho_cota),
            'desempenho_cota' : desempenho_cota,
        }
        contador = contador + 1 
        cidade_dict[contador] = newdici
        

    context = {
        'moto': dict_moto,
        'cidade': cidade_dict,
        'sucess': 'sucess'
    }


    return Response(context)

@api_view(['GET'])
def desempenho_modelo(request,modelo,regiao,dia,mes,ano):

    ultimo_dia_mes = calendar.monthrange(ano,mes)

    list_cidades = list(Cidade.objects.filter(regiao = regiao))

    equipe = Perfil.objects.filter(regiao = regiao).distinct()

    equipe_dict = {}
    count = 1
    equipe_list = []
    for i in equipe:
        count = count + 1

        #PEGA O CPF DO VENDEDOR PARA PESQUISAR NA TABELA DE MOTOS
        usuario_l = User.objects.get(id = i.usuario.id)
        cpf_obj = Perfil.objects.get(usuario = usuario_l)
        cpf = cpf_obj.cpf
        equipe_list.append(cpf)

        nome_vendedor = i.usuario.username
        nome_vendedor = nome_vendedor.upper()

        moto = Moto.objects.filter(Vendedor_cpf = cpf, Municipio__in= list_cidades , Veiculo = modelo, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Cpf_Vendedor = cpf, Modelo = modelo, Municipio__in = list_cidades, Data_da_Venda=f'{ano}-{mes}-{dia}').count()

        visita = 23        

        if moto is None:
            moto = 0
        if cota is None:
            cota = 0
        
        new_dict = {
            'id' : count,
            'nome' : i.usuario.username,
            'avatar' : i.avatar.url,
            'moto' : moto,
            'cota' : cota,
            'visita' : visita,
            'cpf' : cpf,
        }
        equipe_dict[count] = new_dict

    cidades = Cidade.objects.filter(regiao = regiao)
    cidade_dict = {}
    contador = 1
    for cidade in cidades:
         
        moto = Moto.objects.filter(Veiculo = modelo, Municipio = cidade.nome, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda=f'{ano}-{mes}-{dia}').count()

        if moto is None:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA DESEMPENHO DA CIDADE
        obj_desempenho = TotalMensalMoto2019.objects.get(cidade = cidade.nome , mes=mes)
        total_mensal_meta = obj_desempenho.qtd
        

        acumulado_mes = Moto.objects.filter(Municipio = cidade.nome, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        
        if total_mensal_meta == 0 or acumulado_mes is None:
            porcen_desempenho = 0
        else:
            porcen_desempenho = acumulado_mes * 100 / total_mensal_meta

        if porcen_desempenho >= 100:
            desempenho = 'success'
        elif 40 < porcen_desempenho < 99:
            desempenho = 'warning'
        else:
            desempenho = 'error'

        # DESEMPENHO COTA
        acumulado_mes_cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda__lte=f'{ano}-{mes}-{dia}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
        total_mensal_cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda__lte=f'2019-{mes}-{ultimo_dia_mes[1]}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()

        if acumulado_mes_cota is None:
            porcen_desempenho_cota = 0
        elif total_mensal_cota == 0:
            porcen_desempenho_cota = 100
            print(cidade.nome.encode('ascii', 'ignore'))
        else:
            porcen_desempenho_cota = acumulado_mes_cota * 100 / total_mensal_cota

        if porcen_desempenho_cota >= 100:
            desempenho_cota = 'success'
        elif 40 < porcen_desempenho_cota < 99:
            desempenho_cota = 'warning'
        else:
            desempenho_cota = 'error'

        #verifica dia do mes e aplica regra de porcentagem
        # if 1 <= dia <=15:
        #     regra dia
        # elif 15 < dia < 24:
        #     regra 40
        # else:


        newdici = {
            'nome' :  cidade.nome,
            'moto' : moto,
            'cota' : cota,
            'desempenho' : desempenho,
            'desempenho_porcen' : "{:.2f}".format(porcen_desempenho),
            'porcen_desempenho_cota' : "{:.2f}".format(porcen_desempenho_cota),
            'desempenho_cota' : desempenho_cota,
        }
        contador = contador + 1 
        cidade_dict[contador] = newdici
        

    context = {
        'equipe': equipe_dict,
        'cidade': cidade_dict
    }

    return Response(context)
    
@api_view(['GET'])
def desempenho_geral_cabecalho(request,dia,mes,ano):

    user = request.user
    perfil = Perfil.objects.get(usuario = user)
    
    if perfil.cargo == 'ADMIN':
        cidades = list(Cidade.objects.filter(regiao__in = ['JNB', 'JNR', 'SFC']))
        regiao = ['JNB', 'JNR', 'SFC']
    else:
        cidades = list(Cidade.objects.filter(regiao=perfil.regiao))
        regiao = perfil.regiao

    #moto = Moto.objects.filter(Municipio__in = cidades, Data=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
    cota = Cota.objects.filter(Municipio__in = cidades, Data_da_Venda__lte=f'{ano}-{mes}-{dia}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
    moto = Moto.objects.filter(Empresa__in = regiao, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

    visita = 0

    context = {
        'moto' : moto ,
        'cota' : cota ,
        'visita' : visita ,
    }
    return Response(context)

@api_view(['GET'])
def desempenho_regiao_equipe(request, regiao,id,dia,mes,ano):

    obj_cidades = Cidade.objects.filter(regiao = regiao)
    list_cidades = []
    for i in obj_cidades:
        list_cidades.append(i.nome)


    equipe = Perfil.objects.filter(regiao=regiao)
    
    equipe_dict = {}
    count = 1
    for i in equipe:
        count = count + 1

        nome_vendedor = i.usuario.username
        nome_vendedor = nome_vendedor.upper()

        cpf = i.cpf
        moto = Moto.objects.filter(Vendedor__contains = nome_vendedor, Municipio__in = list_cidades, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Nome_Vendedor__contains = nome_vendedor,Municipio__in = list_cidades, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        visita = 23

        

        if moto is None:
            moto = 0
        if cota is None:
            cota = 0

        # ACRESCENTA URL DEFAULT PARA NAO DA CONFLITO COM USUARIO SEM AVATAR
        if i.avatar is None:
            avatar = 'https://fastly.4sqi.net/img/general/600x600/15RKT9R_ASX1-9rLJ7Pdf9vo0UYrWVA2-igMBuGiDzw.jpg'
        else:
            avatar = i.avatar.url
        
        new_dict = {
            'nome' : i.usuario.first_name[0:15],
            'avatar' : avatar,
            'moto' : moto,
            'cota' : cota,
            'visita' : visita,
            'cpf' : cpf,
        }
        equipe_dict[count] = new_dict

    context = {
        'equipe' : equipe_dict ,
    }
    return Response(context)


@api_view(['GET'])
def desempenhoCidade(request, cidade, dia,mes,ano):
    #mes,ano = get_mes_ano()


    cidade_obj = Cidade.objects.get(nome = cidade)

    # COLOCA VENDEDORES CADASTRADOS DA CIDADE NUMA LISTA
    query_equipe = Equipe.objects.filter(cidade = cidade_obj)
    equipe_list = []
    # ADICIONA O CPF DE DEVOLUÇAO PARA NAO PEGAR NO FOREST
    equipe_list.append(99999999999)
    count = 0    
    vendedor_dict = {}
    for i in query_equipe:
        
        
        #PEGA O CPF DO VENDEDOR PARA PESQUISAR NA TABELA DE MOTOS
        usuario_l = User.objects.get(id = i.user.id)
        cpf_obj = Perfil.objects.get(usuario = usuario_l)
        cpf = cpf_obj.cpf
        equipe_list.append(cpf)


        moto = Moto.objects.filter(Vendedor_cpf = cpf, Municipio = cidade, Data=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Nome_Vendedor = i.user.username, Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        
        if moto is None or moto < 0:
            moto = 0

        visita = 152

        # ACRESCENTA URL DEFAULT PARA NAO DA CONFLITO COM USUARIO SEM AVATAR
        if i.perfil.avatar is None:
            avatar = 'https://fastly.4sqi.net/img/general/600x600/15RKT9R_ASX1-9rLJ7Pdf9vo0UYrWVA2-igMBuGiDzw.jpg'
        else:
            avatar = i.perfil.avatar.url
        
        new_dict_indi = {
            'nome' : i.user.first_name[0:15],
            'avatar' : avatar,
            'moto' : moto,
            'cota' : cota,
            'visita' : visita,
            'cpf': cpf
        }
        vendedor_dict[count] = new_dict_indi
        count = count + 1

    # VENDEDORES QUE NAO FAZEM PARTE DA EQUIPE E FATURARAM MOTO NA CIDADE ESPECIFICA
    query_forest = Moto.objects.filter(Municipio = cidade,Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).exclude(Vendedor_cpf__in = equipe_list).distinct('Vendedor')
    vendedor_forest_dict = {}
    count_forest = 0
    for i in query_forest:
        # INICIALIZA DICIONARIO 
        new_dict_indi = {}
        moto = Moto.objects.filter(Vendedor = i.Vendedor, Municipio = cidade, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        try :
            # PEGA USERNAME PARA BUSCAR NA TABELA COTAS PORQUE O NOME EH DIFERENTE DA TABELA DE MOTOS
            # SE NAO ENCONTRAR QUERY ELE RETORNA SEM CADASTRO
            vendedor = User.objects.get(first_name = i.Vendedor)
            avatar = Perfil.objects.get(usuario = vendedor)
            new_dict_indi['avatar'] = avatar.avatar.url
            cota = Cota.objects.filter(Nome_Vendedor = vendedor.username, Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        except User.DoesNotExist:
            cota = '0'
        # LEMBRAR DE INTEGRAR VISITA COM OUTRO LUGAR POSTERIOR MENTE
        visita = 152
        new_dict_indi['nome'] = i.Vendedor
        new_dict_indi['moto'] = moto
        new_dict_indi['cota'] = cota
        new_dict_indi['visita'] = visita

        vendedor_forest_dict[count_forest] = new_dict_indi
        count_forest = count_forest + 1

    # DESEMPENHO DAS MOTOS NA CIDADE ------------------------------ ##########
    list_moto_obj = MotoPerfil.objects.all()    
    moto_dict = {}
    contador = 1

    for i in list_moto_obj:

        moto = Moto.objects.filter(Veiculo = i.nome, Municipio = cidade, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Modelo= i.nome, Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()

        if moto is None or moto < 0:
            moto = 0

        if cota is None or moto < 0:
            cota = 0

        if moto == 0 and cota == 0:
            continue
        
        obj_avatar = MotoPerfil.objects.get(nome = i.nome)
        avatar = obj_avatar.avatar

        # pega a area moto       
        meta_cidade = Moto.objects.filter(Municipio = cidade, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        if meta_cidade is None:
            area_moto = 0
        elif meta_cidade > 0:            
            area_moto = int((100 * moto) / meta_cidade)
        else:
            area_moto = 0
        

        # PEGA AREA COTA
        meta_cota = Cota.objects.filter(Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        if meta_cota > 0:
            area_cota = int((100*cota) / meta_cota)
        else:
            area_cota = 0

        newdici = {
            'modelo' :  i.nome,
            'moto' : moto,
            'cota' : cota,
            'avatar' : avatar,
            'area_moto' : area_moto,
            'area_cota' : area_cota,
        }
        contador = contador + 1 
        moto_dict[contador] = newdici

        

    context = {
        'equipe' : vendedor_dict,
        'forest' : vendedor_forest_dict,
        'moto' : moto_dict
    }

    return Response(context)

@api_view(['GET'])
def list_motos(request):
    query = MotoPerfil.objects.all()
    serializer = MotoSerializer(query, many=True)


    return Response(serializer.data)


@api_view(['GET'])
def desempenhoMotoRegiao(request,regiao, dia,mes,ano):
    motos = MotoPerfil.objects.all()    


    ultimo_dia_mes = calendar.monthrange(ano,mes)

    user = request.user
    perfil = Perfil.objects.get(usuario = user)
    
    # if perfil.cargo == 'ADMIN':
    #     list_cidade = list(Cidade.objects.filter(regiao__in = ['JNB', 'JNR', 'SFC']))
    # else:
    #     list_cidade = list(Cidade.objects.filter(regiao = regiao))

    #pega cidades da regiao
    list_cidade = list(Cidade.objects.filter(regiao = regiao))


    context = {}
    contador = 1

    for value in motos:
        moto = Moto.objects.filter(Veiculo = value.nome, Municipio__in = list_cidade, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Modelo = value.nome, Municipio__in = list_cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        
        if moto is None or moto < 1:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA AS CIDADES DA REGIAO
        user = request.user
        perfil = Perfil.objects.get(usuario = user)
        
        # if perfil.cargo == 'ADMIN':
        #     cidades = Cidade.objects.filter(regiao__in = ['JNB', 'JNR', 'SFC'])
        # else:
        #     cidades = Cidade.objects.filter(regiao=regiao)
        # list_cidade = []
        # for i in cidades:
        #     list_cidade.append(i.nome)
        # total da regiao com a listagem de cidades
        geral_moto = Moto.objects.filter(Municipio__in = list_cidade, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        # PORCENTAGEM DA QUANTIDADE DO MODELO EM RELACAO AO TOTAL DA REGIAO
        if geral_moto is None:
            area_moto = 0
        elif geral_moto > 0:
            area_moto = int((100 * moto)/ geral_moto)
        else:
            area_moto = 0
        

        geral_cota = Cota.objects.filter(Municipio__in = list_cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        if geral_cota > 0 :
            area_cota = int((100 * cota)/ geral_cota)
        else:
            area_cota = 0

        new_dict = {
            'modelo' : value.nome,
            'avatar' : value.avatar,
            'moto' : moto,
            'cota' : cota,
            'area_moto' : area_moto,
            'area_cota' : area_cota,
        }
        context[contador] = new_dict
        contador = contador + 1

    return Response(context)

@api_view(['GET'])
def list_cidade(request, regiao, dia,mes,ano):
    
    user = request.user
    perfil = Perfil.objects.get(usuario = user)
    

    cidades = Cidade.objects.filter(regiao=regiao)
    
    ultimo_dia_mes = calendar.monthrange(ano, mes)

    cidade_dict = {}
    contador = 1
    for cidade in cidades:
         
        moto = Moto.objects.filter(Municipio = cidade.nome, Data=f'{ano}-{mes}-{dia}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda=f'{ano}-{mes}-{dia}').count()

        if moto is None:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA DESEMPENHO DA CIDADE
        try:
            TotalMensalMoto2019.objects.get(cidade = cidade.nome , mes=mes)
        except TotalMensalMoto2019.DoesNotExist:
            print(f'{cidade.nome} NÃO EXISTE NA TABELA TOTALMENSAL')
        obj_desempenho = TotalMensalMoto2019.objects.get(cidade = cidade.nome , mes=mes)
        total_mensal_meta = obj_desempenho.qtd
        

        acumulado_mes = Moto.objects.filter(Municipio = cidade.nome, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        
        if total_mensal_meta == 0 or acumulado_mes is None:
            porcen_desempenho = 0
        else:
            porcen_desempenho = acumulado_mes * 100 / total_mensal_meta

        if porcen_desempenho >= 100:
            desempenho = 'success'
        elif 40 < porcen_desempenho < 99:
            desempenho = 'warning'
        else:
            desempenho = 'error'

        # DESEMPENHO COTA
        acumulado_mes_cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda__lte=f'{ano}-{mes}-{dia}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
        total_mensal_cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda__lte=f'2019-{mes}-{ultimo_dia_mes[1]}', Data_da_Venda__gte=f'{ano}-{mes}-1').count()

        if acumulado_mes_cota is None:
            porcen_desempenho_cota = 0
        elif total_mensal_cota == 0:
            porcen_desempenho_cota = 100            
        else:
            porcen_desempenho_cota = acumulado_mes_cota * 100 / total_mensal_cota

        if porcen_desempenho_cota >= 100:
            desempenho_cota = 'success'
        elif 40 < porcen_desempenho_cota < 99:
            desempenho_cota = 'warning'
        else:
            desempenho_cota = 'error'

        #verifica dia do mes e aplica regra de porcentagem
        # if 1 <= dia <=15:
        #     regra dia
        # elif 15 < dia < 24:
        #     regra 40
        # else:


        newdici = {
            'nome' :  cidade.nome,
            'moto' : moto,
            'cota' : cota,
            'desempenho' : desempenho,
            'desempenho_porcen' : "{:.2f}".format(porcen_desempenho),
            'porcen_desempenho_cota' : "{:.2f}".format(porcen_desempenho_cota),
            'desempenho_cota' : desempenho_cota,
        }
        contador = contador + 1 
        cidade_dict[contador] = newdici

    return Response(cidade_dict)


@api_view(['GET'])
def produto_modelo_regiao(request,modelo,dia,mes,ano,regiao):

    modelos = request.GET.get('modelos')
    #print(modelos)
    # dia = 31
    # ano = 2019
    # mes = 12
    ultimo_dia_mes = calendar.monthrange(ano,mes)

    modelo_obj = MotoPerfil.objects.get(nome = modelo)
    avatar = modelo_obj.avatar

    #pega cidades da regiao
    list_cidade = list(Cidade.objects.filter(regiao = regiao))

    # REALIZADO
    realizado_modelo = Moto.objects.filter(Municipio__in = list_cidade , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    if realizado_modelo is None: 
        return Response({'error', 'Nao existem vendas para este modelo até o dia pesquisado.'})
    
    realizado_total = Moto.objects.filter(Municipio__in = list_cidade , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']

    quantidade_total  = Moto.objects.filter(Municipio__in = list_cidade , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    quantidade_modelo = Moto.objects.filter(Municipio__in = list_cidade , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

    ticket_medio = realizado_modelo / quantidade_modelo

    participacao_realizado = float(realizado_modelo / realizado_total)
    participacao_quantidade = float(quantidade_modelo / quantidade_total)

    # estoque no dia 

    # margem
    margem_total = Moto.objects.filter(Municipio__in = list_cidade , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem = Moto.objects.filter(Municipio__in = list_cidade , Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem_unitario = margem / quantidade_modelo
    participacao_margem = margem / margem_total


    devolucoes_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'CARTEIRA LOJA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    list_devolucao_chassi = [] 
    list_devolucao_vlnota = [] 
    for i in devolucoes_obj:
        #print(i.Chassi)
        vlnota = i.Valor_da_Nota * -1
        list_devolucao_chassi.append(i.Chassi)
        list_devolucao_vlnota.append(vlnota)        
    list_exclude = []
    list_chassi = []
    #formas de pagamento 
    avista_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'RECEBER NA ENTREGA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_avista = avista_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_avista_exclude = []
    if filtro_avista.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_avista:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_avista'.encode('ascii', 'ignore'))

    bv_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BV', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bv = bv_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bv_exclude = []
    if filtro_bv.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_bv:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bv'.encode('ascii', 'ignore'))

        ######################## BRADESCO              
    bradesco_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BRADESCO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco = bradesco_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bradesco_exclude = []
    if filtro_bradesco.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_bradesco:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco'.encode('ascii', 'ignore'))

    ######################## BANCO HONDA  
    banco_honda_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BANCO HONDA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_banco_honda = banco_honda_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_banco_honda_exclude = []
    if filtro_banco_honda.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_banco_honda:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Valor: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_banco_honda'.encode('ascii', 'ignore'))
    
    
    cnh_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'CNH - SEM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh = cnh_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh_exclude = []
    if filtro_cnh.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_cnh:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} //Numero: {i.Nota_Fiscal} // Modalidade: filtro_cnh'.encode('ascii', 'ignore'))
    
    cnh2_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'CNH - COM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh2 = cnh2_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh2_exclude = []
    if filtro_cnh2.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_cnh2:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Nota_Fiscal} /// {i.Chassi} // Numero: {i.Valor_da_Nota} // Modalidade: filtro_cnh2'.encode('ascii', 'ignore'))
    
    bndes_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BANCO BNDES', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bndes = bndes_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bndes_exclude = []
    if filtro_bndes.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_bndes:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bndes'.encode('ascii', 'ignore'))
    
    ############# BANCO DO BRASIL 
    brasil_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BANCO DO BRASIL', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_brasil = brasil_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_brasil_exclude = []
    if filtro_brasil.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_brasil:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_brasil'.encode('ascii', 'ignore'))

    cartao_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'CARTaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cartao = cartao_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cartao_exclude = []
    if filtro_cartao.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_cartao:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cartao'.encode('ascii', 'ignore'))

    troca_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'MOTO USADA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_troca = troca_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_troca.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_troca:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_troca'.encode('ascii', 'ignore'))

    cdcp_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica__in = ['James CDCP Sem alienaçao', 'JAMES CDCP'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cdcp = cdcp_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_cdcp.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_cdcp:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cdcp'.encode('ascii', 'ignore'))

    ######################### PONTA CONSORCIO
    ponta_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica__in = ['PONTA CONSÓRCIOS'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_ponta = ponta_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_ponta_exclude = []
    if filtro_ponta.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_ponta:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_ponta'.encode('ascii', 'ignore'))

    ######################### BRADESCO CONSORCIOS
    bradesco_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BRADESCO CONSÓRCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco_cons = bradesco_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_bradesco_cons_exclude = []
    if filtro_bradesco_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_bradesco_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco_cons'.encode('ascii', 'ignore'))
    ######################### BR CONSORCIOS
    br_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'BR CONSORCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_br_cons = br_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_br_cons_exclude = []
    if filtro_br_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_br_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_br_cons'.encode('ascii', 'ignore'))

    ######################### SICOOB CREDIVAG
    sicoob_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'SICOOB CREDIVAG', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_sicoob_cons = sicoob_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_sicoob_cons_exclude = []
    if filtro_sicoob_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_sicoob_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_sicoob_cons'.encode('ascii', 'ignore'))
    ######################### CONSORCIO ZEMA
    zema_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'CONSORCIO ZEMA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_zema_cons = zema_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_zema_cons_exclude = []
    if filtro_zema_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_zema_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_zema_cons'.encode('ascii', 'ignore'))
    ######################### RODOBENS
    rodobens_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'RODOBENS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_rodobens_cons = rodobens_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_rodobens_cons_exclude = []
    if filtro_rodobens_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_rodobens_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_rodobens_cons'.encode('ascii', 'ignore'))
    ######################### YAMAHA ADMINISTRADORA
    yamaha_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'YAMAHA ADMINISTRADORA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_yamaha_cons = yamaha_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_yamaha_cons_exclude = []
    if filtro_yamaha_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_yamaha_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_yamaha_cons'.encode('ascii', 'ignore'))
    ######################### SANTANDER
    santander_cons_obj = Moto.objects.filter(Municipio__in = list_cidade , Sub_Forma_Fabrica = 'SANTANDER', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_santander_cons = santander_cons_obj.filter(Municipio__in = list_cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_santander_cons_exclude = []
    if filtro_santander_cons.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_santander_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_santander_cons'.encode('ascii', 'ignore'))

    capresentacao = 'indefinido'
    ###################### CDC
    bradesco_obj = bradesco_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco = bradesco_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bradesco_qtd = bradesco_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bndes_obj = bndes_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bndes = bndes_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bndes_qtd = bndes_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bv_obj = bv_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bv = bv_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bv_qtd = bv_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    banco_honda_obj = banco_honda_obj.exclude(Nota_Fiscal__in = list_exclude)  
    banco_honda = banco_honda_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    banco_honda_qtd = banco_honda_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    brasil_obj = brasil_obj.exclude(Nota_Fiscal__in = list_exclude)  
    brasil = brasil_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    brasil_qtd = brasil_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    ################ OUTROS 
    cnh_obj = cnh_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cnh = cnh_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh_qtd = cnh_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cnh2_obj = cnh2_obj.exclude(Nota_Fiscal__in = list_exclude)
    cnh2 = cnh2_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh2_qtd = cnh2_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cartao_obj = cartao_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cartao = cartao_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cartao_qtd = cartao_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    avista_obj = avista_obj.exclude(Nota_Fiscal__in = list_exclude)    
    avista = avista_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    avista_qtd = avista_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    troca_obj = troca_obj.exclude(Nota_Fiscal__in = list_exclude)  
    troca = troca_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    troca_qtd = troca_obj.aggregate(Sum('Margem'))['Margem__sum']
    cdcp_obj = cdcp_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cdcp = cdcp_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    cdcp_qtd = cdcp_obj.aggregate(Sum('Margem'))['Margem__sum']
    ################### CONSORCIOS 
    ponta_obj = ponta_obj.exclude(Nota_Fiscal__in = list_exclude)  
    ponta = ponta_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    ponta_qtd = ponta_obj.aggregate(Sum('Margem'))['Margem__sum']
    br_cons_obj = br_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    br_cons = br_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    br_cons_qtd = br_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    bradesco_cons_obj = bradesco_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco_cons = bradesco_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    bradesco_cons_qtd = bradesco_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    sicoob_cons_obj = sicoob_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    sicoob_cons = sicoob_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    sicoob_cons_qtd = sicoob_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    zema_cons_obj = zema_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    zema_cons = zema_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    zema_cons_qtd = zema_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    rodobens_cons_obj = rodobens_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    rodobens_cons = rodobens_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    rodobens_cons_qtd = rodobens_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    yamaha_cons_obj = yamaha_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    yamaha_cons = yamaha_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    yamaha_cons_qtd = yamaha_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    santander_cons_obj = santander_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    santander_cons = santander_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    santander_cons_qtd = santander_cons_obj.aggregate(Sum('Margem'))['Margem__sum']

    #def check_vl_forma_isNone():
    if avista is None:
        avista = 0
    if cnh2 is None:
        cnh2 = 0
    if cnh is None:
        cnh = 0
    if cartao is None:
        cartao = 0
    if troca is None:
        troca = 0
    if cdcp is None:
        cdcp = 0
    if bradesco is None:
        bradesco = 0
    if bndes is None:
        bndes = 0
    if bv is None:
        bv = 0
    if banco_honda is None:
        banco_honda = 0
    if brasil is None:
        brasil = 0
    if ponta is None:
        ponta = 0
    if br_cons is None:
        br_cons = 0
    if bradesco_cons is None:
        bradesco_cons = 0
    if sicoob_cons is None:
        sicoob_cons = 0
    if zema_cons is None:
        zema_cons = 0
    if rodobens_cons is None:
        rodobens_cons = 0
    if yamaha_cons is None:
        yamaha_cons = 0
    if santander_cons is None:
        santander_cons = 0



    #def check_qtd_formas_isNone():
    if avista_qtd is None:
        avista_qtd = 0
    if cnh2_qtd is None:
        cnh2_qtd = 0
    if cnh_qtd is None:
        cnh_qtd = 0
    if cartao_qtd is None:
        cartao_qtd = 0
    if troca_qtd is None:
        troca_qtd = 0
    if cdcp_qtd is None:
        cdcp_qtd = 0
    if bradesco_qtd is None:
        bradesco_qtd = 0
    if bndes_qtd is None:
        bndes_qtd = 0
    if bv_qtd is None:
        bv_qtd = 0
    if banco_honda_qtd is None:
        banco_honda_qtd = 0
    if brasil_qtd is None:
        brasil_qtd = 0
    if ponta_qtd is None:
        ponta_qtd = 0
    if br_cons_qtd is None:
        br_cons_qtd = 0
    if bradesco_cons_qtd is None:
        bradesco_cons_qtd = 0
    if sicoob_cons_qtd is None:
        sicoob_cons_qtd = 0
    if zema_cons_qtd is None:
        zema_cons_qtd = 0
    if rodobens_cons_qtd is None:
        rodobens_cons_qtd = 0
    if yamaha_cons_qtd is None:
        yamaha_cons_qtd = 0
    if santander_cons_qtd is None:
        santander_cons_qtd = 0



    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    dict_cdc = {
        'BNDES' : locale.currency(bndes, grouping=True, symbol=None),
        'BV' : locale.currency(bv, grouping=True, symbol=None),
        'BRADESCO' : locale.currency(bradesco, grouping=True, symbol=None),
        'BANCO HONDA' : locale.currency(banco_honda, grouping=True, symbol=None),
        'BANCO DO BRASIL' : locale.currency(brasil, grouping=True, symbol=None),
    }

    dict_cons = {
        'PONTA CONS' : locale.currency(ponta, grouping=True, symbol=None),
        'BRADESCO CONS' : locale.currency(bradesco_cons, grouping=True, symbol=None),
        'BR' : locale.currency(br_cons, grouping=True, symbol=None),
        'SICOOB' : locale.currency(sicoob_cons, grouping=True, symbol=None),
        'ZEMA' : locale.currency(zema_cons, grouping=True, symbol=None),
        'YAMAHA' : locale.currency(yamaha_cons, grouping=True, symbol=None),
        'SANTANDER' : locale.currency(santander_cons, grouping=True, symbol=None),
    }

    total_cons = ponta + bradesco_cons + bradesco_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons
    total_cons_qtd = ponta_qtd + bradesco_cons_qtd + bradesco_cons_qtd + sicoob_cons_qtd + zema_cons_qtd + yamaha_cons_qtd + santander_cons_qtd

    total_cdc = bndes + bv + bradesco + banco_honda + brasil
    total_cdc_qtd = bndes_qtd + bv_qtd + bradesco_qtd + banco_honda_qtd + brasil_qtd

    total_cnh_qtd = cnh2_qtd + cnh_qtd
    total_cnh = cnh + cnh2

    total_formas_pagamento = avista + cnh + cnh2 + cartao + troca + bndes + bv + bradesco + banco_honda + brasil + ponta + bradesco_cons + br_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons

    if total_cdc_qtd == 0:
        porcen_cdc_lucratividade = 0
    else:        
        porcen_cdc_lucratividade = total_cdc_qtd / total_cdc 
    if total_cons_qtd == 0:
        porcen_cons_lucratividade = 0
    else:
        porcen_cons_lucratividade= total_cons_qtd / total_cons
    if avista_qtd == 0:
        porcen_avista_lucratividade = 0
    else:
        porcen_avista_lucratividade= avista_qtd / avista
    if total_cnh_qtd == 0 :
        porcen_cnh_lucratividade = 0
    else:
        porcen_cnh_lucratividade = total_cnh_qtd / total_cnh
    if cartao_qtd == 0:
        porcen_cartao_lucratividade = 0
    else:
       porcen_cartao_lucratividade = cartao_qtd / cartao
    if cdcp_qtd == 0:
        porcen_cdcp_lucratividade = 0
    else:
        porcen_cdcp_lucratividade= cdcp_qtd / cdcp
    if bndes_qtd == 0:
        porcen_bndes_lucratividade = 0
    else:
        porcen_bndes_lucratividade= bndes_qtd / bndes
    if bv_qtd == 0:
        porcen_bv_lucratividade = 0
    else:
        porcen_bv_lucratividade = bv_qtd / bv
    if bradesco_qtd == 0:
        porcen_bradesco_lucratividade = 0
    else:
        porcen_bradesco_lucratividade=bradesco_qtd / bradesco
    if banco_honda_qtd == 0:
        porcen_banco_honda_lucratividade = 0
    else:
        porcen_banco_honda_lucratividade= banco_honda_qtd / banco_honda
    if brasil_qtd == 0:
        porcen_brasil_lucratividade = 0
    else:
        porcen_brasil_lucratividade= brasil_qtd / brasil
    if ponta_qtd == 0:
        porcen_ponta_lucratividade = 0
    else:
        porcen_ponta_lucratividade= ponta_qtd / ponta
    if bradesco_cons_qtd == 0:
        porcen_bradesco_cons_lucratividade = 0
    else:
        porcen_bradesco_cons_lucratividade = bradesco_cons_qtd / bradesco_cons
    if br_cons_qtd == 0 : 
        porcen_br_cons_lucratividade = 0
    else:
        porcen_br_cons_lucratividade = br_cons_qtd / br_cons
    if sicoob_cons_qtd == 0:
        porcen_sicoob_cons_lucratividade = 0
    else:
        porcen_sicoob_cons_lucratividade   = sicoob_cons_qtd / sicoob_cons
    if zema_cons_qtd == 0:
        porcen_zema_cons_lucratividade = 0
    else:
        porcen_zema_cons_lucratividade     = zema_cons_qtd / zema_cons
    if yamaha_cons_qtd == 0:
        porcen_yamaha_cons_lucratividade = 0
    else:
        porcen_yamaha_cons_lucratividade   = yamaha_cons_qtd / yamaha_cons
    if santander_cons_qtd == 0 :
        porcen_santander_cons_lucratividade = 0
    else:
        porcen_santander_cons_lucratividade = santander_cons_qtd / santander_cons

    # percenturais das formas de pagamento
    porcen_cdc           = total_cdc / realizado_modelo
    porcen_cons          = total_cons / realizado_modelo
    porcen_avista        = avista / realizado_modelo    
    porcen_cnh           = (cnh / realizado_modelo) + (cnh2 / realizado_modelo)
    porcen_cartao        = cartao / realizado_modelo
    porcen_cdcp          = cdcp / realizado_modelo
    porcen_bndes         = bndes / realizado_modelo
    porcen_bv            = bv / realizado_modelo
    porcen_bradesco      = bradesco / realizado_modelo
    porcen_banco_honda   = banco_honda / realizado_modelo
    porcen_brasil        = brasil / realizado_modelo
    porcen_ponta         = ponta / realizado_modelo
    porcen_bradesco_cons = bradesco_cons / realizado_modelo
    porcen_br_cons       = br_cons / realizado_modelo
    porcen_sicoob_cons   = sicoob_cons / realizado_modelo
    porcen_zema_cons     = zema_cons / realizado_modelo
    porcen_yamaha_cons   = yamaha_cons / realizado_modelo
    porcen_santander_cons = santander_cons / realizado_modelo

    # caapresentaçao será 0 até arrumar no sistema da vision
    #porcen_capresentacao = capresentacao / realizado_modelo
    porcen_capresentacao = 0

    lucratividade_dict = {
        'porcen_cdc_lucratividade' :"{:.2f}".format(porcen_cdc_lucratividade*100),
        'porcen_cons_lucratividade' :"{:.2f}".format(porcen_cons_lucratividade*100),
        'porcen_avista_lucratividade' :"{:.2f}".format(porcen_avista_lucratividade*100),
        'porcen_cnh_lucratividade' :"{:.2f}".format(porcen_cnh_lucratividade*100),
        'porcen_cartao_lucratividade' :"{:.2f}".format(porcen_cartao_lucratividade*100),
        'porcen_cdcp_lucratividade' :"{:.2f}".format(porcen_cdcp_lucratividade*100),
        'porcen_bndes_lucratividade' :"{:.2f}".format(porcen_bndes_lucratividade*100),
        'porcen_bv_lucratividade' :"{:.2f}".format(porcen_bv_lucratividade*100),
        'porcen_bradesco_lucratividade' :"{:.2f}".format(porcen_bradesco_lucratividade*100),
        'porcen_banco_honda_lucratividade' :"{:.2f}".format(porcen_banco_honda_lucratividade*100),
        'porcen_brasil_lucratividade' :"{:.2f}".format(porcen_brasil_lucratividade*100),
        'porcen_ponta_lucratividade' :"{:.2f}".format(porcen_ponta_lucratividade*100),
        'porcen_bradesco_cons_lucratividade' :"{:.2f}".format(porcen_bradesco_cons_lucratividade*100),
        'porcen_br_cons_lucratividade' :"{:.2f}".format(porcen_br_cons_lucratividade*100),
        'porcen_sicoob_cons_lucratividade' :"{:.2f}".format(porcen_sicoob_cons_lucratividade*100),
        'porcen_zema_cons_lucratividade' :"{:.2f}".format(porcen_zema_cons_lucratividade*100),
        'porcen_yamaha_cons_lucratividade' :"{:.2f}".format(porcen_yamaha_cons_lucratividade*100),
        'porcen_santander_cons_lucratividade' :"{:.2f}".format(porcen_santander_cons_lucratividade*100),
    }    

    context = {
        'regiao': regiao,
        'modelo': modelo,
        'avatar': avatar,
        'lucratividade_formas_pgto' : lucratividade_dict,
        'realizado_modelo': locale.currency(realizado_modelo, grouping=True, symbol=None),
        'realizado_total': locale.currency(realizado_total, grouping=True, symbol=None),
        'quantidade_total': quantidade_total,
        'quantidade_modelo': quantidade_modelo,
        'ticket_medio': locale.currency(ticket_medio, grouping=True, symbol=None),
        'participacao_realizado': "{:.2f}".format(participacao_realizado*100),
        'participacao_quantidade': "{:.2f}".format(participacao_quantidade*100),
        'margem': locale.currency(realizado_total, grouping=True, symbol=None),
        'margem_total_modelos': locale.currency(margem_total, grouping=True, symbol=None),
        'margem_unitario': locale.currency(margem_unitario, grouping=True, symbol=None),
        'participacao_margem': "{:.2f}".format(participacao_margem*100),
        'avista': locale.currency(avista, grouping=True, symbol=None),
        'total_formas_pagamento': locale.currency(total_formas_pagamento, grouping=True, symbol=None),
        'cdc_obj': dict_cdc,
        'cons_obj': dict_cons,
        'cdc': locale.currency(total_cdc, grouping=True, symbol=None),
        'cons': locale.currency(total_cons, grouping=True, symbol=None),
        'cnh': locale.currency(cnh + cnh2, grouping=True, symbol=None),        
        'cartao': locale.currency(cartao, grouping=True, symbol=None),
        'troca': locale.currency(troca, grouping=True, symbol=None),
        'cdcp': locale.currency(cdcp, grouping=True, symbol=None),
        'capresentacao': capresentacao,
        'porcen_cdc'           :  "{:.2f}".format(porcen_cdc*100),
        'porcen_cons'          :  "{:.2f}".format(porcen_cons*100),
        'porcen_avista'        :  "{:.2f}".format(porcen_avista*100),
        'porcen_cnh'           :  "{:.2f}".format(porcen_cnh*100),
        'porcen_bndes'         :  "{:.2f}".format(porcen_bndes*100),
        'porcen_cartao'        :  "{:.2f}".format(porcen_cartao*100),
        'porcen_cdcp'          :  "{:.2f}".format(porcen_cdcp*100),
        'porcen_capresentacao' :  "{:.2f}".format(porcen_capresentacao*100),
        'porcen_bndes'         : "{:.2f}".format(porcen_bndes*100),
        'porcen_bv'            : "{:.2f}".format(porcen_bv*100),
        'porcen_bradesco'      : "{:.2f}".format(porcen_bradesco*100),
        'porcen_banco_honda'   : "{:.2f}".format(porcen_banco_honda*100),
        'porcen_brasil'        : "{:.2f}".format(porcen_brasil*100),
        'porcen_ponta'         : "{:.2f}".format(porcen_ponta*100),
        'porcen_bradesco_cons' : "{:.2f}".format(porcen_bradesco_cons*100),
        'porcen_br_cons'       : "{:.2f}".format(porcen_br_cons*100),
        'porcen_sicoob_cons'   : "{:.2f}".format(porcen_sicoob_cons*100),
        'porcen_zema_con'      : "{:.2f}".format(porcen_zema_cons*100),
        'porcen_yamaha_cons'   : "{:.2f}".format(porcen_yamaha_cons*100),
        'porcen_santander_cons' : "{:.2f}".format(porcen_santander_cons*100),
        
    }

    return Response(context)

@api_view(['GET'])
def produto_modelo_cidade(request,modelo,dia,mes,ano,cidade):
    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    ultimo_dia_mes = calendar.monthrange(ano,mes)

    modelo_obj = MotoPerfil.objects.get(nome = modelo)
    avatar = modelo_obj.avatar

    # REALIZADO
    realizado_modelo = Moto.objects.filter(Municipio = cidade , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    if realizado_modelo is None: 
        return Response({'error', 'Nao existem vendas para este modelo até o dia pesquisado.'})
    
    realizado_total = Moto.objects.filter(Municipio = cidade , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']

    quantidade_total  = Moto.objects.filter(Municipio = cidade , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    quantidade_modelo = Moto.objects.filter(Municipio = cidade , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

    ticket_medio = realizado_modelo / quantidade_modelo

    participacao_realizado = float(realizado_modelo / realizado_total)
    participacao_quantidade = float(quantidade_modelo / quantidade_total)

    # estoque no dia 

    # margem
    margem_total = Moto.objects.filter(Municipio = cidade , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem = Moto.objects.filter(Municipio = cidade , Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem_unitario = margem / quantidade_modelo
    participacao_margem = margem / margem_total


    devolucoes_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'CARTEIRA LOJA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    list_devolucao_chassi = [] 
    list_devolucao_vlnota = [] 
    for i in devolucoes_obj:
        print(i.Chassi.encode('ascii', 'ignore'))
        vlnota = i.Valor_da_Nota * -1
        list_devolucao_chassi.append(i.Chassi)
        list_devolucao_vlnota.append(vlnota)        
    list_exclude = []
    list_chassi = []
    #formas de pagamento 
    avista_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'RECEBER NA ENTREGA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_avista = avista_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_avista_exclude = []
    if filtro_avista.count() == 0:
        print('Nao tem notas de cancelamento'.encode('ascii', 'ignore'))
    else:
        for i in filtro_avista:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_avista')

    bv_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BV', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bv = bv_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bv_exclude = []
    if filtro_bv.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bv:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bv')

        ######################## BRADESCO              
    bradesco_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BRADESCO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco = bradesco_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bradesco_exclude = []
    if filtro_bradesco.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco')

    ######################## BANCO HONDA  
    banco_honda_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BANCO HONDA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_banco_honda = banco_honda_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_banco_honda_exclude = []
    if filtro_banco_honda.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_banco_honda:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Valor: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_banco_honda')
    
    
    cnh_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'CNH - SEM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh = cnh_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh_exclude = []
    if filtro_cnh.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} //Numero: {i.Nota_Fiscal} // Modalidade: filtro_cnh')
    
    cnh2_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'CNH - COM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh2 = cnh2_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh2_exclude = []
    if filtro_cnh2.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh2:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Nota_Fiscal} /// {i.Chassi} // Numero: {i.Valor_da_Nota} // Modalidade: filtro_cnh2')
    
    bndes_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BANCO BNDES', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bndes = bndes_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bndes_exclude = []
    if filtro_bndes.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bndes:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bndes')
    
    ############# BANCO DO BRASIL 
    brasil_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BANCO DO BRASIL', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_brasil = brasil_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_brasil_exclude = []
    if filtro_brasil.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_brasil:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_brasil')

    cartao_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'CARTaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cartao = cartao_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cartao_exclude = []
    if filtro_cartao.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cartao:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cartao')

    troca_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'MOTO USADA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_troca = troca_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_troca.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_troca:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_troca')

    cdcp_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica__in = ['James CDCP Sem alienaçao', 'JAMES CDCP'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cdcp = cdcp_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_cdcp.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cdcp:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cdcp')

    ######################### PONTA CONSORCIO
    ponta_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica__in = ['PONTA CONSÓRCIOS'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_ponta = ponta_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_ponta_exclude = []
    if filtro_ponta.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_ponta:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_ponta')

    ######################### BRADESCO CONSORCIOS
    bradesco_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BRADESCO CONSÓRCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco_cons = bradesco_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_bradesco_cons_exclude = []
    if filtro_bradesco_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco_cons')
    ######################### BR CONSORCIOS
    br_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'BR CONSORCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_br_cons = br_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_br_cons_exclude = []
    if filtro_br_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_br_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_br_cons')

    ######################### SICOOB CREDIVAG
    sicoob_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'SICOOB CREDIVAG', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_sicoob_cons = sicoob_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_sicoob_cons_exclude = []
    if filtro_sicoob_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_sicoob_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_sicoob_cons')
    ######################### CONSORCIO ZEMA
    zema_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'CONSORCIO ZEMA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_zema_cons = zema_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_zema_cons_exclude = []
    if filtro_zema_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_zema_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_zema_cons')
    ######################### RODOBENS
    rodobens_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'RODOBENS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_rodobens_cons = rodobens_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_rodobens_cons_exclude = []
    if filtro_rodobens_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_rodobens_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_rodobens_cons')
    ######################### YAMAHA ADMINISTRADORA
    yamaha_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'YAMAHA ADMINISTRADORA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_yamaha_cons = yamaha_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_yamaha_cons_exclude = []
    if filtro_yamaha_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_yamaha_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_yamaha_cons')
    ######################### SANTANDER
    santander_cons_obj = Moto.objects.filter(Municipio = cidade , Sub_Forma_Fabrica = 'SANTANDER', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_santander_cons = santander_cons_obj.filter(Municipio = cidade , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_santander_cons_exclude = []
    if filtro_santander_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_santander_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_santander_cons')

    capresentacao = 'indefinido'
    ###################### CDC
    bradesco_obj = bradesco_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco = bradesco_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bradesco_qtd = bradesco_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bndes_obj = bndes_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bndes = bndes_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bndes_qtd = bndes_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bv_obj = bv_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bv = bv_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bv_qtd = bv_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    banco_honda_obj = banco_honda_obj.exclude(Nota_Fiscal__in = list_exclude)  
    banco_honda = banco_honda_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    banco_honda_qtd = banco_honda_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    brasil_obj = brasil_obj.exclude(Nota_Fiscal__in = list_exclude)  
    brasil = brasil_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    brasil_qtd = brasil_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    ################ OUTROS 
    cnh_obj = cnh_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cnh = cnh_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh_qtd = cnh_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cnh2_obj = cnh2_obj.exclude(Nota_Fiscal__in = list_exclude)
    cnh2 = cnh2_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh2_qtd = cnh2_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cartao_obj = cartao_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cartao = cartao_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cartao_qtd = cartao_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    avista_obj = avista_obj.exclude(Nota_Fiscal__in = list_exclude)    
    avista = avista_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    avista_qtd = avista_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    troca_obj = troca_obj.exclude(Nota_Fiscal__in = list_exclude)  
    troca = troca_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    troca_qtd = troca_obj.aggregate(Sum('Margem'))['Margem__sum']
    cdcp_obj = cdcp_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cdcp = cdcp_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    cdcp_qtd = cdcp_obj.aggregate(Sum('Margem'))['Margem__sum']
    ################### CONSORCIOS 
    ponta_obj = ponta_obj.exclude(Nota_Fiscal__in = list_exclude)  
    ponta = ponta_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    ponta_qtd = ponta_obj.aggregate(Sum('Margem'))['Margem__sum']
    br_cons_obj = br_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    br_cons = br_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    br_cons_qtd = br_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    bradesco_cons_obj = bradesco_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco_cons = bradesco_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    bradesco_cons_qtd = bradesco_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    sicoob_cons_obj = sicoob_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    sicoob_cons = sicoob_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    sicoob_cons_qtd = sicoob_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    zema_cons_obj = zema_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    zema_cons = zema_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    zema_cons_qtd = zema_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    rodobens_cons_obj = rodobens_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    rodobens_cons = rodobens_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    rodobens_cons_qtd = rodobens_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    yamaha_cons_obj = yamaha_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    yamaha_cons = yamaha_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    yamaha_cons_qtd = yamaha_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    santander_cons_obj = santander_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    santander_cons = santander_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    santander_cons_qtd = santander_cons_obj.aggregate(Sum('Margem'))['Margem__sum']

    #def check_vl_forma_isNone():
    if avista is None:
        avista = 0
    if cnh2 is None:
        cnh2 = 0
    if cnh is None:
        cnh = 0
    if cartao is None:
        cartao = 0
    if troca is None:
        troca = 0
    if cdcp is None:
        cdcp = 0
    if bradesco is None:
        bradesco = 0
    if bndes is None:
        bndes = 0
    if bv is None:
        bv = 0
    if banco_honda is None:
        banco_honda = 0
    if brasil is None:
        brasil = 0
    if ponta is None:
        ponta = 0
    if br_cons is None:
        br_cons = 0
    if bradesco_cons is None:
        bradesco_cons = 0
    if sicoob_cons is None:
        sicoob_cons = 0
    if zema_cons is None:
        zema_cons = 0
    if rodobens_cons is None:
        rodobens_cons = 0
    if yamaha_cons is None:
        yamaha_cons = 0
    if santander_cons is None:
        santander_cons = 0



    #def check_qtd_formas_isNone():
    if avista_qtd is None:
        avista_qtd = 0
    if cnh2_qtd is None:
        cnh2_qtd = 0
    if cnh_qtd is None:
        cnh_qtd = 0
    if cartao_qtd is None:
        cartao_qtd = 0
    if troca_qtd is None:
        troca_qtd = 0
    if cdcp_qtd is None:
        cdcp_qtd = 0
    if bradesco_qtd is None:
        bradesco_qtd = 0
    if bndes_qtd is None:
        bndes_qtd = 0
    if bv_qtd is None:
        bv_qtd = 0
    if banco_honda_qtd is None:
        banco_honda_qtd = 0
    if brasil_qtd is None:
        brasil_qtd = 0
    if ponta_qtd is None:
        ponta_qtd = 0
    if br_cons_qtd is None:
        br_cons_qtd = 0
    if bradesco_cons_qtd is None:
        bradesco_cons_qtd = 0
    if sicoob_cons_qtd is None:
        sicoob_cons_qtd = 0
    if zema_cons_qtd is None:
        zema_cons_qtd = 0
    if rodobens_cons_qtd is None:
        rodobens_cons_qtd = 0
    if yamaha_cons_qtd is None:
        yamaha_cons_qtd = 0
    if santander_cons_qtd is None:
        santander_cons_qtd = 0



    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    dict_cdc = {
        'BNDES' : locale.currency(bndes, grouping=True, symbol=None),
        'BV' : locale.currency(bv, grouping=True, symbol=None),
        'BRADESCO' : locale.currency(bradesco, grouping=True, symbol=None),
        'BANCO HONDA' : locale.currency(banco_honda, grouping=True, symbol=None),
        'BANCO DO BRASIL' : locale.currency(brasil, grouping=True, symbol=None),
    }

    dict_cons = {
        'PONTA CONS' : locale.currency(ponta, grouping=True, symbol=None),
        'BRADESCO CONS' : locale.currency(bradesco_cons, grouping=True, symbol=None),
        'BR' : locale.currency(br_cons, grouping=True, symbol=None),
        'SICOOB' : locale.currency(sicoob_cons, grouping=True, symbol=None),
        'ZEMA' : locale.currency(zema_cons, grouping=True, symbol=None),
        'YAMAHA' : locale.currency(yamaha_cons, grouping=True, symbol=None),
        'SANTANDER' : locale.currency(santander_cons, grouping=True, symbol=None),
    }

    total_cons = ponta + bradesco_cons + bradesco_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons
    total_cons_qtd = ponta_qtd + bradesco_cons_qtd + bradesco_cons_qtd + sicoob_cons_qtd + zema_cons_qtd + yamaha_cons_qtd + santander_cons_qtd

    total_cdc = bndes + bv + bradesco + banco_honda + brasil
    total_cdc_qtd = bndes_qtd + bv_qtd + bradesco_qtd + banco_honda_qtd + brasil_qtd

    total_cnh_qtd = cnh2_qtd + cnh_qtd
    total_cnh = cnh + cnh2

    total_formas_pagamento = avista + cnh + cnh2 + cartao + troca + bndes + bv + bradesco + banco_honda + brasil + ponta + bradesco_cons + br_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons

    if total_cdc_qtd == 0:
        porcen_cdc_lucratividade = 0
    else:        
        porcen_cdc_lucratividade = total_cdc_qtd / total_cdc 
    if total_cons_qtd == 0:
        porcen_cons_lucratividade = 0
    else:
        porcen_cons_lucratividade= total_cons_qtd / total_cons
    if avista_qtd == 0:
        porcen_avista_lucratividade = 0
    else:
        porcen_avista_lucratividade= avista_qtd / avista
    if total_cnh_qtd == 0 :
        porcen_cnh_lucratividade = 0
    else:
        porcen_cnh_lucratividade = total_cnh_qtd / total_cnh
    if cartao_qtd == 0:
        porcen_cartao_lucratividade = 0
    else:
       porcen_cartao_lucratividade = cartao_qtd / cartao
    if cdcp_qtd == 0:
        porcen_cdcp_lucratividade = 0
    else:
        porcen_cdcp_lucratividade= cdcp_qtd / cdcp
    if bndes_qtd == 0:
        porcen_bndes_lucratividade = 0
    else:
        porcen_bndes_lucratividade= bndes_qtd / bndes
    if bv_qtd == 0:
        porcen_bv_lucratividade = 0
    else:
        porcen_bv_lucratividade = bv_qtd / bv
    if bradesco_qtd == 0:
        porcen_bradesco_lucratividade = 0
    else:
        porcen_bradesco_lucratividade=bradesco_qtd / bradesco
    if banco_honda_qtd == 0:
        porcen_banco_honda_lucratividade = 0
    else:
        porcen_banco_honda_lucratividade= banco_honda_qtd / banco_honda
    if brasil_qtd == 0:
        porcen_brasil_lucratividade = 0
    else:
        porcen_brasil_lucratividade= brasil_qtd / brasil
    if ponta_qtd == 0:
        porcen_ponta_lucratividade = 0
    else:
        porcen_ponta_lucratividade= ponta_qtd / ponta
    if bradesco_cons_qtd == 0:
        porcen_bradesco_cons_lucratividade = 0
    else:
        porcen_bradesco_cons_lucratividade = bradesco_cons_qtd / bradesco_cons
    if br_cons_qtd == 0 : 
        porcen_br_cons_lucratividade = 0
    else:
        porcen_br_cons_lucratividade = br_cons_qtd / br_cons
    if sicoob_cons_qtd == 0:
        porcen_sicoob_cons_lucratividade = 0
    else:
        porcen_sicoob_cons_lucratividade   = sicoob_cons_qtd / sicoob_cons
    if zema_cons_qtd == 0:
        porcen_zema_cons_lucratividade = 0
    else:
        porcen_zema_cons_lucratividade     = zema_cons_qtd / zema_cons
    if yamaha_cons_qtd == 0:
        porcen_yamaha_cons_lucratividade = 0
    else:
        porcen_yamaha_cons_lucratividade   = yamaha_cons_qtd / yamaha_cons
    if santander_cons_qtd == 0 :
        porcen_santander_cons_lucratividade = 0
    else:
        porcen_santander_cons_lucratividade = santander_cons_qtd / santander_cons

    # percenturais das formas de pagamento
    porcen_cdc           = total_cdc / realizado_modelo
    porcen_cons          = total_cons / realizado_modelo
    porcen_avista        = avista / realizado_modelo    
    porcen_cnh           = (cnh / realizado_modelo) + (cnh2 / realizado_modelo)
    porcen_cartao        = cartao / realizado_modelo
    porcen_cdcp          = cdcp / realizado_modelo
    porcen_bndes         = bndes / realizado_modelo
    porcen_bv            = bv / realizado_modelo
    porcen_bradesco      = bradesco / realizado_modelo
    porcen_banco_honda   = banco_honda / realizado_modelo
    porcen_brasil        = brasil / realizado_modelo
    porcen_ponta         = ponta / realizado_modelo
    porcen_bradesco_cons = bradesco_cons / realizado_modelo
    porcen_br_cons       = br_cons / realizado_modelo
    porcen_sicoob_cons   = sicoob_cons / realizado_modelo
    porcen_zema_cons     = zema_cons / realizado_modelo
    porcen_yamaha_cons   = yamaha_cons / realizado_modelo
    porcen_santander_cons = santander_cons / realizado_modelo

    # caapresentaçao será 0 até arrumar no sistema da vision
    #porcen_capresentacao = capresentacao / realizado_modelo
    porcen_capresentacao = 0

    lucratividade_dict = {
        'porcen_cdc_lucratividade' :"{:.2f}".format(porcen_cdc_lucratividade*100),
        'porcen_cons_lucratividade' :"{:.2f}".format(porcen_cons_lucratividade*100),
        'porcen_avista_lucratividade' :"{:.2f}".format(porcen_avista_lucratividade*100),
        'porcen_cnh_lucratividade' :"{:.2f}".format(porcen_cnh_lucratividade*100),
        'porcen_cartao_lucratividade' :"{:.2f}".format(porcen_cartao_lucratividade*100),
        'porcen_cdcp_lucratividade' :"{:.2f}".format(porcen_cdcp_lucratividade*100),
        'porcen_bndes_lucratividade' :"{:.2f}".format(porcen_bndes_lucratividade*100),
        'porcen_bv_lucratividade' :"{:.2f}".format(porcen_bv_lucratividade*100),
        'porcen_bradesco_lucratividade' :"{:.2f}".format(porcen_bradesco_lucratividade*100),
        'porcen_banco_honda_lucratividade' :"{:.2f}".format(porcen_banco_honda_lucratividade*100),
        'porcen_brasil_lucratividade' :"{:.2f}".format(porcen_brasil_lucratividade*100),
        'porcen_ponta_lucratividade' :"{:.2f}".format(porcen_ponta_lucratividade*100),
        'porcen_bradesco_cons_lucratividade' :"{:.2f}".format(porcen_bradesco_cons_lucratividade*100),
        'porcen_br_cons_lucratividade' :"{:.2f}".format(porcen_br_cons_lucratividade*100),
        'porcen_sicoob_cons_lucratividade' :"{:.2f}".format(porcen_sicoob_cons_lucratividade*100),
        'porcen_zema_cons_lucratividade' :"{:.2f}".format(porcen_zema_cons_lucratividade*100),
        'porcen_yamaha_cons_lucratividade' :"{:.2f}".format(porcen_yamaha_cons_lucratividade*100),
        'porcen_santander_cons_lucratividade' :"{:.2f}".format(porcen_santander_cons_lucratividade*100),
    }    

    context = {
        'regiao': cidade,
        'modelo': modelo,
        'avatar': avatar,
        'lucratividade_formas_pgto' : lucratividade_dict,
        'realizado_modelo': locale.currency(realizado_modelo, grouping=True, symbol=None),
        'realizado_total': locale.currency(realizado_total, grouping=True, symbol=None),
        'quantidade_total': quantidade_total,
        'quantidade_modelo': quantidade_modelo,
        'ticket_medio': locale.currency(ticket_medio, grouping=True, symbol=None),
        'participacao_realizado': "{:.2f}".format(participacao_realizado*100),
        'participacao_quantidade': "{:.2f}".format(participacao_quantidade*100),
        'margem': locale.currency(realizado_total, grouping=True, symbol=None),
        'margem_total_modelos': locale.currency(margem_total, grouping=True, symbol=None),
        'margem_unitario': locale.currency(margem_unitario, grouping=True, symbol=None),
        'participacao_margem': "{:.2f}".format(participacao_margem*100),
        'avista': locale.currency(avista, grouping=True, symbol=None),
        'total_formas_pagamento': locale.currency(total_formas_pagamento, grouping=True, symbol=None),
        'cdc_obj': dict_cdc,
        'cons_obj': dict_cons,
        'cdc': locale.currency(total_cdc, grouping=True, symbol=None),
        'cons': locale.currency(total_cons, grouping=True, symbol=None),
        'cnh': locale.currency(cnh + cnh2, grouping=True, symbol=None),        
        'cartao': locale.currency(cartao, grouping=True, symbol=None),
        'troca': locale.currency(troca, grouping=True, symbol=None),
        'cdcp': locale.currency(cdcp, grouping=True, symbol=None),
        'capresentacao': capresentacao,
        'porcen_cdc'           :  "{:.2f}".format(porcen_cdc*100),
        'porcen_cons'          :  "{:.2f}".format(porcen_cons*100),
        'porcen_avista'        :  "{:.2f}".format(porcen_avista*100),
        'porcen_cnh'           :  "{:.2f}".format(porcen_cnh*100),
        'porcen_bndes'         :  "{:.2f}".format(porcen_bndes*100),
        'porcen_cartao'        :  "{:.2f}".format(porcen_cartao*100),
        'porcen_cdcp'          :  "{:.2f}".format(porcen_cdcp*100),
        'porcen_capresentacao' :  "{:.2f}".format(porcen_capresentacao*100),
        'porcen_bndes'         : "{:.2f}".format(porcen_bndes*100),
        'porcen_bv'            : "{:.2f}".format(porcen_bv*100),
        'porcen_bradesco'      : "{:.2f}".format(porcen_bradesco*100),
        'porcen_banco_honda'   : "{:.2f}".format(porcen_banco_honda*100),
        'porcen_brasil'        : "{:.2f}".format(porcen_brasil*100),
        'porcen_ponta'         : "{:.2f}".format(porcen_ponta*100),
        'porcen_bradesco_cons' : "{:.2f}".format(porcen_bradesco_cons*100),
        'porcen_br_cons'       : "{:.2f}".format(porcen_br_cons*100),
        'porcen_sicoob_cons'   : "{:.2f}".format(porcen_sicoob_cons*100),
        'porcen_zema_con'      : "{:.2f}".format(porcen_zema_cons*100),
        'porcen_yamaha_cons'   : "{:.2f}".format(porcen_yamaha_cons*100),
        'porcen_santander_cons' : "{:.2f}".format(porcen_santander_cons*100),
        
    }

    return Response(context)

@api_view(['GET'])
def produto_modelo_vendedor(request,modelo,dia,mes,ano,vendedor):
    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
    # dia = 31
    # ano = 2019
    # mes = 12
    # modelo = 'NXR 160 BROS ESDD'
    # vendedor = 'JANAÚBA'
    ultimo_dia_mes = calendar.monthrange(ano,mes)

    vendedor_obj = Moto.objects.filter(Vendedor_cpf = vendedor).last()
    vendedor_nome = vendedor_obj.Vendedor
    modelo_obj = MotoPerfil.objects.get(nome = modelo)
    avatar = modelo_obj.avatar

    # REALIZADO
    # REALIZADO
    realizado_modelo = Moto.objects.filter(Vendedor_cpf = vendedor , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    if realizado_modelo is None: 
        return Response({'error', 'Nao existem vendas para este modelo até o dia pesquisado.'})
    
    realizado_total = Moto.objects.filter(Vendedor_cpf = vendedor , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']

    quantidade_total  = Moto.objects.filter(Vendedor_cpf = vendedor , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    quantidade_modelo = Moto.objects.filter(Vendedor_cpf = vendedor , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

    ticket_medio = realizado_modelo / quantidade_modelo

    participacao_realizado = float(realizado_modelo / realizado_total)
    participacao_quantidade = float(quantidade_modelo / quantidade_total)

    # margem
    margem_total = Moto.objects.filter(Vendedor_cpf = vendedor , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem = Moto.objects.filter(Vendedor_cpf = vendedor , Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem_unitario = margem / quantidade_modelo
    participacao_margem = margem / margem_total


    devolucoes_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CARTEIRA LOJA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    list_devolucao_chassi = [] 
    list_devolucao_vlnota = [] 
    for i in devolucoes_obj:
        print(i.Chassi)
        vlnota = i.Valor_da_Nota * -1
        list_devolucao_chassi.append(i.Chassi)
        list_devolucao_vlnota.append(vlnota)        
    list_exclude = []
    list_chassi = []
    #formas de pagamento 
    avista_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'RECEBER NA ENTREGA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_avista = avista_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_avista_exclude = []
    if filtro_avista.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_avista:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_avista')

    bv_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BV', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bv = bv_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bv_exclude = []
    if filtro_bv.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bv:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bv')

        ######################## BRADESCO              
    bradesco_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BRADESCO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco = bradesco_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bradesco_exclude = []
    if filtro_bradesco.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco')

    ######################## BANCO HONDA  
    banco_honda_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BANCO HONDA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_banco_honda = banco_honda_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_banco_honda_exclude = []
    if filtro_banco_honda.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_banco_honda:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Valor: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_banco_honda')
    
    
    cnh_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CNH - SEM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh = cnh_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh_exclude = []
    if filtro_cnh.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} //Numero: {i.Nota_Fiscal} // Modalidade: filtro_cnh')
    
    cnh2_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CNH - COM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh2 = cnh2_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh2_exclude = []
    if filtro_cnh2.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh2:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Nota_Fiscal} /// {i.Chassi} // Numero: {i.Valor_da_Nota} // Modalidade: filtro_cnh2')
    
    bndes_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BANCO BNDES', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bndes = bndes_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bndes_exclude = []
    if filtro_bndes.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bndes:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bndes')
    
    ############# BANCO DO BRASIL 
    brasil_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BANCO DO BRASIL', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_brasil = brasil_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_brasil_exclude = []
    if filtro_brasil.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_brasil:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_brasil')

    cartao_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CARTaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cartao = cartao_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cartao_exclude = []
    if filtro_cartao.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cartao:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cartao')

    troca_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'MOTO USADA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_troca = troca_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_troca.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_troca:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_troca')

    cdcp_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica__in = ['James CDCP Sem alienaçao', 'JAMES CDCP'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cdcp = cdcp_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_cdcp.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cdcp:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cdcp')

    ######################### PONTA CONSORCIO
    ponta_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica__in = ['PONTA CONSÓRCIOS'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_ponta = ponta_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_ponta_exclude = []
    if filtro_ponta.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_ponta:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_ponta')

    ######################### BRADESCO CONSORCIOS
    bradesco_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BRADESCO CONSÓRCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco_cons = bradesco_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_bradesco_cons_exclude = []
    if filtro_bradesco_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco_cons')
    ######################### BR CONSORCIOS
    br_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BR CONSORCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_br_cons = br_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_br_cons_exclude = []
    if filtro_br_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_br_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_br_cons')

    ######################### SICOOB CREDIVAG
    sicoob_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'SICOOB CREDIVAG', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_sicoob_cons = sicoob_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_sicoob_cons_exclude = []
    if filtro_sicoob_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_sicoob_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_sicoob_cons')
    ######################### CONSORCIO ZEMA
    zema_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CONSORCIO ZEMA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_zema_cons = zema_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_zema_cons_exclude = []
    if filtro_zema_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_zema_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_zema_cons')
    ######################### RODOBENS
    rodobens_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'RODOBENS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_rodobens_cons = rodobens_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_rodobens_cons_exclude = []
    if filtro_rodobens_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_rodobens_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_rodobens_cons')
    ######################### YAMAHA ADMINISTRADORA
    yamaha_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'YAMAHA ADMINISTRADORA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_yamaha_cons = yamaha_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_yamaha_cons_exclude = []
    if filtro_yamaha_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_yamaha_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_yamaha_cons')
    ######################### SANTANDER
    santander_cons_obj = Moto.objects.filter(Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'SANTANDER', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_santander_cons = santander_cons_obj.filter(Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_santander_cons_exclude = []
    if filtro_santander_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_santander_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_santander_cons')

    capresentacao = 'indefinido'
    ###################### CDC
    bradesco_obj = bradesco_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco = bradesco_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bradesco_qtd = bradesco_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bndes_obj = bndes_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bndes = bndes_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bndes_qtd = bndes_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bv_obj = bv_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bv = bv_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bv_qtd = bv_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    banco_honda_obj = banco_honda_obj.exclude(Nota_Fiscal__in = list_exclude)  
    banco_honda = banco_honda_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    banco_honda_qtd = banco_honda_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    brasil_obj = brasil_obj.exclude(Nota_Fiscal__in = list_exclude)  
    brasil = brasil_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    brasil_qtd = brasil_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    ################ OUTROS 
    cnh_obj = cnh_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cnh = cnh_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh_qtd = cnh_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cnh2_obj = cnh2_obj.exclude(Nota_Fiscal__in = list_exclude)
    cnh2 = cnh2_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh2_qtd = cnh2_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cartao_obj = cartao_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cartao = cartao_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cartao_qtd = cartao_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    avista_obj = avista_obj.exclude(Nota_Fiscal__in = list_exclude)    
    avista = avista_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    avista_qtd = avista_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    troca_obj = troca_obj.exclude(Nota_Fiscal__in = list_exclude)  
    troca = troca_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    troca_qtd = troca_obj.aggregate(Sum('Margem'))['Margem__sum']
    cdcp_obj = cdcp_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cdcp = cdcp_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    cdcp_qtd = cdcp_obj.aggregate(Sum('Margem'))['Margem__sum']
    ################### CONSORCIOS 
    ponta_obj = ponta_obj.exclude(Nota_Fiscal__in = list_exclude)  
    ponta = ponta_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    ponta_qtd = ponta_obj.aggregate(Sum('Margem'))['Margem__sum']
    br_cons_obj = br_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    br_cons = br_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    br_cons_qtd = br_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    bradesco_cons_obj = bradesco_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco_cons = bradesco_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    bradesco_cons_qtd = bradesco_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    sicoob_cons_obj = sicoob_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    sicoob_cons = sicoob_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    sicoob_cons_qtd = sicoob_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    zema_cons_obj = zema_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    zema_cons = zema_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    zema_cons_qtd = zema_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    rodobens_cons_obj = rodobens_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    rodobens_cons = rodobens_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    rodobens_cons_qtd = rodobens_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    yamaha_cons_obj = yamaha_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    yamaha_cons = yamaha_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    yamaha_cons_qtd = yamaha_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    santander_cons_obj = santander_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    santander_cons = santander_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    santander_cons_qtd = santander_cons_obj.aggregate(Sum('Margem'))['Margem__sum']

    #def check_vl_forma_isNone():
    if avista is None:
        avista = 0
    if cnh2 is None:
        cnh2 = 0
    if cnh is None:
        cnh = 0
    if cartao is None:
        cartao = 0
    if troca is None:
        troca = 0
    if cdcp is None:
        cdcp = 0
    if bradesco is None:
        bradesco = 0
    if bndes is None:
        bndes = 0
    if bv is None:
        bv = 0
    if banco_honda is None:
        banco_honda = 0
    if brasil is None:
        brasil = 0
    if ponta is None:
        ponta = 0
    if br_cons is None:
        br_cons = 0
    if bradesco_cons is None:
        bradesco_cons = 0
    if sicoob_cons is None:
        sicoob_cons = 0
    if zema_cons is None:
        zema_cons = 0
    if rodobens_cons is None:
        rodobens_cons = 0
    if yamaha_cons is None:
        yamaha_cons = 0
    if santander_cons is None:
        santander_cons = 0



    #def check_qtd_formas_isNone():
    if avista_qtd is None:
        avista_qtd = 0
    if cnh2_qtd is None:
        cnh2_qtd = 0
    if cnh_qtd is None:
        cnh_qtd = 0
    if cartao_qtd is None:
        cartao_qtd = 0
    if troca_qtd is None:
        troca_qtd = 0
    if cdcp_qtd is None:
        cdcp_qtd = 0
    if bradesco_qtd is None:
        bradesco_qtd = 0
    if bndes_qtd is None:
        bndes_qtd = 0
    if bv_qtd is None:
        bv_qtd = 0
    if banco_honda_qtd is None:
        banco_honda_qtd = 0
    if brasil_qtd is None:
        brasil_qtd = 0
    if ponta_qtd is None:
        ponta_qtd = 0
    if br_cons_qtd is None:
        br_cons_qtd = 0
    if bradesco_cons_qtd is None:
        bradesco_cons_qtd = 0
    if sicoob_cons_qtd is None:
        sicoob_cons_qtd = 0
    if zema_cons_qtd is None:
        zema_cons_qtd = 0
    if rodobens_cons_qtd is None:
        rodobens_cons_qtd = 0
    if yamaha_cons_qtd is None:
        yamaha_cons_qtd = 0
    if santander_cons_qtd is None:
        santander_cons_qtd = 0



    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    dict_cdc = {
        'BNDES' : locale.currency(bndes, grouping=True, symbol=None),
        'BV' : locale.currency(bv, grouping=True, symbol=None),
        'BRADESCO' : locale.currency(bradesco, grouping=True, symbol=None),
        'BANCO HONDA' : locale.currency(banco_honda, grouping=True, symbol=None),
        'BANCO DO BRASIL' : locale.currency(brasil, grouping=True, symbol=None),
    }

    dict_cons = {
        'PONTA CONS' : locale.currency(ponta, grouping=True, symbol=None),
        'BRADESCO CONS' : locale.currency(bradesco_cons, grouping=True, symbol=None),
        'BR' : locale.currency(br_cons, grouping=True, symbol=None),
        'SICOOB' : locale.currency(sicoob_cons, grouping=True, symbol=None),
        'ZEMA' : locale.currency(zema_cons, grouping=True, symbol=None),
        'YAMAHA' : locale.currency(yamaha_cons, grouping=True, symbol=None),
        'SANTANDER' : locale.currency(santander_cons, grouping=True, symbol=None),
    }

    total_cons = ponta + bradesco_cons + bradesco_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons
    total_cons_qtd = ponta_qtd + bradesco_cons_qtd + bradesco_cons_qtd + sicoob_cons_qtd + zema_cons_qtd + yamaha_cons_qtd + santander_cons_qtd

    total_cdc = bndes + bv + bradesco + banco_honda + brasil
    total_cdc_qtd = bndes_qtd + bv_qtd + bradesco_qtd + banco_honda_qtd + brasil_qtd

    total_cnh_qtd = cnh2_qtd + cnh_qtd
    total_cnh = cnh + cnh2

    total_formas_pagamento = avista + cnh + cnh2 + cartao + troca + bndes + bv + bradesco + banco_honda + brasil + ponta + bradesco_cons + br_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons

    if total_cdc_qtd == 0:
        porcen_cdc_lucratividade = 0
    else:        
        porcen_cdc_lucratividade = total_cdc_qtd / total_cdc 
    if total_cons_qtd == 0:
        porcen_cons_lucratividade = 0
    else:
        porcen_cons_lucratividade= total_cons_qtd / total_cons
    if avista_qtd == 0:
        porcen_avista_lucratividade = 0
    else:
        porcen_avista_lucratividade= avista_qtd / avista
    if total_cnh_qtd == 0 :
        porcen_cnh_lucratividade = 0
    else:
        porcen_cnh_lucratividade = total_cnh_qtd / total_cnh
    if cartao_qtd == 0:
        porcen_cartao_lucratividade = 0
    else:
       porcen_cartao_lucratividade = cartao_qtd / cartao
    if cdcp_qtd == 0:
        porcen_cdcp_lucratividade = 0
    else:
        porcen_cdcp_lucratividade= cdcp_qtd / cdcp
    if bndes_qtd == 0:
        porcen_bndes_lucratividade = 0
    else:
        porcen_bndes_lucratividade= bndes_qtd / bndes
    if bv_qtd == 0:
        porcen_bv_lucratividade = 0
    else:
        porcen_bv_lucratividade = bv_qtd / bv
    if bradesco_qtd == 0:
        porcen_bradesco_lucratividade = 0
    else:
        porcen_bradesco_lucratividade=bradesco_qtd / bradesco
    if banco_honda_qtd == 0:
        porcen_banco_honda_lucratividade = 0
    else:
        porcen_banco_honda_lucratividade= banco_honda_qtd / banco_honda
    if brasil_qtd == 0:
        porcen_brasil_lucratividade = 0
    else:
        porcen_brasil_lucratividade= brasil_qtd / brasil
    if ponta_qtd == 0:
        porcen_ponta_lucratividade = 0
    else:
        porcen_ponta_lucratividade= ponta_qtd / ponta
    if bradesco_cons_qtd == 0:
        porcen_bradesco_cons_lucratividade = 0
    else:
        porcen_bradesco_cons_lucratividade = bradesco_cons_qtd / bradesco_cons
    if br_cons_qtd == 0 : 
        porcen_br_cons_lucratividade = 0
    else:
        porcen_br_cons_lucratividade = br_cons_qtd / br_cons
    if sicoob_cons_qtd == 0:
        porcen_sicoob_cons_lucratividade = 0
    else:
        porcen_sicoob_cons_lucratividade   = sicoob_cons_qtd / sicoob_cons
    if zema_cons_qtd == 0:
        porcen_zema_cons_lucratividade = 0
    else:
        porcen_zema_cons_lucratividade     = zema_cons_qtd / zema_cons
    if yamaha_cons_qtd == 0:
        porcen_yamaha_cons_lucratividade = 0
    else:
        porcen_yamaha_cons_lucratividade   = yamaha_cons_qtd / yamaha_cons
    if santander_cons_qtd == 0 :
        porcen_santander_cons_lucratividade = 0
    else:
        porcen_santander_cons_lucratividade = santander_cons_qtd / santander_cons

    # percenturais das formas de pagamento
    porcen_cdc           = total_cdc / realizado_modelo
    porcen_cons          = total_cons / realizado_modelo
    porcen_avista        = avista / realizado_modelo    
    porcen_cnh           = (cnh / realizado_modelo) + (cnh2 / realizado_modelo)
    porcen_cartao        = cartao / realizado_modelo
    porcen_cdcp          = cdcp / realizado_modelo
    porcen_bndes         = bndes / realizado_modelo
    porcen_bv            = bv / realizado_modelo
    porcen_bradesco      = bradesco / realizado_modelo
    porcen_banco_honda   = banco_honda / realizado_modelo
    porcen_brasil        = brasil / realizado_modelo
    porcen_ponta         = ponta / realizado_modelo
    porcen_bradesco_cons = bradesco_cons / realizado_modelo
    porcen_br_cons       = br_cons / realizado_modelo
    porcen_sicoob_cons   = sicoob_cons / realizado_modelo
    porcen_zema_cons     = zema_cons / realizado_modelo
    porcen_yamaha_cons   = yamaha_cons / realizado_modelo
    porcen_santander_cons = santander_cons / realizado_modelo

    # caapresentaçao será 0 até arrumar no sistema da vision
    #porcen_capresentacao = capresentacao / realizado_modelo
    porcen_capresentacao = 0

    lucratividade_dict = {
        'porcen_cdc_lucratividade' :"{:.2f}".format(porcen_cdc_lucratividade*100),
        'porcen_cons_lucratividade' :"{:.2f}".format(porcen_cons_lucratividade*100),
        'porcen_avista_lucratividade' :"{:.2f}".format(porcen_avista_lucratividade*100),
        'porcen_cnh_lucratividade' :"{:.2f}".format(porcen_cnh_lucratividade*100),
        'porcen_cartao_lucratividade' :"{:.2f}".format(porcen_cartao_lucratividade*100),
        'porcen_cdcp_lucratividade' :"{:.2f}".format(porcen_cdcp_lucratividade*100),
        'porcen_bndes_lucratividade' :"{:.2f}".format(porcen_bndes_lucratividade*100),
        'porcen_bv_lucratividade' :"{:.2f}".format(porcen_bv_lucratividade*100),
        'porcen_bradesco_lucratividade' :"{:.2f}".format(porcen_bradesco_lucratividade*100),
        'porcen_banco_honda_lucratividade' :"{:.2f}".format(porcen_banco_honda_lucratividade*100),
        'porcen_brasil_lucratividade' :"{:.2f}".format(porcen_brasil_lucratividade*100),
        'porcen_ponta_lucratividade' :"{:.2f}".format(porcen_ponta_lucratividade*100),
        'porcen_bradesco_cons_lucratividade' :"{:.2f}".format(porcen_bradesco_cons_lucratividade*100),
        'porcen_br_cons_lucratividade' :"{:.2f}".format(porcen_br_cons_lucratividade*100),
        'porcen_sicoob_cons_lucratividade' :"{:.2f}".format(porcen_sicoob_cons_lucratividade*100),
        'porcen_zema_cons_lucratividade' :"{:.2f}".format(porcen_zema_cons_lucratividade*100),
        'porcen_yamaha_cons_lucratividade' :"{:.2f}".format(porcen_yamaha_cons_lucratividade*100),
        'porcen_santander_cons_lucratividade' :"{:.2f}".format(porcen_santander_cons_lucratividade*100),
    }    

    context = {
        'regiao': vendedor,
        'modelo': modelo,
        'avatar': avatar,
        'lucratividade_formas_pgto' : lucratividade_dict,
        'realizado_modelo': locale.currency(realizado_modelo, grouping=True, symbol=None),
        'realizado_total': locale.currency(realizado_total, grouping=True, symbol=None),
        'quantidade_total': quantidade_total,
        'quantidade_modelo': quantidade_modelo,
        'ticket_medio': locale.currency(ticket_medio, grouping=True, symbol=None),
        'participacao_realizado': "{:.2f}".format(participacao_realizado*100),
        'participacao_quantidade': "{:.2f}".format(participacao_quantidade*100),
        'margem': locale.currency(realizado_total, grouping=True, symbol=None),
        'margem_total_modelos': locale.currency(margem_total, grouping=True, symbol=None),
        'margem_unitario': locale.currency(margem_unitario, grouping=True, symbol=None),
        'participacao_margem': "{:.2f}".format(participacao_margem*100),
        'avista': locale.currency(avista, grouping=True, symbol=None),
        'total_formas_pagamento': locale.currency(total_formas_pagamento, grouping=True, symbol=None),
        'cdc_obj': dict_cdc,
        'cons_obj': dict_cons,
        'cdc': locale.currency(total_cdc, grouping=True, symbol=None),
        'cons': locale.currency(total_cons, grouping=True, symbol=None),
        'cnh': locale.currency(cnh + cnh2, grouping=True, symbol=None),        
        'cartao': locale.currency(cartao, grouping=True, symbol=None),
        'troca': locale.currency(troca, grouping=True, symbol=None),
        'cdcp': locale.currency(cdcp, grouping=True, symbol=None),
        'capresentacao': capresentacao,
        'porcen_cdc'           :  "{:.2f}".format(porcen_cdc*100),
        'porcen_cons'          :  "{:.2f}".format(porcen_cons*100),
        'porcen_avista'        :  "{:.2f}".format(porcen_avista*100),
        'porcen_cnh'           :  "{:.2f}".format(porcen_cnh*100),
        'porcen_bndes'         :  "{:.2f}".format(porcen_bndes*100),
        'porcen_cartao'        :  "{:.2f}".format(porcen_cartao*100),
        'porcen_cdcp'          :  "{:.2f}".format(porcen_cdcp*100),
        'porcen_capresentacao' :  "{:.2f}".format(porcen_capresentacao*100),
        'porcen_bndes'         : "{:.2f}".format(porcen_bndes*100),
        'porcen_bv'            : "{:.2f}".format(porcen_bv*100),
        'porcen_bradesco'      : "{:.2f}".format(porcen_bradesco*100),
        'porcen_banco_honda'   : "{:.2f}".format(porcen_banco_honda*100),
        'porcen_brasil'        : "{:.2f}".format(porcen_brasil*100),
        'porcen_ponta'         : "{:.2f}".format(porcen_ponta*100),
        'porcen_bradesco_cons' : "{:.2f}".format(porcen_bradesco_cons*100),
        'porcen_br_cons'       : "{:.2f}".format(porcen_br_cons*100),
        'porcen_sicoob_cons'   : "{:.2f}".format(porcen_sicoob_cons*100),
        'porcen_zema_con'      : "{:.2f}".format(porcen_zema_cons*100),
        'porcen_yamaha_cons'   : "{:.2f}".format(porcen_yamaha_cons*100),
        'porcen_santander_cons' : "{:.2f}".format(porcen_santander_cons*100),
        
    }

    return Response(context)

@api_view(['GET'])
def produto_modelo_vendedor_cidade(request,modelo,dia,mes,ano,vendedor,cidade):
    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    ultimo_dia_mes = calendar.monthrange(ano,mes)

    vendedor_obj = Moto.objects.filter(Vendedor_cpf = vendedor).last()
    vendedor_nome = vendedor_obj.Vendedor
    modelo_obj = MotoPerfil.objects.get(nome = modelo)
    avatar = modelo_obj.avatar

    # REALIZADO
    realizado_modelo = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    if realizado_modelo is None: 
        return Response({'error', 'Nao existem vendas para este modelo até o dia pesquisado.'})
    
    realizado_total = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']

    quantidade_total  = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    quantidade_modelo = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

    ticket_medio = realizado_modelo / quantidade_modelo

    participacao_realizado = float(realizado_modelo / realizado_total)
    participacao_quantidade = float(quantidade_modelo / quantidade_total)


    # estoque no dia 

    # margem
    margem_total = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem_unitario = margem / quantidade_modelo
    participacao_margem = margem / margem_total

    devolucoes_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CARTEIRA LOJA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    list_devolucao_chassi = [] 
    list_devolucao_vlnota = [] 
    for i in devolucoes_obj:
        print(i.Chassi)
        vlnota = i.Valor_da_Nota * -1
        list_devolucao_chassi.append(i.Chassi)
        list_devolucao_vlnota.append(vlnota)        
    list_exclude = []
    list_chassi = []
    #formas de pagamento 
    avista_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'RECEBER NA ENTREGA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_avista = avista_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_avista_exclude = []
    if filtro_avista.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_avista:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_avista')

    bv_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BV', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bv = bv_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bv_exclude = []
    if filtro_bv.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bv:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bv')

        ######################## BRADESCO              
    bradesco_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BRADESCO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco = bradesco_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bradesco_exclude = []
    if filtro_bradesco.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco')

    ######################## BANCO HONDA  
    banco_honda_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BANCO HONDA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_banco_honda = banco_honda_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_banco_honda_exclude = []
    if filtro_banco_honda.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_banco_honda:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Valor: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_banco_honda')
    
    
    cnh_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CNH - SEM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh = cnh_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh_exclude = []
    if filtro_cnh.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} //Numero: {i.Nota_Fiscal} // Modalidade: filtro_cnh')
    
    cnh2_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CNH - COM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh2 = cnh2_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh2_exclude = []
    if filtro_cnh2.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh2:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Nota_Fiscal} /// {i.Chassi} // Numero: {i.Valor_da_Nota} // Modalidade: filtro_cnh2')
    
    bndes_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BANCO BNDES', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bndes = bndes_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bndes_exclude = []
    if filtro_bndes.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bndes:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bndes')
    
    ############# BANCO DO BRASIL 
    brasil_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BANCO DO BRASIL', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_brasil = brasil_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_brasil_exclude = []
    if filtro_brasil.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_brasil:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_brasil')

    cartao_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CARTaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cartao = cartao_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cartao_exclude = []
    if filtro_cartao.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cartao:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cartao')

    troca_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'MOTO USADA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_troca = troca_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_troca.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_troca:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_troca')

    cdcp_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica__in = ['James CDCP Sem alienaçao', 'JAMES CDCP'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cdcp = cdcp_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_cdcp.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cdcp:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cdcp')

    ######################### PONTA CONSORCIO
    ponta_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica__in = ['PONTA CONSÓRCIOS'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_ponta = ponta_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_ponta_exclude = []
    if filtro_ponta.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_ponta:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_ponta')

    ######################### BRADESCO CONSORCIOS
    bradesco_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BRADESCO CONSÓRCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco_cons = bradesco_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_bradesco_cons_exclude = []
    if filtro_bradesco_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco_cons')
    ######################### BR CONSORCIOS
    br_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'BR CONSORCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_br_cons = br_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_br_cons_exclude = []
    if filtro_br_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_br_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_br_cons')

    ######################### SICOOB CREDIVAG
    sicoob_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'SICOOB CREDIVAG', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_sicoob_cons = sicoob_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_sicoob_cons_exclude = []
    if filtro_sicoob_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_sicoob_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_sicoob_cons')
    ######################### CONSORCIO ZEMA
    zema_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'CONSORCIO ZEMA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_zema_cons = zema_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_zema_cons_exclude = []
    if filtro_zema_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_zema_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_zema_cons')
    ######################### RODOBENS
    rodobens_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'RODOBENS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_rodobens_cons = rodobens_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_rodobens_cons_exclude = []
    if filtro_rodobens_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_rodobens_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_rodobens_cons')
    ######################### YAMAHA ADMINISTRADORA
    yamaha_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'YAMAHA ADMINISTRADORA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_yamaha_cons = yamaha_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_yamaha_cons_exclude = []
    if filtro_yamaha_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_yamaha_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_yamaha_cons')
    ######################### SANTANDER
    santander_cons_obj = Moto.objects.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Sub_Forma_Fabrica = 'SANTANDER', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_santander_cons = santander_cons_obj.filter(Municipio = cidade ,Vendedor_cpf = vendedor , Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_santander_cons_exclude = []
    if filtro_santander_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_santander_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_santander_cons')

    capresentacao = 'indefinido'
    ###################### CDC
    bradesco_obj = bradesco_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco = bradesco_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bradesco_qtd = bradesco_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bndes_obj = bndes_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bndes = bndes_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bndes_qtd = bndes_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bv_obj = bv_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bv = bv_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bv_qtd = bv_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    banco_honda_obj = banco_honda_obj.exclude(Nota_Fiscal__in = list_exclude)  
    banco_honda = banco_honda_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    banco_honda_qtd = banco_honda_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    brasil_obj = brasil_obj.exclude(Nota_Fiscal__in = list_exclude)  
    brasil = brasil_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    brasil_qtd = brasil_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    ################ OUTROS 
    cnh_obj = cnh_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cnh = cnh_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh_qtd = cnh_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cnh2_obj = cnh2_obj.exclude(Nota_Fiscal__in = list_exclude)
    cnh2 = cnh2_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh2_qtd = cnh2_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cartao_obj = cartao_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cartao = cartao_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cartao_qtd = cartao_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    avista_obj = avista_obj.exclude(Nota_Fiscal__in = list_exclude)    
    avista = avista_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    avista_qtd = avista_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    troca_obj = troca_obj.exclude(Nota_Fiscal__in = list_exclude)  
    troca = troca_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    troca_qtd = troca_obj.aggregate(Sum('Margem'))['Margem__sum']
    cdcp_obj = cdcp_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cdcp = cdcp_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    cdcp_qtd = cdcp_obj.aggregate(Sum('Margem'))['Margem__sum']
    ################### CONSORCIOS 
    ponta_obj = ponta_obj.exclude(Nota_Fiscal__in = list_exclude)  
    ponta = ponta_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    ponta_qtd = ponta_obj.aggregate(Sum('Margem'))['Margem__sum']
    br_cons_obj = br_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    br_cons = br_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    br_cons_qtd = br_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    bradesco_cons_obj = bradesco_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco_cons = bradesco_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    bradesco_cons_qtd = bradesco_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    sicoob_cons_obj = sicoob_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    sicoob_cons = sicoob_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    sicoob_cons_qtd = sicoob_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    zema_cons_obj = zema_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    zema_cons = zema_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    zema_cons_qtd = zema_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    rodobens_cons_obj = rodobens_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    rodobens_cons = rodobens_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    rodobens_cons_qtd = rodobens_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    yamaha_cons_obj = yamaha_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    yamaha_cons = yamaha_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    yamaha_cons_qtd = yamaha_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    santander_cons_obj = santander_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    santander_cons = santander_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    santander_cons_qtd = santander_cons_obj.aggregate(Sum('Margem'))['Margem__sum']

    #def check_vl_forma_isNone():
    if avista is None:
        avista = 0
    if cnh2 is None:
        cnh2 = 0
    if cnh is None:
        cnh = 0
    if cartao is None:
        cartao = 0
    if troca is None:
        troca = 0
    if cdcp is None:
        cdcp = 0
    if bradesco is None:
        bradesco = 0
    if bndes is None:
        bndes = 0
    if bv is None:
        bv = 0
    if banco_honda is None:
        banco_honda = 0
    if brasil is None:
        brasil = 0
    if ponta is None:
        ponta = 0
    if br_cons is None:
        br_cons = 0
    if bradesco_cons is None:
        bradesco_cons = 0
    if sicoob_cons is None:
        sicoob_cons = 0
    if zema_cons is None:
        zema_cons = 0
    if rodobens_cons is None:
        rodobens_cons = 0
    if yamaha_cons is None:
        yamaha_cons = 0
    if santander_cons is None:
        santander_cons = 0



    #def check_qtd_formas_isNone():
    if avista_qtd is None:
        avista_qtd = 0
    if cnh2_qtd is None:
        cnh2_qtd = 0
    if cnh_qtd is None:
        cnh_qtd = 0
    if cartao_qtd is None:
        cartao_qtd = 0
    if troca_qtd is None:
        troca_qtd = 0
    if cdcp_qtd is None:
        cdcp_qtd = 0
    if bradesco_qtd is None:
        bradesco_qtd = 0
    if bndes_qtd is None:
        bndes_qtd = 0
    if bv_qtd is None:
        bv_qtd = 0
    if banco_honda_qtd is None:
        banco_honda_qtd = 0
    if brasil_qtd is None:
        brasil_qtd = 0
    if ponta_qtd is None:
        ponta_qtd = 0
    if br_cons_qtd is None:
        br_cons_qtd = 0
    if bradesco_cons_qtd is None:
        bradesco_cons_qtd = 0
    if sicoob_cons_qtd is None:
        sicoob_cons_qtd = 0
    if zema_cons_qtd is None:
        zema_cons_qtd = 0
    if rodobens_cons_qtd is None:
        rodobens_cons_qtd = 0
    if yamaha_cons_qtd is None:
        yamaha_cons_qtd = 0
    if santander_cons_qtd is None:
        santander_cons_qtd = 0



    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    dict_cdc = {
        'BNDES' : locale.currency(bndes, grouping=True, symbol=None),
        'BV' : locale.currency(bv, grouping=True, symbol=None),
        'BRADESCO' : locale.currency(bradesco, grouping=True, symbol=None),
        'BANCO HONDA' : locale.currency(banco_honda, grouping=True, symbol=None),
        'BANCO DO BRASIL' : locale.currency(brasil, grouping=True, symbol=None),
    }

    dict_cons = {
        'PONTA CONS' : locale.currency(ponta, grouping=True, symbol=None),
        'BRADESCO CONS' : locale.currency(bradesco_cons, grouping=True, symbol=None),
        'BR' : locale.currency(br_cons, grouping=True, symbol=None),
        'SICOOB' : locale.currency(sicoob_cons, grouping=True, symbol=None),
        'ZEMA' : locale.currency(zema_cons, grouping=True, symbol=None),
        'YAMAHA' : locale.currency(yamaha_cons, grouping=True, symbol=None),
        'SANTANDER' : locale.currency(santander_cons, grouping=True, symbol=None),
    }

    total_cons = ponta + bradesco_cons + bradesco_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons
    total_cons_qtd = ponta_qtd + bradesco_cons_qtd + bradesco_cons_qtd + sicoob_cons_qtd + zema_cons_qtd + yamaha_cons_qtd + santander_cons_qtd

    total_cdc = bndes + bv + bradesco + banco_honda + brasil
    total_cdc_qtd = bndes_qtd + bv_qtd + bradesco_qtd + banco_honda_qtd + brasil_qtd

    total_cnh_qtd = cnh2_qtd + cnh_qtd
    total_cnh = cnh + cnh2

    total_formas_pagamento = avista + cnh + cnh2 + cartao + troca + bndes + bv + bradesco + banco_honda + brasil + ponta + bradesco_cons + br_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons

    if total_cdc_qtd == 0:
        porcen_cdc_lucratividade = 0
    else:        
        porcen_cdc_lucratividade = total_cdc_qtd / total_cdc 
    if total_cons_qtd == 0:
        porcen_cons_lucratividade = 0
    else:
        porcen_cons_lucratividade= total_cons_qtd / total_cons
    if avista_qtd == 0:
        porcen_avista_lucratividade = 0
    else:
        porcen_avista_lucratividade= avista_qtd / avista
    if total_cnh_qtd == 0 :
        porcen_cnh_lucratividade = 0
    else:
        porcen_cnh_lucratividade = total_cnh_qtd / total_cnh
    if cartao_qtd == 0:
        porcen_cartao_lucratividade = 0
    else:
       porcen_cartao_lucratividade = cartao_qtd / cartao
    if cdcp_qtd == 0:
        porcen_cdcp_lucratividade = 0
    else:
        porcen_cdcp_lucratividade= cdcp_qtd / cdcp
    if bndes_qtd == 0:
        porcen_bndes_lucratividade = 0
    else:
        porcen_bndes_lucratividade= bndes_qtd / bndes
    if bv_qtd == 0:
        porcen_bv_lucratividade = 0
    else:
        porcen_bv_lucratividade = bv_qtd / bv
    if bradesco_qtd == 0:
        porcen_bradesco_lucratividade = 0
    else:
        porcen_bradesco_lucratividade=bradesco_qtd / bradesco
    if banco_honda_qtd == 0:
        porcen_banco_honda_lucratividade = 0
    else:
        porcen_banco_honda_lucratividade= banco_honda_qtd / banco_honda
    if brasil_qtd == 0:
        porcen_brasil_lucratividade = 0
    else:
        porcen_brasil_lucratividade= brasil_qtd / brasil
    if ponta_qtd == 0:
        porcen_ponta_lucratividade = 0
    else:
        porcen_ponta_lucratividade= ponta_qtd / ponta
    if bradesco_cons_qtd == 0:
        porcen_bradesco_cons_lucratividade = 0
    else:
        porcen_bradesco_cons_lucratividade = bradesco_cons_qtd / bradesco_cons
    if br_cons_qtd == 0 : 
        porcen_br_cons_lucratividade = 0
    else:
        porcen_br_cons_lucratividade = br_cons_qtd / br_cons
    if sicoob_cons_qtd == 0:
        porcen_sicoob_cons_lucratividade = 0
    else:
        porcen_sicoob_cons_lucratividade   = sicoob_cons_qtd / sicoob_cons
    if zema_cons_qtd == 0:
        porcen_zema_cons_lucratividade = 0
    else:
        porcen_zema_cons_lucratividade     = zema_cons_qtd / zema_cons
    if yamaha_cons_qtd == 0:
        porcen_yamaha_cons_lucratividade = 0
    else:
        porcen_yamaha_cons_lucratividade   = yamaha_cons_qtd / yamaha_cons
    if santander_cons_qtd == 0 :
        porcen_santander_cons_lucratividade = 0
    else:
        porcen_santander_cons_lucratividade = santander_cons_qtd / santander_cons

    # percenturais das formas de pagamento
    porcen_cdc           = total_cdc / realizado_modelo
    porcen_cons          = total_cons / realizado_modelo
    porcen_avista        = avista / realizado_modelo    
    porcen_cnh           = (cnh / realizado_modelo) + (cnh2 / realizado_modelo)
    porcen_cartao        = cartao / realizado_modelo
    porcen_cdcp          = cdcp / realizado_modelo
    porcen_bndes         = bndes / realizado_modelo
    porcen_bv            = bv / realizado_modelo
    porcen_bradesco      = bradesco / realizado_modelo
    porcen_banco_honda   = banco_honda / realizado_modelo
    porcen_brasil        = brasil / realizado_modelo
    porcen_ponta         = ponta / realizado_modelo
    porcen_bradesco_cons = bradesco_cons / realizado_modelo
    porcen_br_cons       = br_cons / realizado_modelo
    porcen_sicoob_cons   = sicoob_cons / realizado_modelo
    porcen_zema_cons     = zema_cons / realizado_modelo
    porcen_yamaha_cons   = yamaha_cons / realizado_modelo
    porcen_santander_cons = santander_cons / realizado_modelo

    # caapresentaçao será 0 até arrumar no sistema da vision
    #porcen_capresentacao = capresentacao / realizado_modelo
    porcen_capresentacao = 0

    lucratividade_dict = {
        'porcen_cdc_lucratividade' :"{:.2f}".format(porcen_cdc_lucratividade*100),
        'porcen_cons_lucratividade' :"{:.2f}".format(porcen_cons_lucratividade*100),
        'porcen_avista_lucratividade' :"{:.2f}".format(porcen_avista_lucratividade*100),
        'porcen_cnh_lucratividade' :"{:.2f}".format(porcen_cnh_lucratividade*100),
        'porcen_cartao_lucratividade' :"{:.2f}".format(porcen_cartao_lucratividade*100),
        'porcen_cdcp_lucratividade' :"{:.2f}".format(porcen_cdcp_lucratividade*100),
        'porcen_bndes_lucratividade' :"{:.2f}".format(porcen_bndes_lucratividade*100),
        'porcen_bv_lucratividade' :"{:.2f}".format(porcen_bv_lucratividade*100),
        'porcen_bradesco_lucratividade' :"{:.2f}".format(porcen_bradesco_lucratividade*100),
        'porcen_banco_honda_lucratividade' :"{:.2f}".format(porcen_banco_honda_lucratividade*100),
        'porcen_brasil_lucratividade' :"{:.2f}".format(porcen_brasil_lucratividade*100),
        'porcen_ponta_lucratividade' :"{:.2f}".format(porcen_ponta_lucratividade*100),
        'porcen_bradesco_cons_lucratividade' :"{:.2f}".format(porcen_bradesco_cons_lucratividade*100),
        'porcen_br_cons_lucratividade' :"{:.2f}".format(porcen_br_cons_lucratividade*100),
        'porcen_sicoob_cons_lucratividade' :"{:.2f}".format(porcen_sicoob_cons_lucratividade*100),
        'porcen_zema_cons_lucratividade' :"{:.2f}".format(porcen_zema_cons_lucratividade*100),
        'porcen_yamaha_cons_lucratividade' :"{:.2f}".format(porcen_yamaha_cons_lucratividade*100),
        'porcen_santander_cons_lucratividade' :"{:.2f}".format(porcen_santander_cons_lucratividade*100),
    }    

    context = {
        'regiao': cidade,
        'vendedor': vendedor_nome,
        'modelo': modelo,
        'avatar': avatar,
        'lucratividade_formas_pgto' : lucratividade_dict,
        'realizado_modelo': locale.currency(realizado_modelo, grouping=True, symbol=None),
        'realizado_total': locale.currency(realizado_total, grouping=True, symbol=None),
        'quantidade_total': quantidade_total,
        'quantidade_modelo': quantidade_modelo,
        'ticket_medio': locale.currency(ticket_medio, grouping=True, symbol=None),
        'participacao_realizado': "{:.2f}".format(participacao_realizado*100),
        'participacao_quantidade': "{:.2f}".format(participacao_quantidade*100),
        'margem': locale.currency(realizado_total, grouping=True, symbol=None),
        'margem_total_modelos': locale.currency(margem_total, grouping=True, symbol=None),
        'margem_unitario': locale.currency(margem_unitario, grouping=True, symbol=None),
        'participacao_margem': "{:.2f}".format(participacao_margem*100),
        'avista': locale.currency(avista, grouping=True, symbol=None),
        'total_formas_pagamento': locale.currency(total_formas_pagamento, grouping=True, symbol=None),
        'cdc_obj': dict_cdc,
        'cons_obj': dict_cons,
        'cdc': locale.currency(total_cdc, grouping=True, symbol=None),
        'cons': locale.currency(total_cons, grouping=True, symbol=None),
        'cnh': locale.currency(cnh + cnh2, grouping=True, symbol=None),        
        'cartao': locale.currency(cartao, grouping=True, symbol=None),
        'troca': locale.currency(troca, grouping=True, symbol=None),
        'cdcp': locale.currency(cdcp, grouping=True, symbol=None),
        'capresentacao': capresentacao,
        'porcen_cdc'           :  "{:.2f}".format(porcen_cdc*100),
        'porcen_cons'          :  "{:.2f}".format(porcen_cons*100),
        'porcen_avista'        :  "{:.2f}".format(porcen_avista*100),
        'porcen_cnh'           :  "{:.2f}".format(porcen_cnh*100),
        'porcen_bndes'         :  "{:.2f}".format(porcen_bndes*100),
        'porcen_cartao'        :  "{:.2f}".format(porcen_cartao*100),
        'porcen_cdcp'          :  "{:.2f}".format(porcen_cdcp*100),
        'porcen_capresentacao' :  "{:.2f}".format(porcen_capresentacao*100),
        'porcen_bndes'         : "{:.2f}".format(porcen_bndes*100),
        'porcen_bv'            : "{:.2f}".format(porcen_bv*100),
        'porcen_bradesco'      : "{:.2f}".format(porcen_bradesco*100),
        'porcen_banco_honda'   : "{:.2f}".format(porcen_banco_honda*100),
        'porcen_brasil'        : "{:.2f}".format(porcen_brasil*100),
        'porcen_ponta'         : "{:.2f}".format(porcen_ponta*100),
        'porcen_bradesco_cons' : "{:.2f}".format(porcen_bradesco_cons*100),
        'porcen_br_cons'       : "{:.2f}".format(porcen_br_cons*100),
        'porcen_sicoob_cons'   : "{:.2f}".format(porcen_sicoob_cons*100),
        'porcen_zema_con'      : "{:.2f}".format(porcen_zema_cons*100),
        'porcen_yamaha_cons'   : "{:.2f}".format(porcen_yamaha_cons*100),
        'porcen_santander_cons' : "{:.2f}".format(porcen_santander_cons*100),
        
    }

    return Response(context)

@api_view(['GET'])
def produto_modelo_geral(request,modelo,dia,mes,ano):

    
    # dia = 31
    # ano = 2019
    # mes = 12
    ultimo_dia_mes = calendar.monthrange(ano,mes)

    # modelo = 'NXR 160 BROS ESDD'

    #pega cidades da regiao
    list_cidade = list(Cidade.objects.filter(regiao = regiao))

    # REALIZADO
    realizado_modelo = Moto.objects.filter(Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    if realizado_modelo is None: 
        return Response({'error', 'Nao existem vendas para este modelo até o dia pesquisado.'})
    
    realizado_total = Moto.objects.filter(Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']

    quantidade_total  = Moto.objects.filter(Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    quantidade_modelo = Moto.objects.filter(Veiculo = modelo , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

    ticket_medio = realizado_modelo / quantidade_modelo

    participacao_realizado = float(realizado_modelo / realizado_total)
    participacao_quantidade = float(quantidade_modelo / quantidade_total)

    # estoque no dia 

    # margem
    margem_total = Moto.objects.filter(Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem = Moto.objects.filter(Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
    margem_unitario = margem / quantidade_modelo
    participacao_margem = margem / margem_total


    devolucoes_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'CARTEIRA LOJA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    list_devolucao_chassi = [] 
    list_devolucao_vlnota = [] 
    for i in devolucoes_obj:
        print(i.Chassi)
        vlnota = i.Valor_da_Nota * -1
        list_devolucao_chassi.append(i.Chassi)
        list_devolucao_vlnota.append(vlnota)        
    list_exclude = []
    list_chassi = []
    #formas de pagamento 
    avista_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'RECEBER NA ENTREGA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_avista = avista_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_avista_exclude = []
    if filtro_avista.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_avista:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_avista')

    bv_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BV', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bv = bv_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bv_exclude = []
    if filtro_bv.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bv:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bv')

        ######################## BRADESCO              
    bradesco_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BRADESCO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco = bradesco_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bradesco_exclude = []
    if filtro_bradesco.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco')

    ######################## BANCO HONDA  
    banco_honda_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BANCO HONDA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_banco_honda = banco_honda_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_banco_honda_exclude = []
    if filtro_banco_honda.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_banco_honda:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Valor: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_banco_honda')
    
    
    cnh_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'CNH - SEM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh = cnh_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh_exclude = []
    if filtro_cnh.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} //Numero: {i.Nota_Fiscal} // Modalidade: filtro_cnh')
    
    cnh2_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'CNH - COM ALIENAÇaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cnh2 = cnh2_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cnh2_exclude = []
    if filtro_cnh2.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cnh2:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Nota_Fiscal} /// {i.Chassi} // Numero: {i.Valor_da_Nota} // Modalidade: filtro_cnh2')
    
    bndes_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BANCO BNDES', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bndes = bndes_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_bndes_exclude = []
    if filtro_bndes.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bndes:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bndes')
    
    ############# BANCO DO BRASIL 
    brasil_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BANCO DO BRASIL', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_brasil = brasil_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_brasil_exclude = []
    if filtro_brasil.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_brasil:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_brasil')

    cartao_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'CARTaO', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cartao = cartao_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_cartao_exclude = []
    if filtro_cartao.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cartao:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cartao')

    troca_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'MOTO USADA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_troca = troca_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_troca.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_troca:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_troca')

    cdcp_obj = Moto.objects.filter(Sub_Forma_Fabrica__in = ['James CDCP Sem alienaçao', 'JAMES CDCP'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_cdcp = cdcp_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    list_troca_exclude = []
    if filtro_cdcp.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_cdcp:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cdcp')

    ######################### PONTA CONSORCIO
    ponta_obj = Moto.objects.filter(Sub_Forma_Fabrica__in = ['PONTA CONSÓRCIOS'], Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_ponta = ponta_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_ponta_exclude = []
    if filtro_ponta.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_ponta:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_ponta')

    ######################### BRADESCO CONSORCIOS
    bradesco_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BRADESCO CONSÓRCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_bradesco_cons = bradesco_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_bradesco_cons_exclude = []
    if filtro_bradesco_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_bradesco_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco_cons')
    ######################### BR CONSORCIOS
    br_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'BR CONSORCIOS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_br_cons = br_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_br_cons_exclude = []
    if filtro_br_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_br_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_br_cons')

    ######################### SICOOB CREDIVAG
    sicoob_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'SICOOB CREDIVAG', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_sicoob_cons = sicoob_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_sicoob_cons_exclude = []
    if filtro_sicoob_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_sicoob_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_sicoob_cons')
    ######################### CONSORCIO ZEMA
    zema_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'CONSORCIO ZEMA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_zema_cons = zema_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_zema_cons_exclude = []
    if filtro_zema_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_zema_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_zema_cons')
    ######################### RODOBENS
    rodobens_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'RODOBENS', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_rodobens_cons = rodobens_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_rodobens_cons_exclude = []
    if filtro_rodobens_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_rodobens_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_rodobens_cons')
    ######################### YAMAHA ADMINISTRADORA
    yamaha_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'YAMAHA ADMINISTRADORA', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_yamaha_cons = yamaha_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_yamaha_cons_exclude = []
    if filtro_yamaha_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_yamaha_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_yamaha_cons')
    ######################### SANTANDER
    santander_cons_obj = Moto.objects.filter(Sub_Forma_Fabrica = 'SANTANDER', Veiculo = modelo, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
    filtro_santander_cons = santander_cons_obj.filter(Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
    filtro_santander_cons_exclude = []
    if filtro_santander_cons.count() == 0:
        print('Nao tem notas de cancelamento')
    else:
        for i in filtro_santander_cons:
            if i.Chassi not in list_chassi:
                list_exclude.append(i.Nota_Fiscal)
                list_chassi.append(i.Chassi)
            else:
                (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
            print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_santander_cons')

    capresentacao = 'indefinido'
    ###################### CDC
    bradesco_obj = bradesco_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco = bradesco_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bradesco_qtd = bradesco_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bndes_obj = bndes_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bndes = bndes_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bndes_qtd = bndes_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    bv_obj = bv_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bv = bv_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    bv_qtd = bv_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    banco_honda_obj = banco_honda_obj.exclude(Nota_Fiscal__in = list_exclude)  
    banco_honda = banco_honda_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    banco_honda_qtd = banco_honda_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    brasil_obj = brasil_obj.exclude(Nota_Fiscal__in = list_exclude)  
    brasil = brasil_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    brasil_qtd = brasil_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    ################ OUTROS 
    cnh_obj = cnh_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cnh = cnh_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh_qtd = cnh_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cnh2_obj = cnh2_obj.exclude(Nota_Fiscal__in = list_exclude)
    cnh2 = cnh2_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cnh2_qtd = cnh2_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    cartao_obj = cartao_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cartao = cartao_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    cartao_qtd = cartao_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    avista_obj = avista_obj.exclude(Nota_Fiscal__in = list_exclude)    
    avista = avista_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
    avista_qtd = avista_obj.aggregate(Sum('Margem'))['Margem__sum'] 
    troca_obj = troca_obj.exclude(Nota_Fiscal__in = list_exclude)  
    troca = troca_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    troca_qtd = troca_obj.aggregate(Sum('Margem'))['Margem__sum']
    cdcp_obj = cdcp_obj.exclude(Nota_Fiscal__in = list_exclude)  
    cdcp = cdcp_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    cdcp_qtd = cdcp_obj.aggregate(Sum('Margem'))['Margem__sum']
    ################### CONSORCIOS 
    ponta_obj = ponta_obj.exclude(Nota_Fiscal__in = list_exclude)  
    ponta = ponta_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    ponta_qtd = ponta_obj.aggregate(Sum('Margem'))['Margem__sum']
    br_cons_obj = br_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    br_cons = br_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    br_cons_qtd = br_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    bradesco_cons_obj = bradesco_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    bradesco_cons = bradesco_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    bradesco_cons_qtd = bradesco_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    sicoob_cons_obj = sicoob_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    sicoob_cons = sicoob_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    sicoob_cons_qtd = sicoob_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    zema_cons_obj = zema_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    zema_cons = zema_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    zema_cons_qtd = zema_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    rodobens_cons_obj = rodobens_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    rodobens_cons = rodobens_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    rodobens_cons_qtd = rodobens_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    yamaha_cons_obj = yamaha_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    yamaha_cons = yamaha_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    yamaha_cons_qtd = yamaha_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
    santander_cons_obj = santander_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
    santander_cons = santander_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    santander_cons_qtd = santander_cons_obj.aggregate(Sum('Margem'))['Margem__sum']

    #def check_vl_forma_isNone():
    if avista is None:
        avista = 0
    if cnh2 is None:
        cnh2 = 0
    if cnh is None:
        cnh = 0
    if cartao is None:
        cartao = 0
    if troca is None:
        troca = 0
    if cdcp is None:
        cdcp = 0
    if bradesco is None:
        bradesco = 0
    if bndes is None:
        bndes = 0
    if bv is None:
        bv = 0
    if banco_honda is None:
        banco_honda = 0
    if brasil is None:
        brasil = 0
    if ponta is None:
        ponta = 0
    if br_cons is None:
        br_cons = 0
    if bradesco_cons is None:
        bradesco_cons = 0
    if sicoob_cons is None:
        sicoob_cons = 0
    if zema_cons is None:
        zema_cons = 0
    if rodobens_cons is None:
        rodobens_cons = 0
    if yamaha_cons is None:
        yamaha_cons = 0
    if santander_cons is None:
        santander_cons = 0



    #def check_qtd_formas_isNone():
    if avista_qtd is None:
        avista_qtd = 0
    if cnh2_qtd is None:
        cnh2_qtd = 0
    if cnh_qtd is None:
        cnh_qtd = 0
    if cartao_qtd is None:
        cartao_qtd = 0
    if troca_qtd is None:
        troca_qtd = 0
    if cdcp_qtd is None:
        cdcp_qtd = 0
    if bradesco_qtd is None:
        bradesco_qtd = 0
    if bndes_qtd is None:
        bndes_qtd = 0
    if bv_qtd is None:
        bv_qtd = 0
    if banco_honda_qtd is None:
        banco_honda_qtd = 0
    if brasil_qtd is None:
        brasil_qtd = 0
    if ponta_qtd is None:
        ponta_qtd = 0
    if br_cons_qtd is None:
        br_cons_qtd = 0
    if bradesco_cons_qtd is None:
        bradesco_cons_qtd = 0
    if sicoob_cons_qtd is None:
        sicoob_cons_qtd = 0
    if zema_cons_qtd is None:
        zema_cons_qtd = 0
    if rodobens_cons_qtd is None:
        rodobens_cons_qtd = 0
    if yamaha_cons_qtd is None:
        yamaha_cons_qtd = 0
    if santander_cons_qtd is None:
        santander_cons_qtd = 0



    locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

    dict_cdc = {
        'BNDES' : locale.currency(bndes, grouping=True, symbol=None),
        'BV' : locale.currency(bv, grouping=True, symbol=None),
        'BRADESCO' : locale.currency(bradesco, grouping=True, symbol=None),
        'BANCO HONDA' : locale.currency(banco_honda, grouping=True, symbol=None),
        'BANCO DO BRASIL' : locale.currency(brasil, grouping=True, symbol=None),
    }

    dict_cons = {
        'PONTA CONS' : locale.currency(ponta, grouping=True, symbol=None),
        'BRADESCO CONS' : locale.currency(bradesco_cons, grouping=True, symbol=None),
        'BR' : locale.currency(br_cons, grouping=True, symbol=None),
        'SICOOB' : locale.currency(sicoob_cons, grouping=True, symbol=None),
        'ZEMA' : locale.currency(zema_cons, grouping=True, symbol=None),
        'YAMAHA' : locale.currency(yamaha_cons, grouping=True, symbol=None),
        'SANTANDER' : locale.currency(santander_cons, grouping=True, symbol=None),
    }

    total_cons = ponta + bradesco_cons + bradesco_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons
    total_cons_qtd = ponta_qtd + bradesco_cons_qtd + bradesco_cons_qtd + sicoob_cons_qtd + zema_cons_qtd + yamaha_cons_qtd + santander_cons_qtd

    total_cdc = bndes + bv + bradesco + banco_honda + brasil
    total_cdc_qtd = bndes_qtd + bv_qtd + bradesco_qtd + banco_honda_qtd + brasil_qtd

    total_cnh_qtd = cnh2_qtd + cnh_qtd
    total_cnh = cnh + cnh2

    total_formas_pagamento = avista + cnh + cnh2 + cartao + troca + bndes + bv + bradesco + banco_honda + brasil + ponta + bradesco_cons + br_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons

    if total_cdc_qtd == 0:
        porcen_cdc_lucratividade = 0
    else:        
        porcen_cdc_lucratividade = total_cdc_qtd / total_cdc 
    if total_cons_qtd == 0:
        porcen_cons_lucratividade = 0
    else:
        porcen_cons_lucratividade= total_cons_qtd / total_cons
    if avista_qtd == 0:
        porcen_avista_lucratividade = 0
    else:
        porcen_avista_lucratividade= avista_qtd / avista
    if total_cnh_qtd == 0 :
        porcen_cnh_lucratividade = 0
    else:
        porcen_cnh_lucratividade = total_cnh_qtd / total_cnh
    if cartao_qtd == 0:
        porcen_cartao_lucratividade = 0
    else:
       porcen_cartao_lucratividade = cartao_qtd / cartao
    if cdcp_qtd == 0:
        porcen_cdcp_lucratividade = 0
    else:
        porcen_cdcp_lucratividade= cdcp_qtd / cdcp
    if bndes_qtd == 0:
        porcen_bndes_lucratividade = 0
    else:
        porcen_bndes_lucratividade= bndes_qtd / bndes
    if bv_qtd == 0:
        porcen_bv_lucratividade = 0
    else:
        porcen_bv_lucratividade = bv_qtd / bv
    if bradesco_qtd == 0:
        porcen_bradesco_lucratividade = 0
    else:
        porcen_bradesco_lucratividade=bradesco_qtd / bradesco
    if banco_honda_qtd == 0:
        porcen_banco_honda_lucratividade = 0
    else:
        porcen_banco_honda_lucratividade= banco_honda_qtd / banco_honda
    if brasil_qtd == 0:
        porcen_brasil_lucratividade = 0
    else:
        porcen_brasil_lucratividade= brasil_qtd / brasil
    if ponta_qtd == 0:
        porcen_ponta_lucratividade = 0
    else:
        porcen_ponta_lucratividade= ponta_qtd / ponta
    if bradesco_cons_qtd == 0:
        porcen_bradesco_cons_lucratividade = 0
    else:
        porcen_bradesco_cons_lucratividade = bradesco_cons_qtd / bradesco_cons
    if br_cons_qtd == 0 : 
        porcen_br_cons_lucratividade = 0
    else:
        porcen_br_cons_lucratividade = br_cons_qtd / br_cons
    if sicoob_cons_qtd == 0:
        porcen_sicoob_cons_lucratividade = 0
    else:
        porcen_sicoob_cons_lucratividade   = sicoob_cons_qtd / sicoob_cons
    if zema_cons_qtd == 0:
        porcen_zema_cons_lucratividade = 0
    else:
        porcen_zema_cons_lucratividade     = zema_cons_qtd / zema_cons
    if yamaha_cons_qtd == 0:
        porcen_yamaha_cons_lucratividade = 0
    else:
        porcen_yamaha_cons_lucratividade   = yamaha_cons_qtd / yamaha_cons
    if santander_cons_qtd == 0 :
        porcen_santander_cons_lucratividade = 0
    else:
        porcen_santander_cons_lucratividade = santander_cons_qtd / santander_cons

    # percenturais das formas de pagamento
    porcen_cdc           = total_cdc / realizado_modelo
    porcen_cons          = total_cons / realizado_modelo
    porcen_avista        = avista / realizado_modelo    
    porcen_cnh           = (cnh / realizado_modelo) + (cnh2 / realizado_modelo)
    porcen_cartao        = cartao / realizado_modelo
    porcen_cdcp          = cdcp / realizado_modelo
    porcen_bndes         = bndes / realizado_modelo
    porcen_bv            = bv / realizado_modelo
    porcen_bradesco      = bradesco / realizado_modelo
    porcen_banco_honda   = banco_honda / realizado_modelo
    porcen_brasil        = brasil / realizado_modelo
    porcen_ponta         = ponta / realizado_modelo
    porcen_bradesco_cons = bradesco_cons / realizado_modelo
    porcen_br_cons       = br_cons / realizado_modelo
    porcen_sicoob_cons   = sicoob_cons / realizado_modelo
    porcen_zema_cons     = zema_cons / realizado_modelo
    porcen_yamaha_cons   = yamaha_cons / realizado_modelo
    porcen_santander_cons = santander_cons / realizado_modelo

    # caapresentaçao será 0 até arrumar no sistema da vision
    #porcen_capresentacao = capresentacao / realizado_modelo
    porcen_capresentacao = 0

    lucratividade_dict = {
        'porcen_cdc_lucratividade' :"{:.2f}".format(porcen_cdc_lucratividade*100),
        'porcen_cons_lucratividade' :"{:.2f}".format(porcen_cons_lucratividade*100),
        'porcen_avista_lucratividade' :"{:.2f}".format(porcen_avista_lucratividade*100),
        'porcen_cnh_lucratividade' :"{:.2f}".format(porcen_cnh_lucratividade*100),
        'porcen_cartao_lucratividade' :"{:.2f}".format(porcen_cartao_lucratividade*100),
        'porcen_cdcp_lucratividade' :"{:.2f}".format(porcen_cdcp_lucratividade*100),
        'porcen_bndes_lucratividade' :"{:.2f}".format(porcen_bndes_lucratividade*100),
        'porcen_bv_lucratividade' :"{:.2f}".format(porcen_bv_lucratividade*100),
        'porcen_bradesco_lucratividade' :"{:.2f}".format(porcen_bradesco_lucratividade*100),
        'porcen_banco_honda_lucratividade' :"{:.2f}".format(porcen_banco_honda_lucratividade*100),
        'porcen_brasil_lucratividade' :"{:.2f}".format(porcen_brasil_lucratividade*100),
        'porcen_ponta_lucratividade' :"{:.2f}".format(porcen_ponta_lucratividade*100),
        'porcen_bradesco_cons_lucratividade' :"{:.2f}".format(porcen_bradesco_cons_lucratividade*100),
        'porcen_br_cons_lucratividade' :"{:.2f}".format(porcen_br_cons_lucratividade*100),
        'porcen_sicoob_cons_lucratividade' :"{:.2f}".format(porcen_sicoob_cons_lucratividade*100),
        'porcen_zema_cons_lucratividade' :"{:.2f}".format(porcen_zema_cons_lucratividade*100),
        'porcen_yamaha_cons_lucratividade' :"{:.2f}".format(porcen_yamaha_cons_lucratividade*100),
        'porcen_santander_cons_lucratividade' :"{:.2f}".format(porcen_santander_cons_lucratividade*100),
    }    

    context = {
        'regiao': cidade,
        'modelo': modelo,
        'avatar': avatar,
        'lucratividade_formas_pgto' : lucratividade_dict,
        'realizado_modelo': locale.currency(realizado_modelo, grouping=True, symbol=None),
        'realizado_total': locale.currency(realizado_total, grouping=True, symbol=None),
        'quantidade_total': quantidade_total,
        'quantidade_modelo': quantidade_modelo,
        'ticket_medio': locale.currency(ticket_medio, grouping=True, symbol=None),
        'participacao_realizado': "{:.2f}".format(participacao_realizado*100),
        'participacao_quantidade': "{:.2f}".format(participacao_quantidade*100),
        'margem': locale.currency(realizado_total, grouping=True, symbol=None),
        'margem_total_modelos': locale.currency(margem_total, grouping=True, symbol=None),
        'margem_unitario': locale.currency(margem_unitario, grouping=True, symbol=None),
        'participacao_margem': "{:.2f}".format(participacao_margem*100),
        'avista': locale.currency(avista, grouping=True, symbol=None),
        'total_formas_pagamento': locale.currency(total_formas_pagamento, grouping=True, symbol=None),
        'cdc_obj': dict_cdc,
        'cons_obj': dict_cons,
        'cdc': locale.currency(total_cdc, grouping=True, symbol=None),
        'cons': locale.currency(total_cons, grouping=True, symbol=None),
        'cnh': locale.currency(cnh + cnh2, grouping=True, symbol=None),        
        'cartao': locale.currency(cartao, grouping=True, symbol=None),
        'troca': locale.currency(troca, grouping=True, symbol=None),
        'cdcp': locale.currency(cdcp, grouping=True, symbol=None),
        'capresentacao': capresentacao,
        'porcen_cdc'           :  "{:.2f}".format(porcen_cdc*100),
        'porcen_cons'          :  "{:.2f}".format(porcen_cons*100),
        'porcen_avista'        :  "{:.2f}".format(porcen_avista*100),
        'porcen_cnh'           :  "{:.2f}".format(porcen_cnh*100),
        'porcen_bndes'         :  "{:.2f}".format(porcen_bndes*100),
        'porcen_cartao'        :  "{:.2f}".format(porcen_cartao*100),
        'porcen_cdcp'          :  "{:.2f}".format(porcen_cdcp*100),
        'porcen_capresentacao' :  "{:.2f}".format(porcen_capresentacao*100),
        'porcen_bndes'         : "{:.2f}".format(porcen_bndes*100),
        'porcen_bv'            : "{:.2f}".format(porcen_bv*100),
        'porcen_bradesco'      : "{:.2f}".format(porcen_bradesco*100),
        'porcen_banco_honda'   : "{:.2f}".format(porcen_banco_honda*100),
        'porcen_brasil'        : "{:.2f}".format(porcen_brasil*100),
        'porcen_ponta'         : "{:.2f}".format(porcen_ponta*100),
        'porcen_bradesco_cons' : "{:.2f}".format(porcen_bradesco_cons*100),
        'porcen_br_cons'       : "{:.2f}".format(porcen_br_cons*100),
        'porcen_sicoob_cons'   : "{:.2f}".format(porcen_sicoob_cons*100),
        'porcen_zema_con'      : "{:.2f}".format(porcen_zema_cons*100),
        'porcen_yamaha_cons'   : "{:.2f}".format(porcen_yamaha_cons*100),
        'porcen_santander_cons' : "{:.2f}".format(porcen_santander_cons*100),
        
    }

    return Response(context)


@api_view(['GET'])
def analitico(request,dia,mes,ano):
    modelos = request.GET.get('modelos')
    cidades = request.GET.get('cidades')
    vendedores = request.GET.get('vendedores')


    if modelos is not None:
        modelos = modelos.split(',')
    else:
        modelos = ''
    if cidades is not None:
        cidades = cidades.split(',')
    else:
        cidades = ''
    if vendedores is not None:
        vendedores = vendedores.split(',')
    else:
        vendedores = ''
    

    if modelos == '' and cidades == '':
        # PEGA TODAS AS CIDADES DA REGIAO PARA APLICAR NO PORRA_TOTAL E JOGAR NOS TOTTAIS QUANTIDADE E PORCENTAGEM
        vendedor_obj = Perfil.objects.get(cpf = vendedores[0])
        regiao = vendedor_obj.regiao
        cidades_regiao = list(Cidade.objects.filter(regiao = regiao))
        equipe = Equipe.objects.filter(cidade__in = cidades_regiao)
        list_equipe_regiao = []
        for i in equipe:
            list_equipe_regiao.append(i.perfil.cpf)
        porra = {
            'Vendedor_cpf__in' : vendedores, 
        }
        porra_total = {
            'Vendedor_cpf__in' : list_equipe_regiao,
        }
        QUERY = f'Vendedor_cpf__in = {vendedores}, '
        QUERY_TOTALIZADORES = f'Vendedor_cpf__in = {vendedores}'
    elif modelos == '' and vendedores == '':
        # PEGA TODAS AS CIDADES DA REGIAO PARA APLICAR NO PORRA_TOTAL E JOGAR NOS TOTTAIS QUANTIDADE E PORCENTAGEM
        cidade_obj = Cidade.objects.get(nome = cidades[0])
        regiao = cidade_obj.regiao
        cidades_regiao = list(Cidade.objects.filter(regiao = regiao))
        porra = {
            'Municipio__in' : cidades
        }
        porra_total = {
            'Municipio__in' : cidades_regiao ,
        }
        QUERY = f'Municipio__in = {cidades}'
        QUERY_TOTALIZADORES = f'Municipio__in = {cidades}'
    elif modelos == '':
        porra = {
            'Vendedor_cpf__in' : vendedores, 
            'Municipio__in' : cidades
        }
        porra_total = {
            'Municipio__in' : cidades,
            'Vendedor_cpf__in' : vendedores, 
        }
        QUERY = f'Vendedor_cpf__in = {vendedores}, Municipio__in = {cidades}'
        QUERY_TOTALIZADORES = f'Vendedor_cpf__in = {vendedores}, Municipio__in = {cidades}'
    elif cidades == '':
        porra = {
            'Vendedor_cpf__in' : vendedores, 
             'Veiculo__in' : modelos
        }
        porra_total = {
            'Vendedor_cpf__in' : vendedores, 
        }
        QUERY = f'Vendedor_cpf__in = {vendedores}, Veiculo__in = {modelos}'
        QUERY_TOTALIZADORES = f'Vendedor_cpf__in = {vendedores}'  
    elif cidades == '' and vendedores == '':
        porra = {
             'Veiculo__in' : modelos
        }
        porra_total = None
        QUERY = f'Veiculo__in = {modelos}'
        QUERY_TOTALIZADORES = f'NENHUM'
    elif vendedores == '':
        porra = {
            'Municipio__in' : cidades,
             'Veiculo__in' : modelos
        }
        porra_total = {
            'Municipio__in' : cidades,
        }
        QUERY = f'Veiculo__in = {modelos}, Municipio__in = {cidades}'
        QUERY_TOTALIZADORES = f'Municipio__in = {cidades}'
    else:
        porra = {
            'Municipio__in' : cidades,
            'Veiculo__in' : modelos,
            'Vendedor_cpf__in' : vendedores,  
        }
        porra_total = {
            'Municipio__in' : cidades,
            'Vendedor_cpf__in' : vendedores, 
        }
        QUERY = f'Veiculo__in = {modelos}, Municipio__in = {cidades}, Vendedor_cpf__in : {vendedores}',
        QUERY_TOTALIZADORES = f'Municipio__in = {cidades}, Vendedor_cpf__in : {vendedores}',

        


    # QUERY = f'Vendedor_cpf__in = {vendedores}, Modelo__in = {modelos}, Municipio__in = {cidades}'
    # QUERY_TOTALIZADORES = f'Vendedor_cpf__in = {vendedores}, Municipio__in = {cidades}'

    # realizado_modelo = Moto.objects.filter(**porra , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1')\
    #         .exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    

    result = executa(porra,porra_total,dia,mes,ano,modelos,cidades,vendedores)

    context = {
        'str': result,
    }
    return Response(result)

def executa(QUERY,QUERY_TOTALIZADORES,dia,mes,ano,modelos,cidades,vendedores):
        #QUERY_TOTALIZADORES = QUERY - MODELO

        list_vendedores = []
        for i in range(0, len(vendedores)):
            vendedor_obj = Perfil.objects.get(cpf = vendedores[i])
            list_vendedores.append(vendedor_obj.usuario.first_name)

        list_modelos = []
        for i in range(0, len(modelos)):
            list_modelos.append(modelos[i])

        list_cidades = []
        for i in range(0, len(cidades)):
            list_cidades.append(cidades[i])

        
        ultimo_dia_mes = calendar.monthrange(ano,mes)

        # REALIZADO
        realizado_modelo = Moto.objects.filter(**QUERY , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        if realizado_modelo is None: 
            return {'error', 'Nao existem vendas para este modelo até o dia pesquisado.'}
        
        realizado_total = Moto.objects.filter(**QUERY_TOTALIZADORES , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']

        quantidade_total  = Moto.objects.filter(**QUERY_TOTALIZADORES , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        quantidade_modelo = Moto.objects.filter(**QUERY , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']

        ticket_medio = realizado_modelo / quantidade_modelo

        participacao_realizado = float(realizado_modelo / realizado_total)
        participacao_quantidade = float(quantidade_modelo / quantidade_total)

        # estoque no dia 

        # margem
        margem_total = Moto.objects.filter(**QUERY_TOTALIZADORES , Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
        margem = Moto.objects.filter(**QUERY, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True).aggregate(Sum('Margem'))['Margem__sum']
        margem_unitario = margem / quantidade_modelo
        participacao_margem = margem / margem_total


        devolucoes_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'CARTEIRA LOJA', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        list_devolucao_chassi = [] 
        list_devolucao_vlnota = [] 
        for i in devolucoes_obj:
            print(i.Chassi.encode('ascii', 'ignore'))
            vlnota = i.Valor_da_Nota * -1
            list_devolucao_chassi.append(i.Chassi)
            list_devolucao_vlnota.append(vlnota)        
        list_exclude = []
        list_chassi = []
        #formas de pagamento 
        avista_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'RECEBER NA ENTREGA', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_avista = avista_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_avista_exclude = []
        if filtro_avista.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_avista:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_avista')

        bv_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BV', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_bv = bv_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_bv_exclude = []
        if filtro_bv.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_bv:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bv')

            ######################## BRADESCO              
        bradesco_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BRADESCO', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_bradesco = bradesco_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_bradesco_exclude = []
        if filtro_bradesco.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_bradesco:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco')

        ######################## BANCO HONDA  
        banco_honda_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BANCO HONDA', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_banco_honda = banco_honda_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_banco_honda_exclude = []
        if filtro_banco_honda.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_banco_honda:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Valor: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_banco_honda')
        
        
        cnh_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'CNH - SEM ALIENAÇaO', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_cnh = cnh_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_cnh_exclude = []
        if filtro_cnh.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_cnh:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} //Numero: {i.Nota_Fiscal} // Modalidade: filtro_cnh')
        
        cnh2_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'CNH - COM ALIENAÇaO', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_cnh2 = cnh2_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_cnh2_exclude = []
        if filtro_cnh2.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_cnh2:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Nota_Fiscal} /// {i.Chassi} // Numero: {i.Valor_da_Nota} // Modalidade: filtro_cnh2')
        
        bndes_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BANCO BNDES', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_bndes = bndes_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_bndes_exclude = []
        if filtro_bndes.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_bndes:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bndes')
        
        ############# BANCO DO BRASIL 
        brasil_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BANCO DO BRASIL', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_brasil = brasil_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_brasil_exclude = []
        if filtro_brasil.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_brasil:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_brasil')

        cartao_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'CARTaO', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_cartao = cartao_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_cartao_exclude = []
        if filtro_cartao.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_cartao:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cartao')

        troca_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'MOTO USADA', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_troca = troca_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_troca_exclude = []
        if filtro_troca.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_troca:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_troca')

        cdcp_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica__in = ['James CDCP Sem alienaçao', 'JAMES CDCP'], Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_cdcp = cdcp_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        list_troca_exclude = []
        if filtro_cdcp.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_cdcp:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_cdcp')

        ######################### PONTA CONSORCIO
        ponta_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica__in = ['PONTA CONSÓRCIOS'], Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_ponta = ponta_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_ponta_exclude = []
        if filtro_ponta.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_ponta:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_ponta')

        ######################### BRADESCO CONSORCIOS
        bradesco_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BRADESCO CONSÓRCIOS', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_bradesco_cons = bradesco_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_bradesco_cons_exclude = []
        if filtro_bradesco_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_bradesco_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_bradesco_cons')
        ######################### BR CONSORCIOS
        br_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'BR CONSORCIOS', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_br_cons = br_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_br_cons_exclude = []
        if filtro_br_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_br_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_br_cons')

        ######################### SICOOB CREDIVAG
        sicoob_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'SICOOB CREDIVAG', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_sicoob_cons = sicoob_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_sicoob_cons_exclude = []
        if filtro_sicoob_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_sicoob_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_sicoob_cons')
        ######################### CONSORCIO ZEMA
        zema_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'CONSORCIO ZEMA', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_zema_cons = zema_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_zema_cons_exclude = []
        if filtro_zema_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_zema_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_zema_cons')
        ######################### RODOBENS
        rodobens_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'RODOBENS', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_rodobens_cons = rodobens_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_rodobens_cons_exclude = []
        if filtro_rodobens_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_rodobens_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_rodobens_cons')
        ######################### YAMAHA ADMINISTRADORA
        yamaha_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'YAMAHA ADMINISTRADORA', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_yamaha_cons = yamaha_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_yamaha_cons_exclude = []
        if filtro_yamaha_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_yamaha_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_yamaha_cons')
        ######################### SANTANDER
        santander_cons_obj = Moto.objects.filter(**QUERY, Sub_Forma_Fabrica = 'SANTANDER', Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').exclude(Cancelada = True)
        filtro_santander_cons = santander_cons_obj.filter(**QUERY, Chassi__in = list_devolucao_chassi, Valor_da_Nota__in=list_devolucao_vlnota).distinct('Chassi')
        filtro_santander_cons_exclude = []
        if filtro_santander_cons.count() == 0:
            print('Nao tem notas de cancelamento')
        else:
            for i in filtro_santander_cons:
                if i.Chassi not in list_chassi:
                    list_exclude.append(i.Nota_Fiscal)
                    list_chassi.append(i.Chassi)
                else:
                    (f'Nota {i.Nota_Fiscal} ja existe na lista.. Nao será adicionada')
                print(f'Nota: {i.Valor_da_Nota} /// {i.Chassi} // Numero: {i.Nota_Fiscal} // Modalidade: filtro_santander_cons')

        capresentacao = 'indefinido'
        ###################### CDC
        bradesco_obj = bradesco_obj.exclude(Nota_Fiscal__in = list_exclude)  
        bradesco = bradesco_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        bradesco_qtd = bradesco_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        bndes_obj = bndes_obj.exclude(Nota_Fiscal__in = list_exclude)  
        bndes = bndes_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        bndes_qtd = bndes_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        bv_obj = bv_obj.exclude(Nota_Fiscal__in = list_exclude)  
        bv = bv_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        bv_qtd = bv_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        banco_honda_obj = banco_honda_obj.exclude(Nota_Fiscal__in = list_exclude)  
        banco_honda = banco_honda_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        banco_honda_qtd = banco_honda_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        brasil_obj = brasil_obj.exclude(Nota_Fiscal__in = list_exclude)  
        brasil = brasil_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        brasil_qtd = brasil_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        ################ OUTROS 
        cnh_obj = cnh_obj.exclude(Nota_Fiscal__in = list_exclude)  
        cnh = cnh_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        cnh_qtd = cnh_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        cnh2_obj = cnh2_obj.exclude(Nota_Fiscal__in = list_exclude)
        cnh2 = cnh2_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        cnh2_qtd = cnh2_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        cartao_obj = cartao_obj.exclude(Nota_Fiscal__in = list_exclude)  
        cartao = cartao_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        cartao_qtd = cartao_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        avista_obj = avista_obj.exclude(Nota_Fiscal__in = list_exclude)    
        avista = avista_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum'] 
        avista_qtd = avista_obj.aggregate(Sum('Margem'))['Margem__sum'] 
        troca_obj = troca_obj.exclude(Nota_Fiscal__in = list_exclude)  
        troca = troca_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        troca_qtd = troca_obj.aggregate(Sum('Margem'))['Margem__sum']
        cdcp_obj = cdcp_obj.exclude(Nota_Fiscal__in = list_exclude)  
        cdcp = cdcp_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        cdcp_qtd = cdcp_obj.aggregate(Sum('Margem'))['Margem__sum']
        ################### CONSORCIOS 
        ponta_obj = ponta_obj.exclude(Nota_Fiscal__in = list_exclude)  
        ponta = ponta_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        ponta_qtd = ponta_obj.aggregate(Sum('Margem'))['Margem__sum']
        br_cons_obj = br_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        br_cons = br_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        br_cons_qtd = br_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
        bradesco_cons_obj = bradesco_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        bradesco_cons = bradesco_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        bradesco_cons_qtd = bradesco_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
        sicoob_cons_obj = sicoob_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        sicoob_cons = sicoob_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        sicoob_cons_qtd = sicoob_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
        zema_cons_obj = zema_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        zema_cons = zema_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        zema_cons_qtd = zema_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
        rodobens_cons_obj = rodobens_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        rodobens_cons = rodobens_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        rodobens_cons_qtd = rodobens_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
        yamaha_cons_obj = yamaha_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        yamaha_cons = yamaha_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        yamaha_cons_qtd = yamaha_cons_obj.aggregate(Sum('Margem'))['Margem__sum']
        santander_cons_obj = santander_cons_obj.exclude(Nota_Fiscal__in = list_exclude)  
        santander_cons = santander_cons_obj.aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
        santander_cons_qtd = santander_cons_obj.aggregate(Sum('Margem'))['Margem__sum']

        #def check_vl_forma_isNone():
        if avista is None:
            avista = 0
        if cnh2 is None:
            cnh2 = 0
        if cnh is None:
            cnh = 0
        if cartao is None:
            cartao = 0
        if troca is None:
            troca = 0
        if cdcp is None:
            cdcp = 0
        if bradesco is None:
            bradesco = 0
        if bndes is None:
            bndes = 0
        if bv is None:
            bv = 0
        if banco_honda is None:
            banco_honda = 0
        if brasil is None:
            brasil = 0
        if ponta is None:
            ponta = 0
        if br_cons is None:
            br_cons = 0
        if bradesco_cons is None:
            bradesco_cons = 0
        if sicoob_cons is None:
            sicoob_cons = 0
        if zema_cons is None:
            zema_cons = 0
        if rodobens_cons is None:
            rodobens_cons = 0
        if yamaha_cons is None:
            yamaha_cons = 0
        if santander_cons is None:
            santander_cons = 0



        #def check_qtd_formas_isNone():
        if avista_qtd is None:
            avista_qtd = 0
        if cnh2_qtd is None:
            cnh2_qtd = 0
        if cnh_qtd is None:
            cnh_qtd = 0
        if cartao_qtd is None:
            cartao_qtd = 0
        if troca_qtd is None:
            troca_qtd = 0
        if cdcp_qtd is None:
            cdcp_qtd = 0
        if bradesco_qtd is None:
            bradesco_qtd = 0
        if bndes_qtd is None:
            bndes_qtd = 0
        if bv_qtd is None:
            bv_qtd = 0
        if banco_honda_qtd is None:
            banco_honda_qtd = 0
        if brasil_qtd is None:
            brasil_qtd = 0
        if ponta_qtd is None:
            ponta_qtd = 0
        if br_cons_qtd is None:
            br_cons_qtd = 0
        if bradesco_cons_qtd is None:
            bradesco_cons_qtd = 0
        if sicoob_cons_qtd is None:
            sicoob_cons_qtd = 0
        if zema_cons_qtd is None:
            zema_cons_qtd = 0
        if rodobens_cons_qtd is None:
            rodobens_cons_qtd = 0
        if yamaha_cons_qtd is None:
            yamaha_cons_qtd = 0
        if santander_cons_qtd is None:
            santander_cons_qtd = 0


        locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')

        dict_cdc = {
            'BNDES' : locale.currency(bndes, grouping=True, symbol=None),
            'BV' : locale.currency(bv, grouping=True, symbol=None),
            'BRADESCO' : locale.currency(bradesco, grouping=True, symbol=None),
            'BANCO HONDA' : locale.currency(banco_honda, grouping=True, symbol=None),
            'BANCO DO BRASIL' : locale.currency(brasil, grouping=True, symbol=None),
        }

        dict_cons = {
            'PONTA CONS' : locale.currency(ponta, grouping=True, symbol=None),
            'BRADESCO CONS' : locale.currency(bradesco_cons, grouping=True, symbol=None),
            'BR' : locale.currency(br_cons, grouping=True, symbol=None),
            'SICOOB' : locale.currency(sicoob_cons, grouping=True, symbol=None),
            'ZEMA' : locale.currency(zema_cons, grouping=True, symbol=None),
            'YAMAHA' : locale.currency(yamaha_cons, grouping=True, symbol=None),
            'SANTANDER' : locale.currency(santander_cons, grouping=True, symbol=None),
        }

        total_cons = ponta + bradesco_cons + bradesco_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons
        total_cons_qtd = ponta_qtd + bradesco_cons_qtd + bradesco_cons_qtd + sicoob_cons_qtd + zema_cons_qtd + yamaha_cons_qtd + santander_cons_qtd

        total_cdc = bndes + bv + bradesco + banco_honda + brasil
        total_cdc_qtd = bndes_qtd + bv_qtd + bradesco_qtd + banco_honda_qtd + brasil_qtd

        total_cnh_qtd = cnh2_qtd + cnh_qtd
        total_cnh = cnh + cnh2

        total_formas_pagamento = avista + cnh + cnh2 + cartao + troca + bndes + bv + bradesco + banco_honda + brasil + ponta + bradesco_cons + br_cons + sicoob_cons + zema_cons + yamaha_cons + santander_cons

        if total_cdc_qtd == 0:
            porcen_cdc_lucratividade = 0
        else:        
            porcen_cdc_lucratividade = total_cdc_qtd / total_cdc 
        if total_cons_qtd == 0:
            porcen_cons_lucratividade = 0
        else:
            porcen_cons_lucratividade= total_cons_qtd / total_cons
        if avista_qtd == 0:
            porcen_avista_lucratividade = 0
        else:
            porcen_avista_lucratividade= avista_qtd / avista
        if total_cnh_qtd == 0 :
            porcen_cnh_lucratividade = 0
        else:
            porcen_cnh_lucratividade = total_cnh_qtd / total_cnh
        if cartao_qtd == 0:
            porcen_cartao_lucratividade = 0
        else:
            porcen_cartao_lucratividade = cartao_qtd / cartao
        if cdcp_qtd == 0:
            porcen_cdcp_lucratividade = 0
        else:
            porcen_cdcp_lucratividade= cdcp_qtd / cdcp
        if bndes_qtd == 0:
            porcen_bndes_lucratividade = 0
        else:
            porcen_bndes_lucratividade= bndes_qtd / bndes
        if bv_qtd == 0:
            porcen_bv_lucratividade = 0
        else:
            porcen_bv_lucratividade = bv_qtd / bv
        if bradesco_qtd == 0:
            porcen_bradesco_lucratividade = 0
        else:
            porcen_bradesco_lucratividade=bradesco_qtd / bradesco
        if banco_honda_qtd == 0:
            porcen_banco_honda_lucratividade = 0
        else:
            porcen_banco_honda_lucratividade= banco_honda_qtd / banco_honda
        if brasil_qtd == 0:
            porcen_brasil_lucratividade = 0
        else:
            porcen_brasil_lucratividade= brasil_qtd / brasil
        if ponta_qtd == 0:
            porcen_ponta_lucratividade = 0
        else:
            porcen_ponta_lucratividade= ponta_qtd / ponta
        if bradesco_cons_qtd == 0:
            porcen_bradesco_cons_lucratividade = 0
        else:
            porcen_bradesco_cons_lucratividade = bradesco_cons_qtd / bradesco_cons
        if br_cons_qtd == 0 : 
            porcen_br_cons_lucratividade = 0
        else:
            porcen_br_cons_lucratividade = br_cons_qtd / br_cons
        if sicoob_cons_qtd == 0:
            porcen_sicoob_cons_lucratividade = 0
        else:
            porcen_sicoob_cons_lucratividade   = sicoob_cons_qtd / sicoob_cons
        if zema_cons_qtd == 0:
            porcen_zema_cons_lucratividade = 0
        else:
            porcen_zema_cons_lucratividade     = zema_cons_qtd / zema_cons
        if yamaha_cons_qtd == 0:
            porcen_yamaha_cons_lucratividade = 0
        else:
            porcen_yamaha_cons_lucratividade   = yamaha_cons_qtd / yamaha_cons
        if santander_cons_qtd == 0 :
            porcen_santander_cons_lucratividade = 0
        else:
            porcen_santander_cons_lucratividade = santander_cons_qtd / santander_cons

        # percenturais das formas de pagamento
        porcen_cdc           = total_cdc / realizado_modelo
        porcen_cons          = total_cons / realizado_modelo
        porcen_avista        = avista / realizado_modelo    
        porcen_cnh           = (cnh / realizado_modelo) + (cnh2 / realizado_modelo)
        porcen_cartao        = cartao / realizado_modelo
        porcen_cdcp          = cdcp / realizado_modelo
        porcen_bndes         = bndes / realizado_modelo
        porcen_bv            = bv / realizado_modelo
        porcen_bradesco      = bradesco / realizado_modelo
        porcen_banco_honda   = banco_honda / realizado_modelo
        porcen_brasil        = brasil / realizado_modelo
        porcen_ponta         = ponta / realizado_modelo
        porcen_bradesco_cons = bradesco_cons / realizado_modelo
        porcen_br_cons       = br_cons / realizado_modelo
        porcen_sicoob_cons   = sicoob_cons / realizado_modelo
        porcen_zema_cons     = zema_cons / realizado_modelo
        porcen_yamaha_cons   = yamaha_cons / realizado_modelo
        porcen_santander_cons = santander_cons / realizado_modelo

        # caapresentaçao será 0 até arrumar no sistema da vision
        #porcen_capresentacao = capresentacao / realizado_modelo
        porcen_capresentacao = 0

        lucratividade_dict = {
            'porcen_cdc_lucratividade' :"{:.2f}".format(porcen_cdc_lucratividade*100),
            'porcen_cons_lucratividade' :"{:.2f}".format(porcen_cons_lucratividade*100),
            'porcen_avista_lucratividade' :"{:.2f}".format(porcen_avista_lucratividade*100),
            'porcen_cnh_lucratividade' :"{:.2f}".format(porcen_cnh_lucratividade*100),
            'porcen_cartao_lucratividade' :"{:.2f}".format(porcen_cartao_lucratividade*100),
            'porcen_cdcp_lucratividade' :"{:.2f}".format(porcen_cdcp_lucratividade*100),
            'porcen_bndes_lucratividade' :"{:.2f}".format(porcen_bndes_lucratividade*100),
            'porcen_bv_lucratividade' :"{:.2f}".format(porcen_bv_lucratividade*100),
            'porcen_bradesco_lucratividade' :"{:.2f}".format(porcen_bradesco_lucratividade*100),
            'porcen_banco_honda_lucratividade' :"{:.2f}".format(porcen_banco_honda_lucratividade*100),
            'porcen_brasil_lucratividade' :"{:.2f}".format(porcen_brasil_lucratividade*100),
            'porcen_ponta_lucratividade' :"{:.2f}".format(porcen_ponta_lucratividade*100),
            'porcen_bradesco_cons_lucratividade' :"{:.2f}".format(porcen_bradesco_cons_lucratividade*100),
            'porcen_br_cons_lucratividade' :"{:.2f}".format(porcen_br_cons_lucratividade*100),
            'porcen_sicoob_cons_lucratividade' :"{:.2f}".format(porcen_sicoob_cons_lucratividade*100),
            'porcen_zema_cons_lucratividade' :"{:.2f}".format(porcen_zema_cons_lucratividade*100),
            'porcen_yamaha_cons_lucratividade' :"{:.2f}".format(porcen_yamaha_cons_lucratividade*100),
            'porcen_santander_cons_lucratividade' :"{:.2f}".format(porcen_santander_cons_lucratividade*100),
        }    

        context = {
            'vendedores' : list_vendedores,
            'cidades' : list_cidades,
            'modelos' : list_modelos,
            'lucratividade_formas_pgto' : lucratividade_dict,
            'realizado_modelo': locale.currency(realizado_modelo, grouping=True, symbol=None),
            'realizado_total': locale.currency(realizado_total, grouping=True, symbol=None),
            'quantidade_total': quantidade_total,
            'quantidade_modelo': quantidade_modelo,
            'ticket_medio': locale.currency(ticket_medio, grouping=True, symbol=None),
            'participacao_realizado': "{:.2f}".format(participacao_realizado*100),
            'participacao_quantidade': "{:.2f}".format(participacao_quantidade*100),
            'margem': locale.currency(realizado_total, grouping=True, symbol=None),
            'margem_total_modelos': locale.currency(margem_total, grouping=True, symbol=None),
            'margem_unitario': locale.currency(margem_unitario, grouping=True, symbol=None),
            'participacao_margem': "{:.2f}".format(participacao_margem*100),
            'avista': locale.currency(avista, grouping=True, symbol=None),
            'total_formas_pagamento': locale.currency(total_formas_pagamento, grouping=True, symbol=None),
            'cdc_obj': dict_cdc,
            'cons_obj': dict_cons,
            'cdc': locale.currency(total_cdc, grouping=True, symbol=None),
            'cons': locale.currency(total_cons, grouping=True, symbol=None),
            'cnh': locale.currency(cnh + cnh2, grouping=True, symbol=None),        
            'cartao': locale.currency(cartao, grouping=True, symbol=None),
            'troca': locale.currency(troca, grouping=True, symbol=None),
            'cdcp': locale.currency(cdcp, grouping=True, symbol=None),
            'capresentacao': capresentacao,
            'porcen_cdc'           :  "{:.2f}".format(porcen_cdc*100),
            'porcen_cons'          :  "{:.2f}".format(porcen_cons*100),
            'porcen_avista'        :  "{:.2f}".format(porcen_avista*100),
            'porcen_cnh'           :  "{:.2f}".format(porcen_cnh*100),
            'porcen_bndes'         :  "{:.2f}".format(porcen_bndes*100),
            'porcen_cartao'        :  "{:.2f}".format(porcen_cartao*100),
            'porcen_cdcp'          :  "{:.2f}".format(porcen_cdcp*100),
            'porcen_capresentacao' :  "{:.2f}".format(porcen_capresentacao*100),
            'porcen_bndes'         : "{:.2f}".format(porcen_bndes*100),
            'porcen_bv'            : "{:.2f}".format(porcen_bv*100),
            'porcen_bradesco'      : "{:.2f}".format(porcen_bradesco*100),
            'porcen_banco_honda'   : "{:.2f}".format(porcen_banco_honda*100),
            'porcen_brasil'        : "{:.2f}".format(porcen_brasil*100),
            'porcen_ponta'         : "{:.2f}".format(porcen_ponta*100),
            'porcen_bradesco_cons' : "{:.2f}".format(porcen_bradesco_cons*100),
            'porcen_br_cons'       : "{:.2f}".format(porcen_br_cons*100),
            'porcen_sicoob_cons'   : "{:.2f}".format(porcen_sicoob_cons*100),
            'porcen_zema_con'      : "{:.2f}".format(porcen_zema_cons*100),
            'porcen_yamaha_cons'   : "{:.2f}".format(porcen_yamaha_cons*100),
            'porcen_santander_cons' : "{:.2f}".format(porcen_santander_cons*100),
            
        }

        return context


@api_view(['GET'])
@permission_classes([AllowAny])
def sazonalidade(request):

    ano_base = 2019

    def cidade(ano):
        obj_cidade = Cidade.objects.all()
        realizado_cidade_dict = dict()
        realizado_cidade_mes_dict = dict()
        total_dict = dict()
        for x in obj_cidade:

            realizado_cidade_ano = Moto.objects.filter(Municipio = x.nome, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
            if realizado_cidade_ano is None:
                realizado_cidade_ano = 0

            realizado_cidade_mes_dict['anual'] = realizado_cidade_ano

            for mes in range(1,13):
                instancia = SazonalidadeCidade()
                instancia.cidade = x
                instancia.ano_base = ano
                instancia.vl_total_anual = realizado_cidade_ano
                ultimo_dia_mes = calendar.monthrange(ano,mes)
                instancia.mes = mes
                realizado_cidade_mes = Moto.objects.filter(Municipio = x.nome, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                if realizado_cidade_mes is None or realizado_cidade_mes < 0:
                    porcentagem_mes = 0
                    realizado_cidade_mes_dict[mes] = 0

                    instancia.percentual = 0
                else:
                    #porcentagem_mes = realizado_cidade_mes / realizado_cidade_ano     
                    porcentagem_mes = (realizado_cidade_mes / realizado_cidade_ano) * 100                               
                    realizado_cidade_mes_dict[mes] = float(format(porcentagem_mes, '.2f'))
                    realizado_cidade_dict[x.nome] = realizado_cidade_mes_dict

                    instancia.percentual = float(format(porcentagem_mes, '.2f'))
                #instancia.save()
            realizado_cidade_mes_dict = {}
        return realizado_cidade_dict            

    def vendedor(ano):
        obj_vendedor = Moto.objects.distinct('Vendedor_cpf').exclude(Vendedor = 'VENDEDOR SEM NOME')
        realizado_vendedor_dict = dict()
        realizado_vendedor_mes_dict = dict()
        total_dict = dict()
        for x in obj_vendedor:
            realizado_vendedor_ano = Moto.objects.filter(Vendedor_cpf = x.Vendedor_cpf, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
            if realizado_vendedor_ano is None:
                realizado_vendedor_ano = 0

            realizado_vendedor_mes_dict['anual'] = realizado_vendedor_ano
            
            for mes in range(1,13):
                instancia = SazonalidadeVendedor()
                instancia.vendedor_nome = x.Vendedor
                instancia.vendedor_cpf = x.Vendedor_cpf
                instancia.ano_base = ano
                instancia.vl_total_anual = realizado_vendedor_ano
                ultimo_dia_mes = calendar.monthrange(ano,mes)
                instancia.mes = mes
                realizado_cidade_mes = Moto.objects.filter(Vendedor_cpf = x.Vendedor_cpf, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                if realizado_cidade_mes is None or realizado_cidade_mes < 0:
                    porcentagem_mes = 0
                    realizado_vendedor_mes_dict[mes] = 0

                    instancia.percentual = 0
                else:
                    #porcentagem_mes = realizado_cidade_mes / realizado_vendedor_ano     
                    porcentagem_mes = (realizado_cidade_mes / realizado_vendedor_ano) * 100                               
                    realizado_vendedor_mes_dict[mes] = float(format(porcentagem_mes, '.2f'))
                    realizado_vendedor_dict[x.Vendedor] = realizado_vendedor_mes_dict

                    instancia.percentual = float(format(porcentagem_mes, '.2f'))
        
                #instancia.save()            
            realizado_vendedor_mes_dict = {}
        return realizado_vendedor_dict

    def regiao(ano):
        obj_regiao = Cidade.objects.distinct('regiao')
        realizado_regiao_dict = dict()
        realizado_regiao_mes_dict = dict()
        total_dict = dict()
        for x in obj_regiao:
            list_cidades_regiao = list(Cidade.objects.filter(regiao = x.regiao))
            realizado_regiao_ano = Moto.objects.filter(Municipio__in = list_cidades_regiao, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
            if realizado_regiao_ano is None:
                realizado_regiao_ano = 0

            realizado_regiao_mes_dict['anual'] = realizado_regiao_ano
            
            for mes in range(1,13):
                instancia = SazonalidadeRegiao()
                instancia.regiao = x.regiao  
                instancia.ano_base = ano
                instancia.vl_total_anual = realizado_regiao_ano
                ultimo_dia_mes = calendar.monthrange(ano,mes)
                instancia.mes = mes
                realizado_cidade_mes = Moto.objects.filter(Municipio__in = list_cidades_regiao, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                if realizado_cidade_mes is None or realizado_cidade_mes < 0:
                    porcentagem_mes = 0
                    realizado_regiao_mes_dict[mes] = 0
                    instancia.percentual = 0
                else:
                    #porcentagem_mes = realizado_cidade_mes / realizado_regiao_ano     
                    porcentagem_mes = (realizado_cidade_mes / realizado_regiao_ano) * 100                               
                    realizado_regiao_mes_dict[mes] = float(format(porcentagem_mes, '.2f'))
                    realizado_regiao_dict[x.regiao] = realizado_regiao_mes_dict

                    instancia.percentual = float(format(porcentagem_mes, '.2f'))
        
                #instancia.save()            
            realizado_regiao_mes_dict = {}
        return realizado_regiao_dict

    def modelo(ano):
        obj_modelo = MotoPerfil.objects.distinct('nome')
        realizado_modelo_dict = dict()
        realizado_modelo_mes_dict = dict()
        total_dict = dict()
        for x in obj_modelo:
            realizado_regiao_ano = Moto.objects.filter(Veiculo = x.nome, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
            if realizado_regiao_ano is None:
                realizado_regiao_ano = 0

            realizado_modelo_mes_dict['anual'] = realizado_regiao_ano
            
            for mes in range(1,13):
                instancia = SazonalidadeRegiao()
                instancia.modelo = x
                instancia.ano_base = ano
                instancia.vl_total_anual = realizado_regiao_ano
                ultimo_dia_mes = calendar.monthrange(ano,mes)
                instancia.mes = mes
                realizado_cidade_mes = Moto.objects.filter(Veiculo = x.nome, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
                if realizado_cidade_mes is None or realizado_cidade_mes < 0 or realizado_regiao_ano == 0:
                    porcentagem_mes = 0
                    realizado_modelo_mes_dict[mes] = 0
                    instancia.percentual = 0
                else:
                    #porcentagem_mes = realizado_cidade_mes / realizado_regiao_ano     
                    porcentagem_mes = (realizado_cidade_mes / realizado_regiao_ano) * 100                               
                    realizado_modelo_mes_dict[mes] = float(format(porcentagem_mes, '.2f'))
                    realizado_modelo_dict[x.nome] = realizado_modelo_mes_dict

                    instancia.percentual = float(format(porcentagem_mes, '.2f'))
        
                #instancia.save()            
            realizado_modelo_mes_dict = {}
        return realizado_modelo_dict


    
    vendedor = vendedor(ano_base)
    cidade = cidade(ano_base)
    regiao = regiao(ano_base)
    modelo = modelo(ano_base)
    context = {
        'vendedor' : vendedor,
        'cidade' : cidade,
        'regiao' : regiao,
        'modelo' : modelo,
    }
    return Response(context)

@api_view(['GET'])
@permission_classes([AllowAny])
def sazonalidade_regiao(request,regiao):

    ano = 2019
    realizado_regiao_dict = dict()
    realizado_regiao_mes_dict = dict()
    total_dict = dict()
    lista = []

    list_cidades_regiao = list(Cidade.objects.filter(regiao = regiao))
    realizado_regiao_ano = Moto.objects.filter(Municipio__in = list_cidades_regiao, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    
    if realizado_regiao_ano is None:
        realizado_regiao_ano = 0

    realizado_regiao_mes_dict['anual'] = realizado_regiao_ano
    
    for mes in range(1,13):            
        ultimo_dia_mes = calendar.monthrange(ano,mes)
        realizado_cidade_mes = Moto.objects.filter(Municipio__in = list_cidades_regiao, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        if realizado_cidade_mes is None or realizado_cidade_mes < 0:
            porcentagem_mes = 0
            realizado_regiao_mes_dict[mes] = 0
            lista.append(0)
        else:
            #porcentagem_mes = realizado_cidade_mes / realizado_regiao_ano     
            porcentagem_mes = (realizado_cidade_mes / realizado_regiao_ano) * 100                               
            realizado_regiao_mes_dict[mes] = float(format(porcentagem_mes, '.2f'))
            realizado_regiao_dict[regiao] = realizado_regiao_mes_dict
            lista.append(float(format(porcentagem_mes, '.2f')))
    
    context = {
        'lista' : lista,
        'anual' : realizado_regiao_ano
    }

    return Response(context)


@api_view(['GET'])
@permission_classes([AllowAny])
def sazonalidade_modelo(request,modelo):

    ano = 2019

    lista = []
    realizado_regiao_ano = Moto.objects.filter(Veiculo = modelo, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    if realizado_regiao_ano is None:
        realizado_regiao_ano = 0
    
    for mes in range(1,13):
        ultimo_dia_mes = calendar.monthrange(ano,mes)
        realizado_cidade_mes = Moto.objects.filter(Veiculo = modelo, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        if realizado_cidade_mes is None or realizado_cidade_mes < 0 or realizado_regiao_ano == 0:
            porcentagem_mes = 0
            lista.append(0)

        else:   
            porcentagem_mes = (realizado_cidade_mes / realizado_regiao_ano) * 100                               
            lista.append(float(format(porcentagem_mes, '.2f')))


    context = {
        'lista' : lista,
        'anual' : realizado_regiao_ano
    }        

    return Response(context)


@api_view(['GET'])
@permission_classes([AllowAny])
def sazonalidade_cidade(request,cidade):
    ano = 2019
    
    lista = []
    realizado_regiao_ano = Moto.objects.filter(Municipio = cidade, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    if realizado_regiao_ano is None:
        realizado_regiao_ano = 0
    
    for mes in range(1,13):
        ultimo_dia_mes = calendar.monthrange(ano,mes)
        realizado_cidade_mes = Moto.objects.filter(Municipio = cidade, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        if realizado_cidade_mes is None or realizado_cidade_mes < 0 or realizado_regiao_ano == 0:
            porcentagem_mes = 0
            lista.append(0)

        else:   
            porcentagem_mes = (realizado_cidade_mes / realizado_regiao_ano) * 100                               
            lista.append(float(format(porcentagem_mes, '.2f')))


    context = {
        'lista' : lista,
        'anual' : realizado_regiao_ano
    }    
    return Response(context)


@api_view(['GET'])
@permission_classes([AllowAny])
def sazonalidade_vendedor(request,vendedor):
    ano = 2019    
    lista = []
    realizado_regiao_ano = Moto.objects.filter(Vendedor = vendedor, Data__gte = f'{ano}-1-1', Data__lte=f'{ano}-12-31').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
    if realizado_regiao_ano is None:
        realizado_regiao_ano = 0
    
    for mes in range(1,13):
        ultimo_dia_mes = calendar.monthrange(ano,mes)
        realizado_cidade_mes = Moto.objects.filter(Vendedor = vendedor, Data__gte = f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').exclude(Cancelada = True).aggregate(Sum('Quantidade'))['Quantidade__sum']
        if realizado_cidade_mes is None or realizado_cidade_mes < 0 or realizado_regiao_ano == 0:
            porcentagem_mes = 0
            lista.append(0)

        else:   
            porcentagem_mes = (realizado_cidade_mes / realizado_regiao_ano) * 100                               
            lista.append(float(format(porcentagem_mes, '.2f')))


    context = {
        'lista' : lista,
        'anual' : realizado_regiao_ano
    }    
    return Response(context)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def user_detail(request):
    user = User.objects.get(username = request.user)
    perfil = Perfil.objects.get(usuario = user)

    context = {
        'id': user.id,
        'username': user.username,
        'regiao': perfil.regiao,
        'cargo': perfil.cargo,
        'avatar': perfil.avatar.url,
    }
    return Response(context)

@api_view(['POST'])
@permission_classes([AllowAny])
def new_user(request):
    
    data = json.loads(request.body.decode('utf-8'))
    print(data)
    list_cidade = []
    for x in data['cidade']:
        list_cidade.append(x)
        
    print(list_cidade)
    #checa se já tem cadastro
    try:
        Perfil.objects.get(cpf = data['cpf'])
    except Perfil.DoesNotExist:
        cria_user = User()
        cria_user.username = data['cpf']
        cria_user.first_name = data['nome']
        cria_user.save()
        print('salvou usuario')


        obj_user = User.objects.get(username=data['cpf'])
        ### fazendo perfil
        perfil = Perfil()
        perfil.cargo = data['cargo']
        perfil.usuario = obj_user
        perfil.regiao = data['regiao']
        perfil.cpf = data['cpf']
        perfil.avatar = 'https://pbs.twimg.com/profile_images/444875479/logo_James_Motoshop_img.jpg'
        perfil.save()
        print('salvou perfil')

        for i in list_cidade:
            equipe = Equipe()
            equipe.user = obj_user
            equipe.perfil = Perfil.objects.get(cpf = data['cpf'])
            equipe.cidade = Cidade.objects.get(nome = i)
            equipe.save()

        return Response('USUARIO CRIADO COM SUCESSO!')        
    else:
        return HttpResponse('Unauthorized', status=401)
        