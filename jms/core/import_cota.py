import xlrd , datetime
from .models import Cota
import os
from datetime import datetime

def xlsx_cota(url_link):

    worbook = xlrd.open_workbook(url_link)
    sheet = worbook.sheet_by_index(0)

    aux = []

    for row in range(3, sheet.nrows):

        Cpf_Vendedor           = str(sheet.row(row)[0].value)
        Nome_Vendedor          = sheet.row(row)[1].value
        #Data_da_Venda          = xlrd.xldate_as_datetime(sheet.row(row)[2].value, 0)
        Data_da_Venda          = sheet.row(row)[2].value
        Prazo                  = str(sheet.row(row)[3].value)
        Tipo_contrato          = sheet.row(row)[4].value
        Modelo                 = sheet.row(row)[5].value
        Status                 = sheet.row(row)[6].value
        Cliente                = sheet.row(row)[7].value
        Municipio              = sheet.row(row)[8].value
        Telefone               = sheet.row(row)[9].value
        Celular                = sheet.row(row)[12].value
        Ponto_de_Venda         = sheet.row(row)[13].value
        Parcela                = sheet.row(row)[14].value
        #Data_de_Vencimento     = xlrd.xldate_as_datetime(sheet.row(row)[2].value, 0)
        Data_de_Vencimento     = sheet.row(row)[15].value
        Grupo                  = sheet.row(row)[16].value
        Num_Cota               = int(sheet.row(row)[17].value)
        R                      = sheet.row(row)[18].value
        D                      = sheet.row(row)[19].value
        Credito                = sheet.row(row)[20].value
        #Data_da_Contemplacao   = xlrd.xldate_as_datetime(sheet.row(row)[2].value, 0)
        Data_da_Contemplacao   = sheet.row(row)[21].value
        Tipo_de_Contemplacao   = sheet.row(row)[22].value
        Efetuou_Negociacao     = sheet.row(row)[23].value
        Proposta               = sheet.row(row)[24].value
        Digito_da_Proposta     = sheet.row(row)[25].value
        Vl_total_amortizado    = sheet.row(row)[26].value
        Vl_Quitacao            = sheet.row(row)[27].value
        Plano                  = sheet.row(row)[28].value
        Porcentagem_Amortizado = sheet.row(row)[29].value
        Porcentagem_Mensal     = sheet.row(row)[30].value
        Qtd_Parcelas           = sheet.row(row)[31].value
        Seguro_de_Vida         = sheet.row(row)[32].value      

        #Margem_Porcentagem = Margem_Porcentagem.replace(',', '.')
        #print(type(Data_da_Venda))
        Cpf_Vendedor = Cpf_Vendedor.replace('.0','')
        Prazo = Prazo.replace('.0','')
        Modelo = Modelo.replace('*','')

        if Data_da_Contemplacao == '':            
            Data_da_Contemplacao = None
        else:
            Data_da_Contemplacao = Data_da_Contemplacao.replace('/','-')
            Data_da_Contemplacao = datetime.strptime(Data_da_Contemplacao, '%d-%m-%Y').date()

        Data_da_Venda = Data_da_Venda.replace('/','-')
        Data_de_Vencimento = Data_de_Vencimento.replace('/','-')

        Data_da_Venda = datetime.strptime(Data_da_Venda, '%d-%m-%Y').date()
        Data_de_Vencimento = datetime.strptime(Data_de_Vencimento, '%d-%m-%Y').date()

        "XRE 300 ABS","SH 150I","CG 160 START","CRF 250F","XRE 190","BIZ 125","CG 160 FAN","CB 250F TWISTER ABS","NXR 160 BROS ESDD","CB 250F TWISTER STD","ELITE 125","POP 110I","CG 160 TITAN","CRF 230F","BIZ 110I","PCX 150"
        
        
        

        lista = Cota(
            Cpf_Vendedor           = Cpf_Vendedor          ,
            Nome_Vendedor          = Nome_Vendedor         ,
            Data_da_Venda          = Data_da_Venda         ,
            Prazo                  = Prazo                 ,
            Tipo_contrato          = Tipo_contrato         ,
            Modelo                 = Modelo                ,
            Status                 = Status                ,
            Cliente                = Cliente               ,
            Municipio              = Municipio             ,
            Telefone               = Telefone              ,
            Celular                = Celular               ,
            Ponto_de_Venda         = Ponto_de_Venda        ,
            Parcela                = Parcela               ,
            Data_de_Vencimento     = Data_de_Vencimento    ,
            Grupo                  = Grupo                 ,
            Cota                   = Num_Cota              ,
            R                      = R                     ,
            D                      = D                     ,
            Credito                = Credito               ,
            Data_da_Contemplacao   = Data_da_Contemplacao  ,
            Tipo_de_Contemplacao   = Tipo_de_Contemplacao  ,
            Efetuou_Negociacao     = Efetuou_Negociacao    ,
            Proposta               = Proposta              ,
            Digito_da_Proposta     = Digito_da_Proposta    ,
            Vl_total_amortizado    = Vl_total_amortizado   ,
            Vl_Quitacao            = Vl_Quitacao           ,
            Plano                  = Plano                 ,
            Porcentagem_Amortizado = Porcentagem_Amortizado,
            Porcentagem_Mensal     = Porcentagem_Mensal    ,
            Qtd_Parcelas           = Qtd_Parcelas          ,
            Seguro_de_Vida         = Seguro_de_Vida
            )
        aux.append(lista)
    # try:
    #     Moto.objects.bulk_create(aux)
    #     return 'Deu certo'
    # except:
    #     return 'TENTE NOVAMENTE'
    #return aux
    Cota.objects.bulk_create(aux)
    print('criou')



