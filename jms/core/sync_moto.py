import fdb
import django
from .models import Moto


def conecta():
    con = fdb.connect(
    host='localhost', database='/Users/Administrator/Desktop/VisionQuarta1259/SDFSDF.FDB',
    user='sysdba', password='masterkey'
            )
    return con.cursor()

def verifica_dados_novos(cdempresa,dia,mes,ano):
    cur = conecta()    
    return cur.execute(f"select nrnotafiscal from notafiscal where notafiscal.dtemissao between '{mes}-{dia}-{ano}' and '{mes}-{dia+1}-{ano}' and cdoperacaointerna in(7,53) and cdempresa = {cdempresa}")    
    print(cur.fetchall())
    # checar com banco do django

def verifica_cancelamento(nota,cdempresa):
    cur = conecta()    
    return cur.execute(f"select * \
    from notafiscal \
    join notafiscalcancelamento can on (can.cdempresa = notafiscal.cdempresa and can.cdnotafiscal = notafiscal.cdnotafiscal) \
    where notafiscal.nrnotafiscal = {nota} and notafiscal.cdempresa = {cdempresa} \
        ")    
            # checar com banco do django

def mapeia_dados_firebird():
    SELECT ="select                                                                                                                               \
    empresa.dsapelido as Empresa ,   \
    notafiscal.dtemissao as Data,   \
    notafiscal.nrnotafiscal as Nota_Fiscal,   \
    notafiscal.dsserie as Serie,   \
    notafiscal.vltotalnota as Valor_da_Nota ,   \
    Moto.dsinsumo as modelo,   \
    Moto.cdinsumofabricante as chassi ,   \
    fp.dsformapagamento as forma_pagamento,   \
    Vendedor.nmpessoa as vendedor_nome,   \
    Vendedor.nrcpfcnpj as vendedor_cpf,   \
    Cliente.nmpessoa as cliente_nome,   \
    Cliente.nrcpfcnpj as cliente_cpf,   \
    subgrupoinsumo.dssubgrupoinsumo as Novo,   \
    itemnotafiscal.qtinsumo as Quantidade,   \
    operacaointerna.dsoperacaointerna as motivo_venda,   \
    itemnotafiscal.vltotalcontabilitem as custo_medio,   \
    veiculo.nrano as Ano_Fab,   \
    veiculo.nrmodelo as Modelo_Fab,   \
    municipio.dsmunicipio,   \
    cor.dscor as cor_veiculo   ,   \
    fp.dsformafabrica as forma_fabrica,   \
    subfp.dssubformafabrica as sub_forma_fabrica,   \
    subfp.dssubformapagamento as sub_forma_pagamento   \
    from notafiscal    \
    join itemnotafiscal on (notafiscal.cdnotafiscal = itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa = notafiscal.cdempresa)   \
    join insumo Moto on (Moto.cdinsumo = itemnotafiscal.cdinsumo)   \
    join subgrupoinsumo on (subgrupoinsumo.cdsubgrupoinsumo = Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo = Moto.cdgrupoinsumo)   \
    join operacaointerna on (operacaointerna.cdoperacaointerna = notafiscal.cdoperacaointerna)   \
    join empresa on (empresa.cdempresa = notafiscal.cdempresa)   \
    left join nfsaidasaida on (nfsaidasaida.cdnotafiscal = notafiscal.cdnotafiscal and nfsaidasaida.cdempresa = notafiscal.cdempresa)   \
    left join saida on (saida.cdsaida = nfsaidasaida.cdsaida and saida.cdempresa = nfsaidasaida.cdempresa)   \
    left join veiculo on (veiculo.cdinsumo = Moto.cdinsumo)   \
    left join cor on (cor.cdcor = veiculo.cdcor)   \
    left join pessoa Vendedor on (Vendedor.cdpessoa = saida.cdvendedor )   \
    join pessoa Cliente on (cliente.cdpessoa = notafiscal.cdpessoa)   \
    join municipio on (municipio.cdmunicipio = notafiscal.cdmunicipio)   \
    left join conta c on (notafiscal.cdempresa = c.cdempresa and notafiscal.cdnotafiscal = c.cdnotafiscal and   \
                                c.CDCONTA = (select first 1 (c1.CDCONTA)   \
                        from CONTA c1 inner join FORMAPAGAMENTO fp on fp.CDFORMAPAGAMENTO = c1.CDFORMAPAGAMENTO   \
                        where c1.CDEMPRESA = c.CDEMPRESA   \
                                and c1.CDNOTAFISCAL = c.CDNOTAFISCAL))   \
    join formapagamento fp on (c.cdformapagamento = fp.cdformapagamento)   \
    join subformapagamento subfp on (c.cdsubformapagamento = subfp.cdsubformapagamento and c.cdformapagamento = subfp.cdformapagamento)    \
    left join notafiscalcancelamento cancela on (cancela.cdnotafiscal = notafiscal.cdnotafiscal and cancela.cdempresa = notafiscal.cdempresa  )    \
        where notafiscal.dtemissao > '01-01-2019' and notafiscal.cdoperacaointerna in(7,53) and  cancela.cdmotivocancelamento IS NULL"
    cur = conecta()
    cur.execute(SELECT)
    #print(cur.fetchall())
    return cur.fetchall()

def migra_nota(nota,dia,mes,ano,cdempresa):
    aux = []   

    SELECT =f"select                                                                                                                               \
    empresa.dsapelido as Empresa ,   \
    notafiscal.dtemissao as Data,   \
    notafiscal.nrnotafiscal as Nota_Fiscal,   \
    notafiscal.dsserie as Serie,   \
    notafiscal.vltotalnota as Valor_da_Nota ,   \
    Moto.dsinsumo as modelo,   \
    Moto.cdinsumofabricante as chassi ,   \
    fp.dsformapagamento as forma_pagamento,   \
    Vendedor.nmpessoa as vendedor_nome,   \
    Vendedor.nrcpfcnpj as vendedor_cpf,   \
    Cliente.nmpessoa as cliente_nome,   \
    Cliente.nrcpfcnpj as cliente_cpf,   \
    subgrupoinsumo.dssubgrupoinsumo as Novo,   \
    itemnotafiscal.qtinsumo as Quantidade,   \
    operacaointerna.dsoperacaointerna as motivo_venda,   \
    itemnotafiscal.vltotalcontabilitem as custo_medio,   \
    veiculo.nrano as Ano_Fab,   \
    veiculo.nrmodelo as Modelo_Fab,   \
    municipio.dsmunicipio,   \
    cor.dscor as cor_veiculo   ,   \
    fp.dsformafabrica as forma_fabrica,   \
    subfp.dssubformafabrica as sub_forma_fabrica,   \
    subfp.dssubformapagamento as sub_forma_pagamento   \
    from notafiscal    \
    join itemnotafiscal on (notafiscal.cdnotafiscal = itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa = notafiscal.cdempresa)   \
    join insumo Moto on (Moto.cdinsumo = itemnotafiscal.cdinsumo)   \
    join subgrupoinsumo on (subgrupoinsumo.cdsubgrupoinsumo = Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo = Moto.cdgrupoinsumo)   \
    join operacaointerna on (operacaointerna.cdoperacaointerna = notafiscal.cdoperacaointerna)   \
    join empresa on (empresa.cdempresa = notafiscal.cdempresa)   \
    left join nfsaidasaida on (nfsaidasaida.cdnotafiscal = notafiscal.cdnotafiscal and nfsaidasaida.cdempresa = notafiscal.cdempresa)   \
    left join saida on (saida.cdsaida = nfsaidasaida.cdsaida and saida.cdempresa = nfsaidasaida.cdempresa)   \
    left join veiculo on (veiculo.cdinsumo = Moto.cdinsumo)   \
    left join cor on (cor.cdcor = veiculo.cdcor)   \
    left join pessoa Vendedor on (Vendedor.cdpessoa = saida.cdvendedor )   \
    join pessoa Cliente on (cliente.cdpessoa = notafiscal.cdpessoa)   \
    join municipio on (municipio.cdmunicipio = notafiscal.cdmunicipio)   \
    left join conta c on (notafiscal.cdempresa = c.cdempresa and notafiscal.cdnotafiscal = c.cdnotafiscal and   \
                                c.CDCONTA = (select first 1 (c1.CDCONTA)   \
                        from CONTA c1 inner join FORMAPAGAMENTO fp on fp.CDFORMAPAGAMENTO = c1.CDFORMAPAGAMENTO   \
                        where c1.CDEMPRESA = c.CDEMPRESA   \
                                and c1.CDNOTAFISCAL = c.CDNOTAFISCAL))   \
    join formapagamento fp on (c.cdformapagamento = fp.cdformapagamento)   \
    join subformapagamento subfp on (c.cdsubformapagamento = subfp.cdsubformapagamento and c.cdformapagamento = subfp.cdformapagamento)    \
    left join notafiscalcancelamento cancela on (cancela.cdnotafiscal = notafiscal.cdnotafiscal and cancela.cdempresa = notafiscal.cdempresa  )    \
            where notafiscal.cdoperacaointerna in(7,53) and notafiscal.cdempresa = {cdempresa} and notafiscal.nrnotafiscal={nota} \
            "
    #where notafiscal.cdnotafiscal = 23724\
    cur = conecta()
    cur.execute(SELECT)

    dados_fb = cur.fetchall()

    for i in dados_fb:

        SELECT = f"select \
        notafiscal.vlseguro + notafiscal.vlfrete + notafiscal.VLPISSUBSTITUIDO + notafiscal.VLCOFINSSUBSTITUIDO + notafiscal.VLICMSSUBST + notafiscal.VLPRODUTO as total \
        from notafiscal \
        join itemnotafiscal on (notafiscal.cdnotafiscal = itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa = notafiscal.cdempresa) \
        join insumo Moto on (Moto.cdinsumo = itemnotafiscal.cdinsumo) \
        join subgrupoinsumo on (subgrupoinsumo.cdsubgrupoinsumo = Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo = Moto.cdgrupoinsumo) \
        join operacaointerna on (operacaointerna.cdoperacaointerna = notafiscal.cdoperacaointerna) \
        join empresa on (empresa.cdempresa = notafiscal.cdempresa) \
        left join nfsaidasaida on (nfsaidasaida.cdnotafiscal = notafiscal.cdnotafiscal and nfsaidasaida.cdempresa = notafiscal.cdempresa) \
        left join saida on (saida.cdsaida = nfsaidasaida.cdsaida and saida.cdempresa = nfsaidasaida.cdempresa) \
            where Moto.cdinsumofabricante= '{i[6]}' and operacaointerna.cdoperacaointerna = 2 "

        cur = conecta()
        cur.execute(SELECT)
        custo_medio  =  cur.fetchone()
        #print(custo_medio)
        
        if i[2] is None :
            print('nota fiscal nula, pulando registro')
        else:
            Nota_Fiscal             = i[2]
            Serie                   = i[3]
            Empresa                 = i[0]
            Data                    = i[1]        
            Valor_da_Nota           = i[4]
            Veiculo                 = i[5]
            Chassi                  = i[6]
            Forma_Pagamento         = i[7]

            if i[8] is None:                 
                Vendedor = 'VENDEDOR SEM NOME' 
            else:
                Vendedor                = i[8]
            
            if i[9] is None:
                Vendedor_cpf = 99999999999
            else: 
                Vendedor_cpf            = i[9]

            Cliente                 = i[10]
            CPF_CNPJ_Cliente        = i[11]

            if i[12] == 'VEICULOS NOVOS':
                Novo = True
            else:
                Novo = False

            Quantidade              = i[13]

            if i[14] == 'DEV. VENDA VEÍCULO NOVO':
                Valor_da_Nota = Valor_da_Nota * (-1)
                Quantidade = Quantidade * (-1)
                Quantidade = Quantidade * (-1)
                if custo_medio is not None:
                    Custo_Medio = custo_medio[0] * (-1)

            Operacao_Interna        = i[14]
            Data_Compra             = i[1]

            if custo_medio is None:
                Custo_Medio             = i[15]
            else:
                if i[14] != 'DEV. VENDA VEÍCULO NOVO':
                    Custo_Medio = custo_medio[0]
                Margem = Valor_da_Nota - Custo_Medio
                Margem_Porcentagem = Margem / Valor_da_Nota 

            Ano_Fab                 = i[16]
            Ano_Modelo              = i[17]
            Municipio               = i[18]
            # Valor_Tabela            = i[]
            # Emp_Funcionario         = i[]
            # Motivo_Devolucao        = i[]
            Cor                     = i[19]
            # Tipo                    = i[]
            # Telefone                = i[]
            # Celular                 = i[]
            # email                   = i[]
            # Placa                   = i[]
            # Despesa_Oficina         = i[]
            # Despesa_Financeira      = i[]
            # Valor_Venda_Gerencial   = i[]
            # Base_Comissao           = i[]
            if i[21] is None:
                Forma_Fabrica = 'NULL'
            else:
                Forma_Fabrica           = i[21]
            Sub_Forma_Fabrica       = i[22]
            Modalidade_Venda        = i[20]
            # Grupo_Pessoa_Vendedor   = i[]

            lista = Moto(
                Empresa                 = Empresa         ,
                Data                    = Data            ,
                Nota_Fiscal             = Nota_Fiscal     ,
                Serie                   = Serie           ,
                Valor_da_Nota           = Valor_da_Nota   ,
                Veiculo                 = Veiculo         ,
                Chassi                  = Chassi          ,
                Forma_Pagamento         = Forma_Pagamento ,
                Vendedor                = Vendedor        ,
                Vendedor_cpf            = Vendedor_cpf    ,
                Cliente                 = Cliente         ,
                Cpf_Cnpj_Cliente        = CPF_CNPJ_Cliente,
                Novo                    = Novo            ,
                Quantidade              = Quantidade      ,
                Operacao_Interna        = Operacao_Interna,
                Data_Compra             = Data_Compra     ,
                Custo_Medio             = Custo_Medio     ,
                Margem                  = Margem          ,
                Margem_Porcentagem      = Margem_Porcentagem  ,
                Ano_Fab                 = Ano_Fab         ,
                Ano_Modelo              = Ano_Modelo      ,
                Municipio               = Municipio       ,
                # Valor_Tabela          = # Valor_Tabela  ,
                # Emp_Funcionario       = # Emp_Funcionari,
                # Motivo_Devolucao      = # Motivo_Devoluc,
                Cor                     = Cor             ,
                # Tipo                  = i[]
                # Telefone              = i[]
                # Celular               = i[]
                # email                 = i[]
                # Placa                 = i[]
                # Despesa_Oficina       = i[]
                # Despesa_Financeira    = i[]
                # Valor_Venda_Gerencial = i[]
                # Base_Comissao         = i[]
                Forma_Fabrica         = Forma_Fabrica,
                Sub_Forma_Fabrica     = Sub_Forma_Fabrica,
                Modalidade_Venda      = Modalidade_Venda,
                # Grupo_Pessoa_Vendedor = i[]
            )
            #print(i)
            aux.append(lista)

    Moto.objects.bulk_create(aux)
    print('deu certo')

def migra_dados():
    aux = []
    dados_fb = mapeia_dados_firebird()

    

    for i in dados_fb:

        SELECT = f"select \
        notafiscal.vlseguro + notafiscal.vlfrete + notafiscal.VLPISSUBSTITUIDO + notafiscal.VLCOFINSSUBSTITUIDO + notafiscal.VLICMSSUBST + notafiscal.VLPRODUTO as total \
        from notafiscal \
        join itemnotafiscal on (notafiscal.cdnotafiscal = itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa = notafiscal.cdempresa) \
        join insumo Moto on (Moto.cdinsumo = itemnotafiscal.cdinsumo) \
        join subgrupoinsumo on (subgrupoinsumo.cdsubgrupoinsumo = Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo = Moto.cdgrupoinsumo) \
        join operacaointerna on (operacaointerna.cdoperacaointerna = notafiscal.cdoperacaointerna) \
        join empresa on (empresa.cdempresa = notafiscal.cdempresa) \
        left join nfsaidasaida on (nfsaidasaida.cdnotafiscal = notafiscal.cdnotafiscal and nfsaidasaida.cdempresa = notafiscal.cdempresa) \
        left join saida on (saida.cdsaida = nfsaidasaida.cdsaida and saida.cdempresa = nfsaidasaida.cdempresa) \
            where Moto.cdinsumofabricante= '{i[6]}' and operacaointerna.cdoperacaointerna = 2 "

        cur = conecta()
        cur.execute(SELECT)
        custo_medio  =  cur.fetchone()
        #print(custo_medio)
        
        if i[2] is None :
            print('nota fiscal nula, pulando registro')
        else:
            Nota_Fiscal             = i[2]
            Serie                   = i[3]
            Empresa                 = i[0]
            Data                    = i[1]        
            Valor_da_Nota           = i[4]
            Veiculo                 = i[5]
            Chassi                  = i[6]
            Forma_Pagamento         = i[7]

            if i[8] is None:                 
                Vendedor = 'VENDEDOR SEM NOME' 
            else:
                Vendedor                = i[8]
            
            if i[9] is None:
                Vendedor_cpf = 99999999999
            else: 
                Vendedor_cpf            = i[9]

            Cliente                 = i[10]
            CPF_CNPJ_Cliente        = i[11]

            if i[12] == 'VEICULOS NOVOS':
                Novo = True
            else:
                Novo = False

            Quantidade              = i[13]

            if i[14] == 'DEV. VENDA VEÍCULO NOVO':
                Valor_da_Nota = Valor_da_Nota * (-1)
                Quantidade = Quantidade * (-1)
                Quantidade = Quantidade * (-1)
                if custo_medio is not None:
                    Custo_Medio = custo_medio[0] * (-1)

            Operacao_Interna        = i[14]
            Data_Compra             = i[1]

            if custo_medio is None:
                Custo_Medio             = i[15]
            else:
                if i[14] != 'DEV. VENDA VEÍCULO NOVO':
                    Custo_Medio = custo_medio[0]
                Margem = Valor_da_Nota - Custo_Medio
                Margem_Porcentagem = Margem / Valor_da_Nota 

            Ano_Fab                 = i[16]
            Ano_Modelo              = i[17]
            Municipio               = i[18]
            # Valor_Tabela            = i[]
            # Emp_Funcionario         = i[]
            # Motivo_Devolucao        = i[]
            Cor                     = i[19]
            # Tipo                    = i[]
            # Telefone                = i[]
            # Celular                 = i[]
            # email                   = i[]
            # Placa                   = i[]
            # Despesa_Oficina         = i[]
            # Despesa_Financeira      = i[]
            # Valor_Venda_Gerencial   = i[]
            # Base_Comissao           = i[]
            if i[21] is None:
                Forma_Fabrica = 'NULL'
            else:
                Forma_Fabrica           = i[21]
            Sub_Forma_Fabrica       = i[22]
            Modalidade_Venda        = i[20]
            # Grupo_Pessoa_Vendedor   = i[]

            lista = Moto(
                Empresa                 = Empresa         ,
                Data                    = Data            ,
                Nota_Fiscal             = Nota_Fiscal     ,
                Serie                   = Serie           ,
                Valor_da_Nota           = Valor_da_Nota   ,
                Veiculo                 = Veiculo         ,
                Chassi                  = Chassi          ,
                Forma_Pagamento         = Forma_Pagamento ,
                Vendedor                = Vendedor        ,
                Vendedor_cpf            = Vendedor_cpf    ,
                Cliente                 = Cliente         ,
                Cpf_Cnpj_Cliente        = CPF_CNPJ_Cliente,
                Novo                    = Novo            ,
                Quantidade              = Quantidade      ,
                Operacao_Interna        = Operacao_Interna,
                Data_Compra             = Data_Compra     ,
                Custo_Medio             = Custo_Medio     ,
                Margem                  = Margem          ,
                Margem_Porcentagem      = Margem_Porcentagem  ,
                Ano_Fab                 = Ano_Fab         ,
                Ano_Modelo              = Ano_Modelo      ,
                Municipio               = Municipio       ,
                # Valor_Tabela          = # Valor_Tabela  ,
                # Emp_Funcionario       = # Emp_Funcionari,
                # Motivo_Devolucao      = # Motivo_Devoluc,
                Cor                     = Cor             ,
                # Tipo                  = i[]
                # Telefone              = i[]
                # Celular               = i[]
                # email                 = i[]
                # Placa                 = i[]
                # Despesa_Oficina       = i[]
                # Despesa_Financeira    = i[]
                # Valor_Venda_Gerencial = i[]
                # Base_Comissao         = i[]
                Forma_Fabrica         = Forma_Fabrica,
                Sub_Forma_Fabrica     = Sub_Forma_Fabrica,
                Modalidade_Venda      = Modalidade_Venda,
                # Grupo_Pessoa_Vendedor = i[]
            )
        #print(i)
        aux.append(lista)

    Moto.objects.bulk_create(aux)
    print('deu certo')