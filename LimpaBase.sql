DECLARE @EMPRESA INT
SET @EMPRESA = 1
UPDATE CONTASARECEBER SET NUMENTRADADEV = NULL
UPDATE NFENTRADA SET NUMSAIDAORIGEM = NULL
UPDATE NFSAIDA SET NUMENTRADAORIGEM = NULL
UPDATE NFSAIDA SET NUMPEDVENDA = NULL WHERE NUMPEDVENDA IS NOT NULL
--GO
DELETE FROM ADIANTAMENTO_HISTMOV
DELETE CARREGAMENTO_COMPLEMENTO
DELETE FROM CUPOMSITEF
DELETE FROM POSNFCE
DELETE FROM OSINVENTARIOITENS
DELETE FROM OSINVENTARIO
DELETE FROM PCPOPAGREGADO
DELETE FROM PCPOP
DELETE FROM PCPFORMULAAGREGADO
DELETE FROM PCPFORMULAMATRIZ
DELETE FROM PRECOTABELA WHERE CODEMPRESAPRECO <> @EMPRESA
DELETE FROM PRECO_ESTOQUE WHERE CODEMPRESA <> @EMPRESA
DELETE FROM ITEMPEDCOMPRA
DELETE FROM CABPEDVENDA_COMPLEMENTOS
DELETE FROM CABPEDCOMPRA
DELETE FROM LOGPEDIDOFV
DELETE FROM ATENDIMENTOVISITACLIENTE
DELETE FROM CARGA_PEDIDO
DELETE FROM ITEMPEDVENDA
DELETE FROM CABPEDVENDA
DELETE FROM CPFNANOTA
DELETE FROM INFDOCMDFE
DELETE FROM ROTERIZACAOCARREGAMENTO
DELETE FROM ACOMPANHAMENTOENTREGAVEICULO
DELETE FROM CARTACORRECAO
DELETE FROM ADIANTAMENTO_CONTASAPAGAR
DELETE FROM ADIANTAMENTO
DELETE FROM LOGDESDCPAGAR
DELETE FROM CONTASAPAGAR_MOVCXBCO
DELETE FROM CONTASAPAGAR
DELETE FROM NFENTRADA_COMPLEMENTOS
DELETE FROM NFENTRADA
DELETE FROM COMISSAO
DELETE FROM CREDCLIENTE
DELETE FROM CAIXA_TITULO
DELETE FROM LOGDESDCRECEBER
DELETE FROM CONTASARECEBER
DELETE FROM CONTASARECEBER_MOVCXBCO
DELETE FROM NFSAIDA
DELETE FROM MOVIMENTACAO
DELETE FROM MOVCXBCO