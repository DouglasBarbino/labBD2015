-- Trigger: controleEstoqueVenda
-- Autor: 

If Object_id ('controleEstoqueVenda','TR') Is Not Null 
Drop Trigger controleEstoqueVenda 
Go

	
		create trigger controleEstoqueVenda
		on produtoVenda
		after update
		as
		begin
		
		declare	@nova_quant numeric;
		declare @quantidadeMinima numeric;
		declare @nomeProduto varchar;
		declare @cod_produto numeric;
		
			select @nova_quant = Quantidade, @cod_produto = CodigoProduto, @nomeProduto = nome 
			from UPDATED;
			select @quantidadeMinima = QuantidadeMinima
			from produto
			where CodigoProduto = @cod_produto;
			
		if(@nova_quant <= @quantidadeMinima)
			Print N'Produto com estoque baixo :' + @nomeProduto+'.'
		
end;			
		
