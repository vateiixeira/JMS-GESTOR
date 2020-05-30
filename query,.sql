select
  lpad(nf.CDEMPRESA,3,'0') || lpad(nf.CDNOTAFISCAL,9,'0') as ID,
  nf.CDEMPRESA as ID_LOJA,
  nf.DTEMISSAO as DATAVENDA,
  nf.DTMOVIMENTACAO as DATAFATURAMENTO,
  decode(nf.IDESTADO,4,nf.DTALTERACAO,NULL) as DTCANCELAMENTO,
  (select first 1 nfd.DTMOVIMENTACAO
   from NOTAFISCALNFORIGEM nfnfo inner join NOTAFISCAL nfd
          on nfd.CDEMPRESA = nfnfo.CDEMPRESA
             and nfd.CDNOTAFISCAL = nfnfo.CDNOTAFISCAL
   where nfnfo.CDEMPRESA = nf.CDEMPRESA
         and nfnfo.CDNOTAFISCALORIGEM = nf.CDNOTAFISCAL
         and nfnfo.TPORIGEM = 1
         and nfd.IDESTADO = 3
  ) as DTDEVOLUCAO,
  pv.CDPESSOA as ID_FUNCIONARIO,
  pv.NRCPFCNPJ as CPFFUNCIONARIO,
  p.CDPESSOA as ID_CLIENTE,
  p.NRCPFCNPJ as CPFCLIENTE,
  v.CDMODELOVEICULO as ID_PRODUTO,
  v.NRCHASSI as CHASSI,
  v.NRPLACA as PLACA,
  decode(oi.IDVEICULONOVO,1,'Novo',0,'Usado') as ID_TIPO_PRODUTO,
  inf.VLINSUMOORIGINAL as VLRPRODUTO,
  inf.VLTOTALITEM as VLRVENDA,
  fp.dsformapagamento as FORMA_PAGAMENTO,
  c.CDFORMAPAGAMENTO as ID_TIPO_VENDA,
  oi.CDOPERACAOINTERNA as ID_TIPO_MOVIMENTACAO,
  lpad(c.CDFORMAPAGAMENTO,3,'0') || lpad(c.CDSUBFORMAPAGAMENTO,3,'0') as ID_FORMA_DE_PAGAMENTO,
  nf.NRNOTAFISCAL as NOTAFISCAL_NUMERO,
  nf.DSSERIE as NOTAFISCAL_SERIE,
  nf.DTALTERACAO as DATA_ALTERACAO,
  nf.CDEMPRESA,
  nf.CDNOTAFISCAL,
  fed.CDEMPRESA as ID_LOJA_VENDEDOR
from
  NOTAFISCAL nf inner join OPERACAOINTERNA oi
    on oi.CDOPERACAOINTERNA = nf.CDOPERACAOINTERNA
  inner join ITEMNOTAFISCAL inf
    on inf.CDEMPRESA = nf.CDEMPRESA
       and inf.CDNOTAFISCAL = nf.CDNOTAFISCAL
  inner join VEICULO v
    on v.CDINSUMO = inf.CDINSUMO
  inner join PESSOA p
    on p.CDPESSOA = nf.CDPESSOA
  left outer join PESSOA pv
    on pv.CDPESSOA = inf.CDPESSOA
  left outer join CONTA c
    on c.CDEMPRESA = nf.CDEMPRESA
      and c.CDNOTAFISCAL = nf.CDNOTAFISCAL
      and c.CDCONTA = (select first 1 (c1.CDCONTA)
                       from CONTA c1 inner join FORMAPAGAMENTO fp on fp.CDFORMAPAGAMENTO = c1.CDFORMAPAGAMENTO
                       where c1.CDEMPRESA = c.CDEMPRESA
                             and c1.CDNOTAFISCAL = c.CDNOTAFISCAL
                             and c1.IDESTADO in (2,3,4)
                       order by fp.NRPRIORIDADE, c1.VLLANCAMENTO desc
                      )
  left outer join FUNCIONARIOEMPRESADATA fed on
    fed.CDPESSOA = pv.CDPESSOA
    and fed.DTINICIO <= nf.DTMOVIMENTACAO
    and ((fed.DTFIM is null) or (fed.DTFIM >= nf.DTMOVIMENTACAO))
where
  ((oi.TPORIGEMOPERACAO = 2) or ((oi.TPORIGEMOPERACAO = 6) and (oi.IDVEICULOIMOBILIZADO = 1)))
  and oi.TPOPERACAO in (2,13)
  and nf.IDESTADO in (3,4)
;