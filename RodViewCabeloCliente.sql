-- View: CabeloCliente
-- Autor: Rodrigo

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS
        WHERE TABLE_NAME = 'CabeloCliente')
    DROP VIEW CabeloCliente
GO

create view  CabeloCliente as
	select fis.primeiro_nome+' '+fis.sobrenome as Nome, cab.tipo as TipoCabelo, cab.tamanho as TamanhoCabelo, cab.cor as CorCabelo
	from fisica as fis, cabelo as cab, cliente as cli
	where cab.cod_cabelo = cli.cod_cabelo and fis.CPF = cli.CPF