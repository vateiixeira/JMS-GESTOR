import xlrd , datetime
from .models import Moto
import os
from urllib.request import urlopen
from pathlib import Path

def xlsx_moto(url_link):

    worbook = xlrd.open_workbook(url_link)
    sheet = worbook.sheet_by_index(0)

    aux = []

    for row in range(1, (sheet.nrows - 1)):

        Empresa                 = sheet.row(row)[1].value
        Data                    = xlrd.xldate_as_datetime(sheet.row(row)[2].value, 0)
        Nota_Fiscal             = sheet.row(row)[3].value
        Serie                   = sheet.row(row)[4].value
        Valor_da_Nota           = sheet.row(row)[5].value
        Veiculo                 = sheet.row(row)[6].value
        Chassi                  = sheet.row(row)[7].value
        Forma_Pagamento         = sheet.row(row)[8].value
        Vendedor                = sheet.row(row)[9].value
        Cliente                 = sheet.row(row)[10].value
        CPF_CNPJ_Cliente        = sheet.row(row)[11].value
        Novo                    = sheet.row(row)[12].value
        Quantidade              = sheet.row(row)[13].value
        Operacao_Interna        = sheet.row(row)[14].value
        Data_Compra             = xlrd.xldate_as_datetime(sheet.row(row)[15].value, 0)
        Custo_Medio             = sheet.row(row)[16].value
        Margem                  = sheet.row(row)[17].value
        Margem_Porcentagem      = sheet.row(row)[18].value
        Ano_Fab                 = sheet.row(row)[19].value
        Ano_Modelo              = sheet.row(row)[20].value
        Municipio               = sheet.row(row)[21].value
        Valor_Tabela            = sheet.row(row)[22].value
        Emp_Funcionario         = sheet.row(row)[26].value
        Motivo_Devolucao        = sheet.row(row)[27].value
        Cor                     = sheet.row(row)[28].value
        Tipo                    = sheet.row(row)[29].value
        Telefone                = sheet.row(row)[30].value
        Celular                 = sheet.row(row)[31].value
        email                   = sheet.row(row)[32].value
        Placa                   = sheet.row(row)[33].value
        Despesa_Oficina         = sheet.row(row)[38].value
        Despesa_Financeira      = sheet.row(row)[39].value
        Valor_Venda_Gerencial   = sheet.row(row)[40].value
        #Preço_PPS               = sheet.row(row)[41].value
        Base_Comissao           = sheet.row(row)[42].value
        Forma_Fabrica           = sheet.row(row)[43].value
        Sub_Forma_Fabrica       = sheet.row(row)[44].value
        Modalidade_Venda        = sheet.row(row)[45].value
        Grupo_Pessoa_Vendedor   = sheet.row(row)[58].value
        
        if Municipio == "JANAÚBA":
            Municipio = "JANAUBA"
        elif Municipio == "SÃO FRANCISCO":
            Municipio = "SÃO FRANCISCO"
        elif Municipio == "CHAPADA GAÚCHA":
            Municipio = "CHAPADA GAUCHA"
        elif Municipio == "ICARAÍ DE MINAS":
            Municipio = "ICARAÍ DE MINAS"
        elif Municipio == "PINTÓPOLIS":
            Municipio = "PINTOPOLIS"
        elif Municipio == "BRASÍLIA DE MINAS":
            Municipio = "BRASILIA DE MINAS"  
        elif Municipio == "SAO JOAO DA PONTE":
            Municipio = "SÃO JOÃO DA PONTE"
        elif Municipio == "VARZELÂNDIA":
            Municipio = "VARZELANDIA"       
        elif Municipio == "JAIBA":
            Municipio = "JAÍBA"
        elif Municipio == "VERDELÂNDIA":
            Municipio = "VERDELANDIA"

        if Veiculo == "BIZ 125 ":
            Veiculo = 'BIZ 125'

        Margem_Porcentagem = Margem_Porcentagem.replace(',', '.')

        lista = Moto(
            Empresa                 = Empresa              ,
            Data                    = Data                 ,
            Nota_Fiscal             = Nota_Fiscal          ,
            Serie                   = Serie                ,
            Valor_da_Nota           = Valor_da_Nota        ,
            Veiculo                 = Veiculo              ,
            Chassi                  = Chassi               ,
            Forma_Pagamento         = Forma_Pagamento      ,
            Vendedor                = Vendedor             ,
            Cliente                 = Cliente              ,
            Cpf_Cnpj_Cliente        = CPF_CNPJ_Cliente     ,
            Novo                    = Novo                 ,
            Quantidade              = Quantidade           ,
            Operacao_Interna        = Operacao_Interna     ,
            Data_Compra             = Data_Compra          ,
            Custo_Medio             = Custo_Medio          ,
            Margem                  = Margem               ,
            Margem_Porcentagem      = Margem_Porcentagem   ,
            Ano_Fab                 = Ano_Fab              ,
            Ano_Modelo              = Ano_Modelo           ,
            Municipio               = Municipio            ,
            Valor_Tabela            = Valor_Tabela         ,
            Emp_Funcionario         = Emp_Funcionario      ,
            Motivo_Devolucao        = Motivo_Devolucao     ,
            Cor                     = Cor                  ,
            Tipo                    = Tipo                 ,
            Telefone                = Telefone             ,
            Celular                 = Celular              ,
            email                   = email                ,
            Placa                   = Placa                ,
            Despesa_Oficina         = Despesa_Oficina      ,
            Despesa_Financeira      = Despesa_Financeira   ,
            Valor_Venda_Gerencial   = Valor_Venda_Gerencial,
            #Preço_PPS               = Preço_PPS            ,
            Base_Comissao           = Base_Comissao        ,
            Forma_Fabrica           = Forma_Fabrica        ,
            Sub_Forma_Fabrica       = Sub_Forma_Fabrica    ,
            Modalidade_Venda        = Modalidade_Venda     ,
            Grupo_Pessoa_Vendedor   = Grupo_Pessoa_Vendedor)
        aux.append(lista)
    # try:
    #     Moto.objects.bulk_create(aux)
    #     return 'Deu certo'
    # except:
    #     return 'TENTE NOVAMENTE'
    #return aux
    Moto.objects.bulk_create(aux)



