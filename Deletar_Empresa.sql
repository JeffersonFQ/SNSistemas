/*DECLARE @EMPRESA INT
SET @EMPRESA = 10
UPDATE CONTASARECEBER SET NUMENTRADADEV = NULL WHERE CODEMPRESA = @EMPRESA
UPDATE NFENTRADA SET NUMSAIDAORIGEM = NULL WHERE CODEMPRESA = @EMPRESA
UPDATE NFSAIDA SET NUMENTRADAORIGEM = NULL WHERE CODEMPRESA = @EMPRESA
UPDATE NFSAIDA SET NUMPEDVENDA = NULL WHERE NUMPEDVENDA IS NOT NULL AND CODEMPRESA = @EMPRESA
update CONTASARECEBER set NUMACERTO=null WHERE CODEMPRESA = @EMPRESA
update CABPEDVENDA set NUMCARGA=null WHERE CODEMPRESA = @EMPRESA
update PREDEV set NUMPEDIDOORIGEM=null WHERE CODEMPRESA = @EMPRESA
UPDATE PESSOA SET CODEMPRESA=1 WHERE CODEMPRESA=@EMPRESA
UPDATE CXBANCO SET CODEMPRESA=1 WHERE CODEMPRESA=@EMPRESA
UPDATE PCPFORMULAMATRIZ SET CODEMPRESA=3 WHERE CODEMPRESA=@EMPRESA
UPDATE CONTASARECEBER_MOVCXBCO SET NUMLANCAMENTO =NULL WHERE NUMLANCAMENTO IN (SELECT NUMLANCAMENTO FROM CONTASARECEBER WHERE CODEMPRESA=@EMPRESA)
UPDATE CONTASARECEBER SET NUMACERTO = NULL WHERE NUMACERTO IN (SELECT ID FROM ACERTOCAIXA WHERE CODEMPRESA = @empresa)
UPDATE CONTASARECEBER SET NUMACERTO = NULL WHERE CODEMPRESA = @empresa 
UPDATE CONTASARECEBER SET NUMCARGA=NULL WHERE CODEMPRESA=@EMPRESA
UPDATE NIVEL_EMPRESA SET CODNIVEL = 1 WHERE CODEMPRESA=@EMPRESA
UPDATE A
SET A.NUMCARGA = (SELECT TOP 1 NUMCARGA FROM CARREGAMENTO WHERE CODEMPRESA =1)
FROM CONTASARECEBER A
INNER JOIN CARREGAMENTO B ON A.NUMCARGA = B.NUMCARGA
WHERE B.CODEMPRESA =@EMPRESA*/

--TESTES
--select * from NIVEL_EMPRESA where CODEMPRESA=18
--begin transaction
--delete from NIVEL_EMPRESA where CODEMPRESA=18
--SELECT * FROM EMPRESA WHERE CODIGO=10

declare @empresa int
set @EMPRESA = 10

--ALTER TABLE (TABELA) NOCHECK CONSTRAINT (CHAVE DA TABELA)
ALTER TABLE NIVEL_EMPRESA NOCHECK CONSTRAINT FK_6rh6qyfsolxurjklb9kv8t32v
alter table  pcpopagregado nocheck constraint  FK_mf01l46edlp48xn51xyptrcf2

--DELETE FROM (TABELA) WHERE (COLUNA) IN (SELECT (COLUNA) FROM (TABELA FONTE) WHERE CODEMPRESA=@empresa);
DELETE FROM CARGA_PEDIDO WHERE NUMPEDIDO IN (SELECT NUMPEDIDO FROM CABPEDVENDA WHERE CODEMPRESA=@empresa);
DELETE FROM MOVIMENTACAO WHERE NUMSAIDA IN (SELECT NUMSAIDA FROM CARGA_PEDIDO WHERE CODEMPRESA=@empresa);
DELETE FROM MOVIMENTACAO WHERE NUMSAIDA IN (SELECT NUMSAIDA FROM CONTASARECEBER WHERE CODEMPRESA=@empresa);
DELETE FROM NFSAIDA WHERE CODCXPDV IN (SELECT CODCXPDV FROM CXPDV WHERE CODEMPRESA=@empresa);
DELETE FROM ADIANTAMENTO_HISTMOV WHERE NUMADIANTA IN (SELECT NUMADIANTA FROM MOVIMENTACAO WHERE CODEMBALAGEM=@empresa);
DELETE FROM PCPOPAGREGADO WHERE codformula in (select codformula from PCPFORMULAMATRIZ where CODEMPRESA=@empresa);
DELETE FROM CONTASAPAGAR_MOVCXBCO WHERE NUMTRANSACAO IN (SELECT NUMTRANSACAO FROM MOVCXBCO WHERE CODEMPRESA=@empresa);
DELETE FROM CONTASARECEBER_MOVCXBCO WHERE NUMTRANSACAO IN (SELECT NUMTRANSACAO FROM MOVCXBCO WHERE CODEMPRESA=@empresa);
DELETE FROM FECHAMENTOCAIXAPDV WHERE NUMCAIXAPDV IN (SELECT NUMCAIXAPDV FROM CXPDV WHERE CODEMPRESA=@empresa);
DELETE FROM CXPDV_COMPLEMENTOS WHERE CODCXPDV IN (SELECT CODCXPDV FROM CXPDV WHERE CODEMPRESA=@empresa);
DELETE FROM CABPEDVENDA_COMPLEMENTOS WHERE NUMPEDIDO IN (SELECT NUMPEDIDO FROM CABPEDVENDA WHERE CODEMPRESA=@empresa);
DELETE FROM CUPOMSITEF WHERE NFCE IN (SELECT NFCE FROM NFSAIDA WHERE CODEMPRESA=@empresa);
DELETE FROM CPFNANOTA WHERE NUMSAIDA IN (SELECT NUMSAIDA FROM NFSAIDA WHERE CODEMPRESA=@empresa);
DELETE FROM CONTASARECEBER_COMPLEMENTOS WHERE NUMLANCAMENTO IN (SELECT NUMLANCAMENTO FROM CONTASARECEBER WHERE CODEMPRESA=@empresa);
DELETE FROM LOGDESDCRECEBER	WHERE CODCRECEBER IN (SELECT CODCRECEBER FROM CONTASARECEBER WHERE CODEMPRESA=@empresa);
DELETE FROM CAIXA_TITULO WHERE CODTITULO IN (SELECT CODTITULO FROM CONTASARECEBER WHERE CODEMPRESA=@empresa);
DELETE FROM CONTASARECEBER WHERE NUMSAIDA IN (SELECT NUMSAIDA FROM NFSAIDA WHERE CODEMPRESA=@empresa);
DELETE FROM COMISSAO WHERE NUMNFESAIDA IN (SELECT NUMNFESAIDA FROM NFSAIDA WHERE CODEMPRESA=@empresa);
DELETE FROM NFSAIDA_COMPLEMENTOS WHERE NUMSAIDA IN (SELECT NUMSAIDA FROM NFSAIDA WHERE CODEMPRESA=@empresa);
DELETE FROM ADIANTAMENTO_CONTASAPAGAR WHERE NUMCPAGAR IN (SELECT NUMCPAGAR FROM CONTASAPAGAR WHERE CODEMPRESA=@empresa);
DELETE FROM LOGDESDCPAGAR WHERE CODCPAGAR IN (SELECT CODCPAGAR FROM CONTASAPAGAR WHERE CODEMPRESA=@empresa);
DELETE FROM CONTASAPAGAR_MOVCXBCO WHERE NUMLANCAMENTO IN (SELECT NUMLANCAMENTO FROM CONTASAPAGAR WHERE CODEMPRESA=@empresa);
DELETE FROM CONTASAPAGAR WHERE NUMENTRADA IN (SELECT NUMENTRADA FROM NFENTRADA WHERE CODEMPRESA=@empresa);
DELETE FROM NFENTRADA_COMPLEMENTOS WHERE NUMENTRADA IN (SELECT NUMENTRADA FROM NFENTRADA WHERE CODEMPRESA=@empresa);
DELETE FROM ITEMPEDVENDA WHERE CODPRECOTABELA IN (SELECT CODPRECOTABELA FROM PRECOTABELA WHERE CODEMPRESAPRECO=@empresa);
delete from PCPOPAGREGADO where  numop in (select codformula from pcpop where codempresa=@empresa);

--DELETE FROM (TABELA) WHERE (COLUNA);
DELETE FROM FILIALCXBCO WHERE CODEMPRESA=@empresa;
DELETE FROM ACERTOCAIXA WHERE CODEMPRESA=@empresa;
DELETE FROM DESCONTOQUANTIDADE WHERE CODEMPRESA=@empresa;
DELETE FROM CARREGAMENTO WHERE CODEMPRESA=@empresa;
DELETE FROM CONTASARECEBER WHERE CODEMPRESA=@empresa;
DELETE FROM ADIANTAMENTO WHERE CODEMPRESA=@empresa;
DELETE FROM EMPRESA_COMPLEMENTOS WHERE CODEMPRESA=@empresa;
DELETE FROM CONTASAPAGAR WHERE CODEMPRESA=@empresa;
DELETE FROM PCPOP WHERE CODEMPRESA=@empresa;
DELETE FROM MOVCXBCO WHERE CODEMPRESA=@empresa;
DELETE FROM CXPDV WHERE CODEMPRESA=@empresa;
DELETE FROM MDE WHERE CODEMPRESA=@empresa;
DELETE FROM LOGPRECIFICACAO WHERE CODEMPRESA=@empresa;
DELETE FROM LOGINUTNFE WHERE CODEMPRESA=@empresa;
DELETE FROM RELACAOCSTIPISAIDAENTRADA WHERE CODEMPRESA=@empresa;
DELETE FROM RELACAOCSOSNSAIDACSTENTRADA WHERE CODEMPRESA=@empresa;
DELETE FROM RELACAOCFOPSAIDAENTRADA WHERE CODEMPRESA=@empresa;
DELETE FROM OSINVENTARIOITENS WHERE CODEMPRESA=@empresa;
DELETE FROM OSINVENTARIO WHERE CODEMPRESA=@empresa;
DELETE FROM CABPEDVENDA WHERE CODEMPRESA=@empresa;
DELETE FROM NFSAIDA WHERE CODEMPRESA=@empresa;
DELETE FROM NFENTRADA WHERE CODEMPRESA=@empresa;
DELETE FROM APURACAOICMS WHERE CODEMPRESA=@empresa;
DELETE FROM ITEMPEDVENDA WHERE CODEMPRESAPRECO=@empresa;
DELETE FROM MOVIMENTACAO WHERE CODEMPRESA=@empresa;
DELETE FROM PRECOTABELA	WHERE CODEMPRESAPRECO=@empresa;
DELETE FROM PRECO_ESTOQUE WHERE CODEMPRESA=@empresa;
DELETE FROM EMPRESA WHERE CODIGO=@empresa;

--ALTER TABLE (TABELA) CHECK CONSTRAINT (CHAVE DA TABELA)
ALTER TABLE NIVEL_EMPRESA CHECK CONSTRAINT FK_6rh6qyfsolxurjklb9kv8t32v
alter table pcpopagregado check constraint FK_mf01l46edlp48xn51xyptrcf2
