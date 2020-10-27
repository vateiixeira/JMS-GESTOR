script_oficina = "select \
    empresa.dsapelido as Empresa , \
    notafiscal.dtemissao as Data, \
    notafiscal.nrnotafiscal as Nota_Fiscal, \
    notafiscal.dsserie as Serie,\
    notafiscal.vltotalnota as Valor_da_Nota , \
    Moto.dsinsumo as modelo_produto, \
    Moto.cdinsumofabricante as codigo_produto , \
    fp.dsformapagamento as forma_pagamento, \
    Vendedor.nmpessoa as vendedor_nome, \
    Vendedor.nrcpfcnpj as vendedor_cpf, \
    Cliente.nmpessoa as cliente_nome, \
    Cliente.nrcpfcnpj as cliente_cpf, \
    subgrupoinsumo.dssubgrupoinsumo as Novo, \
    itemnotafiscal.qtinsumo as Quantidade, \
    operacaointerna.dsoperacaointerna as dsoperacaointerna, \
    itemnotafiscal.vltotalcontabilitem as custo_medio, \
    municipio.dsmunicipio,\
    fp.dsformafabrica as forma_fabrica, \
    subfp.dssubformafabrica as sub_forma_fabrica, \
    subfp.dssubformapagamento as sub_forma_pagamento \
    from notafiscal \
    join itemnotafiscal on (notafiscal.cdnotafiscal = itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa = notafiscal.cdempresa) \
    join insumo Moto on (Moto.cdinsumo = itemnotafiscal.cdinsumo) \
    join subgrupoinsumo on (subgrupoinsumo.cdsubgrupoinsumo = Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo = Moto.cdgrupoinsumo) \
    join operacaointerna on (operacaointerna.cdoperacaointerna = notafiscal.cdoperacaointerna) \
    join empresa on (empresa.cdempresa = notafiscal.cdempresa) \
    left join nfsaidasaida on (nfsaidasaida.cdnotafiscal = notafiscal.cdnotafiscal and nfsaidasaida.cdempresa = notafiscal.cdempresa) \
    left join saida on (saida.cdsaida = nfsaidasaida.cdsaida and saida.cdempresa = nfsaidasaida.cdempresa) \
    left join veiculo on (veiculo.cdinsumo = Moto.cdinsumo) \
    left join cor on (cor.cdcor = veiculo.cdcor) \
    left join pessoa Vendedor on (Vendedor.cdpessoa = saida.cdvendedor ) \
    join pessoa Cliente on (cliente.cdpessoa = notafiscal.cdpessoa) \
    join municipio on (municipio.cdmunicipio = notafiscal.cdmunicipio) \
    left join conta c on (notafiscal.cdempresa = c.cdempresa and notafiscal.cdnotafiscal = c.cdnotafiscal and \
                                c.CDCONTA = (select first 1 (c1.CDCONTA) \
                        from CONTA c1 inner join FORMAPAGAMENTO fp on fp.CDFORMAPAGAMENTO = c1.CDFORMAPAGAMENTO \
                        where c1.CDEMPRESA = c.CDEMPRESA \
                                and c1.CDNOTAFISCAL = c.CDNOTAFISCAL)) \
    join formapagamento fp on (c.cdformapagamento = fp.cdformapagamento) \
    join subformapagamento subfp on (c.cdsubformapagamento = subfp.cdsubformapagamento and c.cdformapagamento = subfp.cdformapagamento) \
    left join notafiscalcancelamento cancela on (cancela.cdnotafiscal = notafiscal.cdnotafiscal and cancela.cdempresa = notafiscal.cdempresa  ) \
        where notafiscal.dtemissao > '09-01-2020' and notafiscal.cdoperacaointerna in(16,17,18,19,20,21,22,23,24,25,26,153) and  cancela.cdmotivocancelamento IS NULL"
script_venda_balcao = "select \
    empresa.dsapelido as Empresa , \
    notafiscal.dtemissao as Data, \
    notafiscal.nrnotafiscal as Nota_Fiscal, \
    notafiscal.dsserie as Serie,\
    notafiscal.vltotalnota as Valor_da_Nota , \
    Moto.dsinsumo as modelo_produto, \
    Moto.cdinsumofabricante as codigo_produto , \
    fp.dsformapagamento as forma_pagamento, \
    Vendedor.nmpessoa as vendedor_nome, \
    Vendedor.nrcpfcnpj as vendedor_cpf, \
    Cliente.nmpessoa as cliente_nome, \
    Cliente.nrcpfcnpj as cliente_cpf, \
    subgrupoinsumo.dssubgrupoinsumo as Novo, \
    itemnotafiscal.qtinsumo as Quantidade, \
    operacaointerna.dsoperacaointerna as dsoperacaointerna, \
    itemnotafiscal.vltotalcontabilitem as custo_medio, \
    municipio.dsmunicipio,\
    fp.dsformafabrica as forma_fabrica, \
    subfp.dssubformafabrica as sub_forma_fabrica, \
    subfp.dssubformapagamento as sub_forma_pagamento \
    from notafiscal \
    join itemnotafiscal on (notafiscal.cdnotafiscal = itemnotafiscal.cdnotafiscal and itemnotafiscal.cdempresa = notafiscal.cdempresa) \
    join insumo Moto on (Moto.cdinsumo = itemnotafiscal.cdinsumo) \
    join subgrupoinsumo on (subgrupoinsumo.cdsubgrupoinsumo = Moto.cdsubgrupoinsumo and subgrupoinsumo.cdgrupoinsumo = Moto.cdgrupoinsumo) \
    join operacaointerna on (operacaointerna.cdoperacaointerna = notafiscal.cdoperacaointerna) \
    join empresa on (empresa.cdempresa = notafiscal.cdempresa) \
    left join nfsaidasaida on (nfsaidasaida.cdnotafiscal = notafiscal.cdnotafiscal and nfsaidasaida.cdempresa = notafiscal.cdempresa) \
    left join saida on (saida.cdsaida = nfsaidasaida.cdsaida and saida.cdempresa = nfsaidasaida.cdempresa) \
    left join veiculo on (veiculo.cdinsumo = Moto.cdinsumo) \
    left join cor on (cor.cdcor = veiculo.cdcor) \
    left join pessoa Vendedor on (Vendedor.cdpessoa = saida.cdvendedor ) \
    join pessoa Cliente on (cliente.cdpessoa = notafiscal.cdpessoa) \
    join municipio on (municipio.cdmunicipio = notafiscal.cdmunicipio) \
    left join conta c on (notafiscal.cdempresa = c.cdempresa and notafiscal.cdnotafiscal = c.cdnotafiscal and \
                                c.CDCONTA = (select first 1 (c1.CDCONTA) \
                        from CONTA c1 inner join FORMAPAGAMENTO fp on fp.CDFORMAPAGAMENTO = c1.CDFORMAPAGAMENTO \
                        where c1.CDEMPRESA = c.CDEMPRESA \
                                and c1.CDNOTAFISCAL = c.CDNOTAFISCAL)) \
    join formapagamento fp on (c.cdformapagamento = fp.cdformapagamento) \
    join subformapagamento subfp on (c.cdsubformapagamento = subfp.cdsubformapagamento and c.cdformapagamento = subfp.cdformapagamento) \
    left join notafiscalcancelamento cancela on (cancela.cdnotafiscal = notafiscal.cdnotafiscal and cancela.cdempresa = notafiscal.cdempresa  ) \
        where notafiscal.dtemissao > '09-01-2020' and notafiscal.cdoperacaointerna in(5) and  cancela.cdmotivocancelamento IS NULL"
script_estoque_dia = "select \
    insumo.dsinsumo,\
    estoque.qtfinal\
    from estoque\
    join insumo on(estoque.cdinsumo = insumo.cdinsumo)\
    where dtestoque ='03-09-2020'"
select_contas_pagar = "\
        select\
        conta.vllancamento, \
        conta.dtemissao,\
        conta.dtvencimento,\
        conta.dtpagamento,\
        formapagamento.dsformapagamento,\
        contafinanceira.dscontafinanceira,\
        contafinanceira.tporigem,\
        conta.tpconta\
        from conta\
        left join notafiscal on (notafiscal.cdnotafiscal = conta.cdnotafiscal and conta.cdempresa = notafiscal.cdempresa)\
        join formapagamento on (conta.cdformapagamento = formapagamento.cdformapagamento)\
        join pessoa on (conta.cdpessoa = pessoa.cdpessoa)\
        join contafinanceira on (contafinanceira.cdcontafinanceira = conta.cdcontafinanceira)\
        where conta.dtvencimento='09-09-2020' and conta.dtpagamento IS NULL and contafinanceira.tporigem = 'D' "
select_contas_receber = "\
        select\
        conta.vllancamento, \
        conta.dtemissao,\
        conta.dtvencimento,\
        conta.dtpagamento,\
        formapagamento.dsformapagamento,\
        contafinanceira.dscontafinanceira,\
        contafinanceira.tporigem,\
        conta.tpconta\
        from conta\
        left join notafiscal on (notafiscal.cdnotafiscal = conta.cdnotafiscal and conta.cdempresa = notafiscal.cdempresa)\
        join formapagamento on (conta.cdformapagamento = formapagamento.cdformapagamento)\
        join pessoa on (conta.cdpessoa = pessoa.cdpessoa)\
        join contafinanceira on (contafinanceira.cdcontafinanceira = conta.cdcontafinanceira)\
        where conta.dtvencimento='09-09-2020' and conta.dtpagamento IS NULL and contafinanceira.tporigem = 'C' "