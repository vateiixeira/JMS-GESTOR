select 
    empresa.dsapelido as Empresa,
    notafiscal.dtemissao as Data,
    notafiscal.nrnotafiscal as Nota_Fiscal,
    notafiscal.dsserie as Serie,
    notafiscal.vltotal as Valor_da_Nota,
    itemnotafiscal.vltotalcontabilitem as custo_medio,
    Moto.cdinsumo as cod_modelo,
    Moto.dsinsumo as modelo,
    Moto.cdinsumofabricante as chassi,
    veiculo.nrano as Ano_Fab,
    veiculo.nrmodelo as Modelo_Fab,
    cor.dscor as cor_veiculo,
    municipio.dsmunicipio,
    operacaointerna.dsoperacaointerna as motivo_venda,
    itemnotafiscal.qtinsumo as Quantidade,
    Vendedor.nmpessoa as vendedor_nome,
    Vendedor.nrcpfcnpj as vendedor_cpf,
    Cliente.nmpessoa as cliente_nome,
    Cliente.nrcpfcnpj as cliente_cpf,
    subgrupoinsumo.dssubgrupoinsumo as Cond_Moto 
    from notafiscal 
join itemnotafiscal on(notafiscal.cdnotafiscal=itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa=notafiscal.cdempresa)
join insumo Moto on(Moto.cdinsumo=itemnotafiscal.cdinsumo)
join subgrupoinsumo on(subgrupoinsumo.cdsubgrupoinsumo=Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo=Moto.cdgrupoinsumo)
join operacaointerna on(operacaointerna.cdoperacaointerna=notafiscal.cdoperacaointerna)
join empresa on(empresa.cdempresa=notafiscal.cdempresa)
join nfsaidasaida on(nfsaidasaida.cdnotafiscal=notafiscal.cdnotafiscal and nfsaidasaida.cdempresa=notafiscal.cdempresa)
join saida on(saida.cdsaida=nfsaidasaida.cdsaida and saida.cdempresa=nfsaidasaida.cdempresa)
join veiculo on(veiculo.cdinsumo=Moto.cdinsumo)
join cor on(cor.cdcor=veiculo.cdcor)
join pessoa Vendedor on(Vendedor.cdpessoa=saida.cdvendedor)
join pessoa Cliente on(cliente.cdpessoa=notafiscal.cdpessoa)
join municipio on(municipio.cdmunicipio=notafiscal.cdmunicipio)

notafiscal.cdnotafiscal = 23724

/*
where saida.cdoperacaointerna in (7) and saida.dtconfirmacao >= '01/01/2020' order by saida.cdsaida
notafiscal.cdnotafiscal = 23724
where notafiscal.cdempresa = 2 and notafiscal.dtemissao > '01/03/2020' and notafiscal.cdoperacaointerna in (7, 53) order by Nota_Fiscal * /
*/