
import fdb
import django
from .models import Moto


def programa():
    dia = 20
    mes = '03'
    ano = 2020
    cdempresa = 1
    first_empr = verifica_dados_novos(cdempresa,dia,mes,ano)
    print('--------NOTAS BANCO FIREBIRD-------')
    for i in first_empr:
        print(i[0])
    
    print('--------BUSCANDO NOTAS NO BANCO-------')
    query_nota_fb = verifica_dados_novos(cdempresa,dia,mes,ano)
    
    for x in query_nota_fb:

        try:
            query_nota_fb = Moto.objects.get(Data = f'{ano}-{mes}-{dia}', Empresa = 'JNB', Nota_Fiscal = x[0] )            
        except Moto.DoesNotExist:
            print(f'Nota -> {x[0]} não foi encontrada.')
            print('Fazendo upload...')
            time.sleep(2)
            migra_nota(x[0],dia,mes,ano,cdempresa)
            print('Upload feito!')
        else:
            print(f'Nota -> {x[0]} ja existe no banco, upload será ignorado.')

def conecta():
    con = fdb.connect(
    host='localhost', database='/Users/Administrator/Desktop/VisionQuarta1259/SDFSDF.FDB',
    user='sysdba', password='masterkey'
            )
    return con.cursor()

def verifica_dados_novos(cdempresa,dia,mes,ano):
    cur = conecta()    
    return cur.execute(f"select nrnotafiscal from notafiscal where notafiscal.dtemissao between '{mes}-{dia}-{ano}' and '{mes}-{dia+1}-{ano}' and cdoperacaointerna in(7,53) and cdempresa = {cdempresa}")    
    #print(cur.fetchall())
    # checar com banco do django

def mapeia_dados_firebird():
    SELECT = "select \
        empresa.dsapelido as Empresa,\
        notafiscal.dtemissao as Data,\
        notafiscal.nrnotafiscal as Nota_Fiscal,\
        notafiscal.dsserie as Serie,\
        notafiscal.vltotal as Valor_da_Nota,\
        itemnotafiscal.vltotalcontabilitem as custo_medio,\
        Moto.cdinsumo as cod_modelo,\
        Moto.dsinsumo as modelo,\
        Moto.cdinsumofabricante as chassi,\
        veiculo.nrano as Ano_Fab,\
        veiculo.nrmodelo as Modelo_Fab,\
        cor.dscor as cor_veiculo,\
        municipio.dsmunicipio,\
        operacaointerna.dsoperacaointerna as motivo_venda,\
        itemnotafiscal.qtinsumo as Quantidade,\
        Vendedor.nmpessoa as vendedor_nome,\
        Vendedor.nrcpfcnpj as vendedor_cpf,\
        Cliente.nmpessoa as cliente_nome,\
        Cliente.nrcpfcnpj as cliente_cpf,\
        subgrupoinsumo.dssubgrupoinsumo as Cond_Moto \
        from notafiscal \
            join itemnotafiscal on(notafiscal.cdnotafiscal=itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa=notafiscal.cdempresa)\
            join insumo Moto on(Moto.cdinsumo=itemnotafiscal.cdinsumo)\
            join subgrupoinsumo on(subgrupoinsumo.cdsubgrupoinsumo=Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo=Moto.cdgrupoinsumo)\
            join operacaointerna on(operacaointerna.cdoperacaointerna=notafiscal.cdoperacaointerna)\
            join empresa on(empresa.cdempresa=notafiscal.cdempresa)\
            join nfsaidasaida on(nfsaidasaida.cdnotafiscal=notafiscal.cdnotafiscal and nfsaidasaida.cdempresa=notafiscal.cdempresa)\
            join saida on(saida.cdsaida=nfsaidasaida.cdsaida and saida.cdempresa=nfsaidasaida.cdempresa)\
            join veiculo on(veiculo.cdinsumo=Moto.cdinsumo)\
            join cor on(cor.cdcor=veiculo.cdcor)\
            join pessoa Vendedor on(Vendedor.cdpessoa=saida.cdvendedor)\
            join pessoa Cliente on(cliente.cdpessoa=notafiscal.cdpessoa)\
            join municipio on(municipio.cdmunicipio=notafiscal.cdmunicipio)\
            where notafiscal.dtemissao >= '01-01-2019' \
            "
    #where notafiscal.cdnotafiscal = 23724\
    cur = conecta()
    cur.execute(SELECT)
    #print(cur.fetchall())
    return cur.fetchall()

def migra_nota(nota,dia,mes,ano,cdempresa):
    aux = []   

    SELECT = f"select \
        empresa.dsapelido as Empresa,\
        notafiscal.dtemissao as Data,\
        notafiscal.nrnotafiscal as Nota_Fiscal,\
        notafiscal.dsserie as Serie,\
        notafiscal.vltotal as Valor_da_Nota,\
        itemnotafiscal.vltotalcontabilitem as custo_medio,\
        Moto.cdinsumo as cod_modelo,\
        Moto.dsinsumo as modelo,\
        Moto.cdinsumofabricante as chassi,\
        veiculo.nrano as Ano_Fab,\
        veiculo.nrmodelo as Modelo_Fab,\
        cor.dscor as cor_veiculo,\
        municipio.dsmunicipio,\
        operacaointerna.dsoperacaointerna as motivo_venda,\
        itemnotafiscal.qtinsumo as Quantidade,\
        Vendedor.nmpessoa as vendedor_nome,\
        Vendedor.nrcpfcnpj as vendedor_cpf,\
        Cliente.nmpessoa as cliente_nome,\
        Cliente.nrcpfcnpj as cliente_cpf,\
        subgrupoinsumo.dssubgrupoinsumo as Cond_Moto \
        from notafiscal \
            join itemnotafiscal on(notafiscal.cdnotafiscal=itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa=notafiscal.cdempresa)\
            join insumo Moto on(Moto.cdinsumo=itemnotafiscal.cdinsumo)\
            join subgrupoinsumo on(subgrupoinsumo.cdsubgrupoinsumo=Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo=Moto.cdgrupoinsumo)\
            join operacaointerna on(operacaointerna.cdoperacaointerna=notafiscal.cdoperacaointerna)\
            join empresa on(empresa.cdempresa=notafiscal.cdempresa)\
            join nfsaidasaida on(nfsaidasaida.cdnotafiscal=notafiscal.cdnotafiscal and nfsaidasaida.cdempresa=notafiscal.cdempresa)\
            join saida on(saida.cdsaida=nfsaidasaida.cdsaida and saida.cdempresa=nfsaidasaida.cdempresa)\
            join veiculo on(veiculo.cdinsumo=Moto.cdinsumo)\
            join cor on(cor.cdcor=veiculo.cdcor)\
            join pessoa Vendedor on(Vendedor.cdpessoa=saida.cdvendedor)\
            join pessoa Cliente on(cliente.cdpessoa=notafiscal.cdpessoa)\
            join municipio on(municipio.cdmunicipio=notafiscal.cdmunicipio)\
            where notafiscal.dtemissao between '{mes}-{dia}-{ano}' and '{mes}-{dia+1}-{ano}' and notafiscal.cdoperacaointerna in(7,53) and notafiscal.cdempresa = {cdempresa} and notafiscal.nrnotafiscal={nota} \
            "
    #where notafiscal.cdnotafiscal = 23724\
    cur = conecta()
    cur.execute(SELECT)

    dados_fb = cur.fetchall()

    for i in dados_fb: 
        # count = 0
        # for x in i:  
        #     #print(f'Count:{count} ---> {x}')        
        #     count = count + 1
        if i[2] is None :
            Nota_Fiscal = 999
            Serie = 999
        else:
            Nota_Fiscal             = i[2]
            Serie                   = i[3]

        Empresa                 = i[0]
        Data                    = i[1]        
        Valor_da_Nota           = i[4]
        Veiculo                 = i[7]
        Chassi                  = i[8]
        #Forma_Pagamento         = i[]
        Vendedor                = i[15]
        Cliente                 = i[17]
        CPF_CNPJ_Cliente        = i[18]
        Novo                    = True
        Quantidade              = 1
        Operacao_Interna        = i[13]
        Data_Compra             = i[1]
        Custo_Medio             = i[5]
        # Margem                  = i[]
        # Margem_Porcentagem      = i[]
        Ano_Fab                 = i[9]
        Ano_Modelo              = i[10]
        Municipio               = i[12]
        # Valor_Tabela            = i[]
        # Emp_Funcionario         = i[]
        # Motivo_Devolucao        = i[]
        Cor                     = i[11]
        # Tipo                    = i[]
        # Telefone                = i[]
        # Celular                 = i[]
        # email                   = i[]
        # Placa                   = i[]
        # Despesa_Oficina         = i[]
        # Despesa_Financeira      = i[]
        # Valor_Venda_Gerencial   = i[]
        # Base_Comissao           = i[]
        # Forma_Fabrica           = i[]
        # Sub_Forma_Fabrica       = i[]
        # Modalidade_Venda        = i[]
        # Grupo_Pessoa_Vendedor   = i[]

        lista = Moto(
            Empresa                 = Empresa         ,
            Data                    = Data            ,
            Nota_Fiscal             = Nota_Fiscal     ,
            Serie                   = Serie           ,
            Valor_da_Nota           = Valor_da_Nota   ,
            Veiculo                 = Veiculo         ,
            Chassi                  = Chassi          ,
            #Forma_Pagamento        = #Forma_Pagamento,
            Vendedor                = Vendedor        ,
            Cliente                 = Cliente         ,
            Cpf_Cnpj_Cliente        = CPF_CNPJ_Cliente,
            Novo                    = Novo           ,
            Quantidade              = Quantidade      ,
            Operacao_Interna        = Operacao_Interna,
            Data_Compra             = Data_Compra     ,
            Custo_Medio             = Custo_Medio     ,
            # Margem                = # Margem        ,
            # Margem_Porcentagem    = # Margem_Porcent,
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
            # Forma_Fabrica         = i[]
            # Sub_Forma_Fabrica     = i[]
            # Modalidade_Venda      = i[]
            # Grupo_Pessoa_Vendedor = i[]
        )
        #print(i)
        aux.append(lista)

    Moto.objects.bulk_create(aux)
    print('deu certo')