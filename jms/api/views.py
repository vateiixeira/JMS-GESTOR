from django.shortcuts import render
from rest_framework import viewsets
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from jms.core.models import Moto,Cota,Equipe,Cidade,MetaMotoCidade,MetaCotaCidade,TotalMensalMoto2019
from jms.core.utils import get_mes_ano
from django.db.models import Sum
from rest_framework.decorators import api_view
from .serializers import *
from django.contrib.auth.models import User
from jms.account.models import Perfil
import calendar

@api_view(['GET'])
def desempenhoCidade(request, cidade):
    #mes,ano = get_mes_ano()
    ano = 2019
    mes = 3
    dia = 29

    cidade_obj = Cidade.objects.get(nome = cidade)

    # COLOCA VENDEDORES CADASTRADOS DA CIDADE NUMA LISTA
    query_equipe = Equipe.objects.filter(cidade = cidade_obj)
    equipe_list = []
    count = 0    
    vendedor_dict = {}
    for i in query_equipe:
        equipe_list.append(i.user.first_name)
        moto = Moto.objects.filter(Vendedor = i.user.first_name, Municipio = cidade, Data=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Nome_Vendedor = i.user.username, Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        visita = 152
        new_dict_indi = {
            'nome' : i.user.first_name,
            'avatar' : i.perfil.avatar.url,
            'moto' : moto,
            'cota' : cota,
            'visita' : visita,
        }
        vendedor_dict[count] = new_dict_indi
        count = count + 1

    # VENDEDORES QUE NAO FAZEM PARTE DA EQUIPE E FATURARAM MOTO NA CIDADE ESPECIFICA
    query_forest = Moto.objects.filter(Municipio = cidade,Data=f'{ano}-{mes}-{dia}').exclude(Vendedor__in = equipe_list).distinct('Vendedor')
    vendedor_forest_dict = {}
    count_forest = 0
    for i in query_forest:
        # INICIALIZA DICIONARIO 
        new_dict_indi = {}
        moto = Moto.objects.filter(Vendedor = i.Vendedor, Municipio = cidade, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']
        try :
            # PEGA USERNAME PARA BUSCAR NA TABELA COTAS PORQUE O NOME EH DIFERENTE DA TABELA DE MOTOS
            # SE NAO ENCONTRAR QUERY ELE RETORNA SEM CADASTRO
            vendedor = User.objects.get(first_name = i.Vendedor)
            avatar = Perfil.objects.get(usuario = vendedor)
            new_dict_indi['avatar'] = avatar.avatar.url
            cota = Cota.objects.filter(Nome_Vendedor = vendedor.username, Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        except User.DoesNotExist:
            cota = 's/cadastr'
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
    list_moto = []
    for i in list_moto_obj:
        list_moto.append(i.nome)

    moto_dict = {}
    contador = 1
    for i in list_moto:

        moto = Moto.objects.filter(Veiculo = i, Municipio = cidade, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Modelo= i, Municipio = cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        

        if moto is None or moto < 1:
            moto = 0

        if cota is None or moto < 1:
            cota = 0

        if moto == 0 and cota == 0:
            #print(i)
            continue
        
        obj_avatar = MotoPerfil.objects.get(nome = i)
        avatar = obj_avatar.avatar

        # pega a area moto       
        meta_cidade = Moto.objects.filter(Municipio = cidade, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']
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
            'nome' :  i,
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
def desempenhoMotoRegiao(request,regiao):
    motos = MotoPerfil.objects.all()    

    ano = 2019
    mes = 3
    dia = 29
    ultimo_dia_mes = calendar.monthrange(ano,mes)

    # pega cidades da regiao
    list_cidade = list(Cidade.objects.filter(regiao = regiao))


    context = {}
    contador = 1

    for value in motos:
        moto = Moto.objects.filter(Veiculo = value.nome, Empresa = regiao, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Modelo = value.nome, Municipio__in = list_cidade, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
        
        if moto is None or moto < 1:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA AS CIDADES DA REGIAO
        cidades = Cidade.objects.filter(regiao=regiao)
        list_cidade = []
        for i in cidades:
            list_cidade.append(i.nome)
        # total da regiao com a listagem de cidades
        geral_moto = Moto.objects.filter(Municipio__in = list_cidade, Data__gte=f'{ano}-{mes}-1', Data__lte=f'{ano}-{mes}-{ultimo_dia_mes[1]}').aggregate(Sum('Quantidade'))['Quantidade__sum']
        # PORCENTAGEM DA QUANTIDADE DO MODELO EM RELACAO AO TOTAL DA REGIAO
        if geral_moto > 0:
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
def list_cidade(request, regiao):
    cidades = Cidade.objects.filter(regiao=regiao)

    
    ano=2019
    mes=3
    dia=25
    ultimo_dia_mes = calendar.monthrange(ano, mes)

    cidade_dict = {}
    contador = 1
    for cidade in cidades:
         
        moto = Moto.objects.filter(Municipio = cidade.nome, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Municipio = cidade.nome, Data_da_Venda=f'{ano}-{mes}-{dia}').count()

        if moto is None:
            moto = 0

        if cota is None:
            cota = 0

        # PEGA DESEMPENHO DA CIDADE
        obj_desempenho = TotalMensalMoto2019.objects.get(cidade = cidade.nome , mes=mes)
        total_mensal_meta = obj_desempenho.qtd
        

        acumulado_mes = Moto.objects.filter(Municipio = cidade.nome, Data__lte=f'{ano}-{mes}-{dia}', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        
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
            print(cidade.nome)
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
            'desempenho_porcen' : porcen_desempenho,
            'porcen_desempenho_cota' : porcen_desempenho_cota,
            'desempenho_cota' : desempenho_cota,
        }
        contador = contador + 1 
        cidade_dict[contador] = newdici

    return Response(cidade_dict)


