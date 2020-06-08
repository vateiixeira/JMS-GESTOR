from django.shortcuts import render,redirect
from .import_moto import xlsx_moto
from .import_cota import xlsx_cota
from datetime import datetime
from jms.account.models import Perfil, PlanejadoUser
from django.shortcuts import get_object_or_404
from .utils import get_mes_ano
from .models import Moto, Cota, Cidade,TotalMensalMoto2019
from django.db.models import Sum
from .forms import *
import fdb
from .sync_moto import migra_dados,verifica_dados_novos,migra_nota,verifica_cancelamento
import time
from datetime import datetime
import calendar


def not_found(request):
    template = '404.html'
    return render(request,template)

def import_moto(request):
    template = 'import_moto.html'    
    if request.method == 'POST':
        form = DocumentMotoForm(request.POST, request.FILES)
        if form.is_valid():
            arquivo = form.save()
            url = arquivo.document.path
            xlsx_moto(url)
            # try:
            #     xlsx_moto(url)
            #     #return redirect('core:404')
            # except:
            #     return redirect('core:404')
    else:
        form = DocumentMotoForm()
    context = {
        'form': form
    }
    return render(request,template,context)

def import_cota(request):
    template = 'import_cota.html'

    if request.method == 'POST':
        form = DocumentCotaForm(request.POST, request.FILES)
        if form.is_valid():
            arquivo = form.save()
            url = arquivo.document.path
            xlsx_cota(url)
            # try:
            #     xlsx_cota(url)
            #     #return redirect('core:404')
            # except:
            #     print('deu error')
    else:
        form = DocumentCotaForm()
    context = {
        'form' : form
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
    ano = 2019
    mes = 3
    dia = 20

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
    realizado_moto_valor = Moto.objects.filter(Empresa = regiao_user, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Valor_da_Nota'))['Valor_da_Nota__sum']
    realizado_moto_qtd   = Moto.objects.filter(Empresa = regiao_user, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']

    # REALIZADO COTA
    realizado_cota_qtd = Cota.objects.filter(Municipio__in = list_cidades, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
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

        moto = Moto.objects.filter(Vendedor__contains = nome_vendedor, Empresa = regiao_user, Data=f'{ano}-{mes}-{dia}').aggregate(Sum('Quantidade'))['Quantidade__sum']
        cota = Cota.objects.filter(Nome_Vendedor__contains = nome_vendedor,Municipio__in = list_cidades, Data_da_Venda=f'{ano}-{mes}-{dia}').count()
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

def cria_cidade(request):
    obj = Moto.objects.all().distinct('Municipio')
    for x in obj:
        try:
            Cidade.objects.get(nome = x.Municipio)
            print(f'{x.Municipio} EXISTE, PULANDO CADASTRO')
        except Cidade.DoesNotExist:
            objCidade = Cidade()
            objCidade.nome = x.Municipio
            objCidade.regiao = x.Empresa
            objCidade.save()
            print(f'Cidade {x.Municipio} foi salva!')

    template = 'limpo.html'
    return render(request,template)

def porcentagem_2019(request):

    dict_mensal = {}
    valor_anual = 0
    mensal = 0
    porcen_40 = 0
    porcen_75 = 0
    porcen_25 = 0


        
    if request.method == 'POST':
        form = CidadesForm(request.POST)
        cidade = request.POST.get('nome')
        ano = 2019
        mes = 1
        mes_m = 12

        dict_mensal = {}
        for i in range(1,13):
            range_month = calendar.monthrange(2019,i)
            dia_final = range_month[1]
            nome_mes = calendar.month_name[i]
            valor_mensal = Moto.objects.filter(Municipio = cidade, Data__lt=f'{ano}-{i}-{dia_final}', Data__gte=f'{ano}-{i}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
            if valor_mensal is None:
                valor_mensal = 0 
            dict_mensal[i] = valor_mensal
            obj = TotalMensalMoto2019(mes = i, qtd = valor_mensal, cidade=cidade)
            obj.save()
            print('salvou')
           

        if valor_anual is None:
            valor_anual = 0
       
        #mensal = valor_anual / 12        

        #ATE DIA 15
        porcen_40 = (dict_mensal[1] * 40) / 100
        porcen_40_dia = porcen_40 / 10
        porcen_75 = (dict_mensal[1] * 35) / 100
        porcen_75_dia = porcen_75 / 8
        porcen_25 = (dict_mensal[1] * 25) / 100
        porcen_25_dia = porcen_25 / 5

    else:
        form = CidadesForm()  
        porcen_25_dia = 0 
        porcen_40_dia = 0
        porcen_75_dia = 0

        


    template = 'pocentagem_2019.html'
    context = {
        'valor_anual' : valor_anual,
        'mensal' : mensal,
        'porcen_40' : porcen_40,
        'porcen_75' : porcen_75,
        'porcen_25' : porcen_25,
        'porcen_40_dia' : porcen_40_dia,
        'porcen_75_dia' : porcen_75_dia,
        'porcen_25_dia' : porcen_25_dia,
        'form' : form,
        'dict_mensal' : dict_mensal,
    }
    return render(request,template,context)

def porcentagem_2019_tudo(request):

    dict_mensal = {}
    valor_anual = 0
    mensal = 0
    porcen_40 = 0
    porcen_75 = 0
    porcen_25 = 0

    cidadesz = Cidade.objects.filter().distinct('nome')
    cidades = []
    for i in cidadesz:
        cidades.append(i.nome)


    for x in cidades:
        cidade = x
        ano = 2019
        mes = 1
        mes_m = 12

        print(f'Cidade: {cidade}')
        print('-------------------------------------')

        dict_mensal = {}
        for i in range(1,13):
            range_month = calendar.monthrange(2019,i)
            dia_final = range_month[1]
            nome_mes = calendar.month_name[i]
            valor_mensal = Moto.objects.filter(Municipio = cidade, Data__lt=f'{ano}-{i}-{dia_final}', Data__gte=f'{ano}-{i}-1').aggregate(Sum('Quantidade'))['Quantidade__sum']
            if valor_mensal is None:
                valor_mensal = 0 
            dict_mensal[i] = valor_mensal
            print(f'Valor_mensal: {valor_mensal}')
            obj = TotalMensalMoto2019(mes = i, qtd = valor_mensal, cidade=cidade)
            obj.save()
           

        if valor_anual is None:
            valor_anual = 0
       
        #mensal = valor_anual / 12        

        #ATE DIA 15
        porcen_40 = (dict_mensal[1] * 40) / 100
        porcen_40_dia = porcen_40 / 10
        porcen_75 = (dict_mensal[1] * 35) / 100
        porcen_75_dia = porcen_75 / 8
        porcen_25 = (dict_mensal[1] * 25) / 100
        porcen_25_dia = porcen_25 / 5


    template = 'pocentagem_2019.html'
    return render(request,template)

def sync_moto(request):
    #migra_dados()
    dia = 20
    mes = 3
    ano = 2020
    cdempresa = 1

    if cdempresa == 1:
        regiao = 'JNB'
    elif cdempresa == 2:
        regiao = 'JNR'
    elif cdempresa == 3:
        regiao = 'SFC'

    first_empr = verifica_dados_novos(cdempresa,dia,mes,ano)
    print('--------NOTAS BANCO FIREBIRD-------')
    for i in first_empr:
        print(i[0])
    
    print('--------BUSCANDO NOTAS NO BANCO-------')
    query_nota_fb = verifica_dados_novos(cdempresa,dia,mes,ano)
    
    for x in query_nota_fb:

        try:
            query_nota_fb = Moto.objects.get(Data = f'{ano}-{mes}-{dia}', Empresa = f'{regiao}', Nota_Fiscal = x[0] )            
        except Moto.DoesNotExist:
            print(f'Nota -> {x[0]} não foi encontrada.')
            print('Fazendo upload...')
            time.sleep(2)
            migra_nota(x[0],dia,mes,ano,cdempresa)
            print('Upload feito!')
        else:
            print(f'Nota -> {x[0]} ja existe no banco, upload será ignorado.')
            print(f'Verificando se a nota foi cancelada...')
            cancelada = verifica_cancelamento(x[0],cdempresa)
            result = cancelada.fetchall()
            if len(result) > 0:
                print('NOTA FISCAL EXIGE CANCELAMENTO')
                print('PROCESSANDO......')
                obj = Moto.objects.get(Nota_Fiscal = x[0], Empresa = regiao)
                obj.Cancelada = True
                obj.save()
                print('NOTA CANCELADA NO SISTEMA GESTOR!!!')
            else:
                print('NOTA FISCAL NÃO POSSUI CANCELAMENTO')

        
    #obj = Moto.objects.latest('pk')
    #print(obj)
    #migra_dados()
    context = {
        #obj: 'obj'
    }
    template = 'sync_moto.html'
    return render(request,template, context)

def upload_moto_total(request):
    template = 'sync_moto.html'
    migra_dados()
    return render(request,template)

def demonstrativo_produto(request):
    template = 'demonstrativo_produto.html'

    obj = Moto.objects.distinct('Veiculo')
    cidade = Moto.objects.distinct('Municipio')
    vendedor = Moto.objects.distinct('Vendedor')
    context = {
        'obj' : obj,
        'cidade' : cidade,
        'vendedor' : vendedor,
    }
    return render(request,template, context)

def atualiza_cidade_cota(request):
    template = 'demonstrativo_produto.html'
    
    list_name_wrong = [
        'CONEGO MARINHO',
        'ICARAI DE MINAS'
        'JAIBA',
        'JANUARIA',
        'MATIAS CARDOSO',
        'SAO FRANCISCO',
        'SAO JOAO DA PONTE',
        'SAO JOAO DAS MISSOES',
        'UBAI']
    
    obj = Cota.objects.filter(Municipio__in = list_name_wrong)
    
    for cidade in obj:
        if cidade.Municipio == 'CONEGO MARINHO':
            cidade.Municipio = 'CÔNEGO MARINHO'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'ICARAI DE MINAS':
            cidade.Municipio = 'ICARAÍ DE MINAS'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'JAIBA':
            cidade.Municipio = 'JAÍBA'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'JANUARIA':
            cidade.Municipio = 'JANUÁRIA'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'MATIAS CARDOSO':
            cidade.Municipio = 'MATHIAS CARDOSO'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'SAO FRANCISCO':
            cidade.Municipio = 'SÃO FRANCISCO'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'SAO JOAO DA PONTE':
            cidade.Municipio = 'SÃO JOÃO DA PONTE'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'SAO JOAO DAS MISSOES':
            cidade.Municipio = 'SÃO JOÃO DAS MISSÕES'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == 'UBAI':
            cidade.Municipio = 'UBAÍ'
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')

    return render(request,template)

def atualiza_cidade_moto(request):
    template = 'atualiza_outros.html'   

    
    obj = Moto.objects.all()
    
    for cidade in obj:
        if cidade.Municipio == "JANAÚBA":
            cidade.Municipio = "JANAUBA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "SÃO FRANCISCO":
            cidade.Municipio = "SÃO FRANCISCO"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "CHAPADA GAÚCHA":
            cidade.Municipio = "CHAPADA GAUCHA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "ICARAÍ DE MINAS":
            cidade.Municipio = "ICARAÍ DE MINAS"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "PINTÓPOLIS":
            cidade.Municipio = "PINTOPOLIS"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "BRASÍLIA DE MINAS":
            cidade.Municipio = "BRASILIA DE MINAS"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')  
        elif cidade.Municipio == "SAO JOAO DA PONTE":
            cidade.Municipio = "SÃO JOÃO DA PONTE"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "VARZELÂNDIA":
            cidade.Municipio = "VARZELANDIA"  
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')     
        elif cidade.Municipio == "JAIBA":
            cidade.Municipio = "JAÍBA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "VERDELÂNDIA":
            cidade.Municipio = "VERDELANDIA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "JUVENÍLIA":
            cidade.Municipio = "JUVENILIA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "LUISLÂNDIA":
            cidade.Municipio = "LUISLANDIA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "MATIAS CARDOSO":
            cidade.Municipio = "MATHIAS CARDOSO"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "MONTALVÂNIA":
            cidade.Municipio = "MONTALVANIA"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "PEDRAS DE MARIA DA CRUZ":
            cidade.Municipio = "PEDRA MARIA DA CRUZ"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros')
        elif cidade.Municipio == "PINTÓPOLIS":
            cidade.Municipio = "PINTOPOLIS"
            cidade.save()
            print(f'{cidade.Municipio} atualizado em um dos registros') 

    return render(request,template)

def atualiza_cidade_cota_outro(request):
    template = 'atualiza_outros.html'
    list = [
        'BAURU',
        'BELO HORIZONTE',
        'BOCAIUVA',
        'BRASILANDIA DE MINAS',
        'BRASILIA',
        'CAJAMAR',
        'CAMPINAS',
        'CAPITANIA',
        'CAPITAO ENEAS',
        'CARBONITA',
        'CONTAGEM',
        'CURVELO',
        'ENGENHEIRO COELHO',
        'FEIRA DA MATA',
        'FERNAO DIAS',
        'IGARASSU',
        'ITATIBA',
        'JACUNDA',
        'LUIS ANTONIO',
        'LUIS EDUARDO MAGALHAES',
        'MIRABELA',
        'MONTES CLAROS',
        'NÃO INFORMADO',
        'NOVA SERRANA',
        'PATOS DE MINAS',
        'POUSO ALEGRE',
        'PRESIDENTE PRUDENTE',
        'RIACHINHO',
        'PITARANA',
        'POUSO ALEGRE',
        'PRESIDENTE PRUDENTE',
        'RIACHINHO',
        'SANTA ERNESTINA',
        'SANTO ANTONIO DO RETIRO',
        'SAO CARLOS',
        'SAO JOAO DA LAGOA',
        'SAO PAULO',
        'SAO ROMAO',
        'TABOAO DA SERRA',
        'UBERLANDIA',
        'URANDI',
        'VARZEA PAULISTA',
        'VISTA SERRANA',
    ]
    for i in list:
        obj = Cidade(
            nome = i,
            regiao = 'OUTROS'
        )
        obj.save()
        print(f'Cidade {i} gravada com sucesso!')
    return render(request,template)

def cria_usuarios(request):
    obj = Moto.objects.all().distinct('Vendedor_cpf')
    for i in obj:
        if i.Vendedor == 'VENDEDOR SEM NOME' or i.Vendedor == 'JAMES MOTO SHOP LTDA':
            print('NÃO AIDCIONADO USUARIOS')
        else:
            cria_user = User()
            first_name = str(i.Vendedor)
            cria_user.username = i.Vendedor_cpf
            cria_user.first_name = first_name[0:25]
            cria_user.save()
            print('salvou usuario')

            # pega municipio para checar região onde ele atua
            cidade = Cidade.objects.get(nome = i.Municipio)
            regiao = cidade.regiao

            obj_user = User.objects.get(username=i.Vendedor_cpf)
            ### fazendo perfil
            perfil = Perfil()
            perfil.cargo = 'VENDEDOR'
            perfil.usuario = obj_user
            perfil.regiao = regiao
            perfil.cpf = i.Vendedor_cpf
            perfil.save()
            print('salvou perfil')

            ### pega as cidade que ele atuou e joga na equipe
            obj_municipios = Moto.objects.filter(Vendedor_cpf = i.Vendedor_cpf)
            lista_cidades = []
            for x in obj_municipios:
                lista_cidades.append(x.Municipio)
                equipe = Equipe()
                equipe.user = obj_user
                equipe.perfil = Perfil.objects.get(cpf = i.Vendedor_cpf)
                try:
                    equipe.cidade = Cidade.objects.get(nome = x.Municipio)
                    equipe.save()
                    print('ADICIONADA CIDADE')
                except Cidade.DoesNotExist:
                    print('Cidade não cadastrada, pulando registro.')

  
    template = '404.html'
    return render(request,template)

