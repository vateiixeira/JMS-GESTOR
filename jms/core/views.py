from django.shortcuts import render,redirect
from .import_moto import xlsx_moto
from .import_cota import xlsx_cota
from datetime import datetime
from jms.account.models import Perfil, PlanejadoUser
from django.shortcuts import get_object_or_404
from .utils import get_mes_ano
from .models import Moto, Cota, Cidade
from django.db.models import Sum

def not_found(request):
    template = '404.html'
    return render(request,template)

def import_moto(request):
    template = 'import_moto.html'
    lista = xlsx_moto()
    context = {
        'lista' : lista
    }
    return render(request,template,context)

def import_cota(request):
    template = 'import_cota.html'
    lista = xlsx_cota()
    context = {
        'lista' : lista
    }
    return render(request,template,context)

def gerente(request, id):
    template = 'gerente.html'
    user = request.user

    # AUTENTICA USUARIO GERENTE
    try:        
        user = Perfil.objects.get(id=id, cargo='GERENTE')
    except:
        return redirect('core:404')

    # ANO E MES ATUAL
    # ano,mes = get_mes_ano()
    ano = 2020
    mes = 3

    # PLANEJADO DO USUARIO
    obj_planejado = PlanejadoUser.objects.get(usuario_id=id)
    planejado_salario = obj_planejado.planejado
    planejado_moto  = obj_planejado.planejado_moto
    planejado_cota = obj_planejado.planejado_cota
    planejado_visita = obj_planejado.planejado_visita

    # AREA DO GERENTE
    regiao_user = user.regiao
    obj_cidades = Cidade.objects.filter(regiao = regiao_user)
    list_cidades = []
    for i in obj_cidades:
        list_cidades.append(i.nome)

    # REALIZADO MOTO
    realizado_moto_valor = Moto.objects.filter(Empresa = regiao_user, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    realizado_moto_qtd   = Moto.objects.filter(Empresa = regiao_user, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']

    # REALIZADO COTA
    realizado_cota_qtd = Cota.objects.filter(Municipio__in = list_cidades, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
    realizado_cota_valor = 0

    # REALIZADO TOTAL SOMA DE -> MOTO + COTA
    realizado_total = realizado_moto_valor + realizado_cota_valor

    # EQUIPE DA REGIAO + DESEMPENHO
    equipe = Perfil.objects.filter(regiao=regiao_user)
    
    equipe_dict = {}
    count = 1
    for i in equipe:
        count = count + 1

        nome_vendedor = i.usuario.username
        nome_vendedor = nome_vendedor.upper()

        moto = Moto.objects.filter(Vendedor__contains = nome_vendedor, Empresa = regiao_user, Data__lt=f'{ano}-{mes}-31', Data__gte=f'{ano}-{mes}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Nome_Vendedor__contains = nome_vendedor,Municipio__in = list_cidades, Data_da_Venda__lt=f'{ano}-{mes}-31', Data_da_Venda__gte=f'{ano}-{mes}-1').count()
        visita = 23

        

        if moto is None:
            moto = 0
        if cota is None:
            cota = 0
        
        new_dict = {
            'vendedor' : i.usuario.username,
            'avatar' : i.avatar,
            'moto' : moto,
            'cota' : cota,
            'visita' : visita,
        }
        equipe_dict[count] = new_dict
        

    #CIDADES REGIAO
    cidades = Cidade.objects.filter(regiao=regiao_user)


    context = {
        'planejado_salario' : planejado_salario ,
        'planejado_moto' :planejado_moto ,
        'planejado_cota' : planejado_cota ,
        'planejado_visita' : planejado_visita ,
        'regiao_user' : regiao_user ,
        'realizado_moto_valor' : realizado_moto_valor ,
        'realizado_moto_qtd' : realizado_moto_qtd ,
        'realizado_total' : realizado_total ,
        'realizado_cota_qtd' : realizado_cota_qtd ,
        'list_cidades' : list_cidades ,
        'equipe' : equipe_dict ,
        'cidades' : cidades ,
    }
    return render(request,template,context)
