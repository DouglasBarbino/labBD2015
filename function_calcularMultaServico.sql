-- Function: calcularMultaServico
-- Verifica se j� passou a data do servi�o e ent�o calcula uma multa a partir do valor do servico
-- Autora: Gabriela

IF EXISTS (SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES
        WHERE ROUTINE_NAME = 'calcularMultaServico')
    DROP function calcularMultaServico;
GO

create function calcularMultaServico
		(@Valor numeric, @DataHoraPrevia date)
	returns numeric
		begin
		declare @Multa numeric;
		declare @DataAtual date;

		set @DataAtual = getdate();


		if @DataHoraPrevia < @DataAtual 
			set @Multa = @Valor*0.2;
		else
			set @Multa = 0

		return @Multa
		end;