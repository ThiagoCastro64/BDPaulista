create database paulistao
go
use paulistao

--cria a tabela times
create table times(
codigo int primary key,
nome varchar(100),
cidade varchar(100),
estadio varchar(100)
)
--insere os times
--cabecas de chave precisam ser os 4 primeiros cadastros 1,2,3,4
insert into times values
(5,'Agua Santa','Diadema','Distrital do inamar'),
(12,'Audax','Osasco','Jose Liberatti'),
(16,'Botafogo','Ribeirao Preto','Santa Cruz'),
(19,'Capivariano','Capivari','Arena Capivari'),
(1,'Corinthians','Sao Paulo','Arena Corinthians'),
(6,'Ferroviaria','Araraquara','Fonte Luminosa'),
(7,'Ituano','Itu','Novelli Junior'),
(8,'Linense','Lins','Gilberto Siqueira Lopes'),
(9,'Mogi Mirim','Mogi Mirim','Vail Chaves'),
(10,'Novorizontino','Novo Horizonte','Jorge Ismael de Biasi'),
(11,'Oeste','Itapolis','Amaros'),
(2,'Palmeiras','Sao Paulo','Allians Parque'),
(13,'Ponte Preta','Campinas','Moises Lucarelli'),
(14,'Red Bull Brasil','Campinas','Moises Lucarelli'),
(15,'Rio Claro','Rio Claro','Augusti Schmidt Filho'),
(3,'Santos','Santos','Vila Belmiro'),
(17,'Sao Bento','Sorocaba','Walter Ribeiro'),
(18,'Sao Bernardo','Sao Bernardo do Campo','Primeiro de Maio'),
(4,'Sao Paulo','Sao Paulo','Morumbi'),
(20,'XV de Novembro','Piracicaba','Barao de Serra Negra')
--cria a tabela grupos
create table grupos(
codigogrupo int identity primary key,
grupo varchar(100) CHECK (grupo in ('A','B','C','D')) ,
codigotime int
foreign key (codigotime) references times(codigo)
)
--cria a tabela jogos
create table jogos(
codigotimea int,
codigotimeb int ,
golstimea int,
golstimeb int,
data datetime

foreign key (codigotimea) references times(codigo),
foreign key (codigotimeb) references times(codigo)

)

--cria uma tabela para o grupo A para usar o codigo identity como indice
create table grupoa(
codigo int identity primary key,
grupo char (2),
codigotime int,

foreign key (codigotime) references times(codigo)

)
--cria uma tabela para o grupo B para usar o codigo identity como indice
create table grupob(
codigo int identity primary key,
grupo char (2),
codigotime int,


foreign key (codigotime) references times(codigo)

)
--cria uma tabela para o grupo C para usar o codigo identity como indice
create table grupoc(
codigo int identity primary key,
grupo char (2),
codigotime int,

foreign key (codigotime) references times(codigo)

)
--cria uma tabela para o grupo D para usar o codigo identity como indice
create table grupod(
codigo int identity primary key,
grupo char (2),
codigotime int,

foreign key (codigotime) references times(codigo)

)

-------------------------------------------------------------------------------------------------------------------

--cadastrar jogos 
create procedure sp_jogos
as

--limpar tabela de jogos
truncate table jogos

declare @ctdrodadas int,@timea int ,@timeb int,@data datetime,@grupoa char(2),@grupob char(2),
		@diasemana varchar(100),@ctdgrupoa int,@ctdgrupob int,@ctdgrupoc int,@ctdgrupod int,@ctdwhile int,
		@ctdaux int
set @timea = 0
set @timeb = 0
set @ctdgrupoa = 1
set @ctdgrupob = 5
set @ctdgrupoc = 1
set @ctdgrupod = 5
set @ctdrodadas = 1
set @ctdwhile = 1
set @ctdaux = 1
set @data = CONVERT(datetime,'31/01/2016',103) 

--criar as 5 primeiras rodadas
while (@ctdrodadas <= 5)
begin
		--insere os jogos do grupo A X grupo B
		while(@ctdwhile <= 5)
		begin
			
			--pega o dia da semana
			set @diasemana =  convert(varchar(100),(Select Datename(dw,@data)))
		
			--insere os times na tabela jogos
			insert into jogos values ((select codigotime from grupoa where codigo = @ctdgrupoa),
										(select codigotime from grupob where codigo = @ctdgrupob),
										0,0,@data)	
			
			--contador do while
			set @ctdwhile = @ctdwhile +1
			
			--contador para o grupo A ++
			set @ctdgrupoa= @ctdgrupoa +1
			
			--contador para o grupo B --
			set @ctdgrupob= @ctdgrupob -1
			
			-- se o contador B chegar a 0 ele volta para o final
			if (@ctdgrupob < 1)
			begin
				set @ctdgrupob = 5
			end			
						
									
		end	
		
		--volta o contador do while para 1
		set @ctdwhile = 1
		
		
		
		--insere os jogos do grupo C X grupo D
		while(@ctdwhile <= 5)
		begin
			
			--pega o dia da semana
			set @diasemana =  convert(varchar(100),(Select Datename(dw,@data)))
			
		
			--insere os times na tabela jogos
			insert into jogos values ((select codigotime from grupoc where codigo = @ctdgrupoc),
										(select codigotime from grupod where codigo = @ctdgrupod),
										0,0,@data)	
			
			--contador do while
			set @ctdwhile = @ctdwhile +1
			
			--contador para o grupo C ++
			set @ctdgrupoc= @ctdgrupoc +1
			
			--contador para o grupo D --
			set @ctdgrupod= @ctdgrupod -1
			
			-- se o contador D chegar a 0 ele volta para o final
			if (@ctdgrupod < 1)
			begin
				set @ctdgrupod = 5
			end			
						
									
		end	
		
				--verifica o dia para saber quantos dias pular
				if @diasemana = 'Quarta-Feira'
				begin
					set @data = @data +4
				end
				--verifica o dia para saber quantos dias pular	
				if @diasemana = 'Domingo'
				begin
					set @data = @data +3
				end	
				--print @data
	
		
		--volta o contador do while para 1
		set @ctdwhile = 1
		
		--contador B vai para a proxima posicao de inicio
		set @ctdgrupob = 5 - @ctdaux 
	
		--contador D vai para a proxima posicao de inicio
		set @ctdgrupod = 5 - @ctdaux 
	
		--contador auxiliar para mudanca de posicao ++
		set @ctdaux = @ctdaux + 1
	
		--volta o contador do A para 1
		set @ctdgrupoa = 1
		
		--volta o contador do C para 1
		set @ctdgrupoc = 1

	--contador da rodada ++
	set @ctdrodadas = @ctdrodadas +1
	
end

--volta o valor dos contadores para o inicio para fazer as proximas 5 rodadas
set @ctdgrupoa = 1
set @ctdgrupob = 1
set @ctdgrupoc = 5
set @ctdgrupod = 5
set @ctdrodadas = 1
set @ctdwhile = 1
set @ctdaux = 1

--criar as rodadas de 6 a 10
while (@ctdrodadas <= 5)
begin
		--insere os jogos do grupo A X grupo C
		while(@ctdwhile <= 5)
		begin
			
			--pega o dia da semana
			set @diasemana =  convert(varchar(100),(Select Datename(dw,@data)))
		
			--insere os times na tabela jogos
			insert into jogos values ((select codigotime from grupoa where codigo = @ctdgrupoa),
										(select codigotime from grupoc where codigo = @ctdgrupoc),
										0,0,@data)	
			
			--contador do while
			set @ctdwhile = @ctdwhile +1
			
			--contador para o grupo A ++
			set @ctdgrupoa= @ctdgrupoa +1
			
			--contador para o grupo C --
			set @ctdgrupoc= @ctdgrupoc -1
			
			-- se o contador C chegar a 0 ele volta para o final
			if (@ctdgrupoc < 1)
			begin
				set @ctdgrupoc = 5
			end			
						
									
		end	
		
		--volta o contador do while para 1
		set @ctdwhile = 1
		
		--insere os jogos do grupo B X grupo D
		while(@ctdwhile <= 5)
		begin
			
			--pega o dia da semana
			set @diasemana =  convert(varchar(100),(Select Datename(dw,@data)))
			print @diasemana
		
			--insere os times na tabela jogos
			insert into jogos values ((select codigotime from grupob where codigo = @ctdgrupob),
										(select codigotime from grupod where codigo = @ctdgrupod),
										0,0,@data)	
			
			--contador do while
			set @ctdwhile = @ctdwhile +1
			
			--contador para o grupo B ++
			set @ctdgrupob= @ctdgrupob +1
			
			--contador para o grupo D --
			set @ctdgrupod= @ctdgrupod -1
			
			-- se o contador D chegar a 0 ele volta para o final
			if (@ctdgrupod < 1)
			begin
				set @ctdgrupod = 5
			end			
						
									
		end	
		
		
		
				--verifica o dia para saber quantos dias pular
				if @diasemana = 'Quarta-Feira'
				begin
					set @data = @data +4
				end
				--verifica o dia para saber quantos dias pular	
				if @diasemana = 'Domingo'
				begin
					set @data = @data +3
				end	
	
		
		--volta o contador do while para 1
		set @ctdwhile = 1
		
		--contador C vai para a proxima posicao de inicio
		set @ctdgrupoc = 5 - @ctdaux 
	
		--contador D vai para a proxima posicao de inicio
		set @ctdgrupod = 5 - @ctdaux 
	
		--contador auxiliar para mudanca de posicao ++
		set @ctdaux = @ctdaux + 1
	
		--volta o contador do A para 1
		set @ctdgrupoa = 1
		
		--volta o contador do B para 1
		set @ctdgrupob = 1

	--contador da rodada ++
	set @ctdrodadas = @ctdrodadas +1
	
end

--volta o valor dos contadores para o inicio para fazer as proximas 5 rodadas
set @ctdgrupoa = 1
set @ctdgrupob = 1
set @ctdgrupoc = 5
set @ctdgrupod = 5
set @ctdrodadas = 1
set @ctdwhile = 1
set @ctdaux = 1

--criar as rodadas de 11 a 15 primeiras rodadas
while (@ctdrodadas <= 5)
begin



		--insere os jogos do grupo A X grupo D
		while(@ctdwhile <= 5)
		begin
			
			--pega o dia da semana
			set @diasemana =  convert(varchar(100),(Select Datename(dw,@data)))
		
			--insere os times na tabela jogos
			insert into jogos values ((select codigotime from grupoa where codigo = @ctdgrupoa),
										(select codigotime from grupod where codigo = @ctdgrupod),
										0,0,@data)	
			
			--contador do while
			set @ctdwhile = @ctdwhile +1
			
			--contador para o grupo A ++
			set @ctdgrupoa= @ctdgrupoa +1
			
			--contador para o grupo D --
			set @ctdgrupod= @ctdgrupod -1
			
			-- se o contador D chegar a 0 ele volta para o final
			if (@ctdgrupod < 1)
			begin
				set @ctdgrupod = 5
			end			
						
									
		end	
		
		--volta o contador do while para 1
		set @ctdwhile = 1
		
		
		
		--insere os jogos do grupo B X grupo C
		while(@ctdwhile <= 5)
		begin
			
			--pega o dia da semana
			set @diasemana =  convert(varchar(100),(Select Datename(dw,@data)))
			print @diasemana
		
			--insere os times na tabela jogos
			insert into jogos values ((select codigotime from grupob where codigo = @ctdgrupob),
										(select codigotime from grupoc where codigo = @ctdgrupoc),
										0,0,@data)	
			
			--contador do while
			set @ctdwhile = @ctdwhile +1
			
			--contador para o grupo B ++
			set @ctdgrupob= @ctdgrupob +1
			
			--contador para o grupo C --
			set @ctdgrupoc = @ctdgrupoc -1
			
			-- se o contador D chegar a 0 ele volta para o final
			if (@ctdgrupoc < 1)
			begin
				set @ctdgrupoc = 5
			end			
						
									
		end	
		
				--verifica o dia para saber quantos dias pular
				if @diasemana = 'Quarta-Feira'
				begin
					set @data = @data +4
				end
				--verifica o dia para saber quantos dias pular	
				if @diasemana = 'Domingo'
				begin
					set @data = @data +3
				end	
		
		
		--volta o contador do while para 1
		set @ctdwhile = 1
		
		--contador C vai para a proxima posicao de inicio
		set @ctdgrupoc = 5 - @ctdaux 
	
		--contador D vai para a proxima posicao de inicio
		set @ctdgrupod = 5 - @ctdaux 
	
		--contador auxiliar para mudanca de posicao ++
		set @ctdaux = @ctdaux + 1
	
		--volta o contador do A para 1
		set @ctdgrupoa = 1
		
		--volta o contador do B para 1
		set @ctdgrupob = 1

	--contador da rodada ++
	set @ctdrodadas = @ctdrodadas +1
	
end

-------------------------------------------------------------------------------------------------------------------

--procedure para criar os grupos
create procedure sp_grupos
as

declare @ctdgrupo int,@time int,@ctdtimes int
set @ctdgrupo = 0
set @time = 0
set @ctdtimes = 0

--verificar se os cabeças de chave ja estão nos grupos
while @ctdtimes <= 4
begin
	--contar quantos cabeças de chave estao nos grupos
	set @ctdgrupo = @ctdgrupo + (select COUNT(grupo) from grupos where codigogrupo = @ctdtimes)

	set @ctdtimes = @ctdtimes + 1

end
--acrescenta 1 no contador para ir para proximo
set @ctdgrupo = @ctdgrupo + 1

--coloca os cabeças de chave nos 4 grupos - os cabeça de chaves tem q ser os 4 primeiros cadastros
while (@ctdgrupo <= 4)
begin
	
	--enquanto o grupo nao tiver 1 cabeça de chave e todos os cabeça de chave estiverem em grupo 
	--e feito o random para coloca-los em um grupo
	while (select count(grupo) from grupos where codigogrupo = @ctdgrupo ) = 0 and @ctdgrupo <= 4
	begin
		--random entre 1 e 4
		set @time = convert(int,(4*rand())+1)
		
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 1 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('A',@time)
			set @ctdgrupo = @ctdgrupo + 1
		end
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 2 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('B',@time)
		set @ctdgrupo = @ctdgrupo + 1
		end
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 3 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('C',@time)
			set @ctdgrupo = @ctdgrupo + 1
		end
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 4 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('D',@time)
			set @ctdgrupo = @ctdgrupo + 1
		end
		
		
	end
	
end	

--volta o contador dos grupos para o grupo A
SET @ctdgrupo = 1
--conta quantos times estao cadastrados na tabela
SET @ctdtimes = (select COUNT(grupo)from grupos)

--coloca os times nos 4 grupos
while @ctdtimes < 20
begin 
	--enquanto o grupo nao tiver 5 times e todos os times estiverem em grupo 
	--e feito o random para coloca-los em um grupo
	while (select count(grupo) from grupos where codigogrupo = @ctdgrupo ) < 5 and @ctdtimes < 20
	begin
		--random entre 5 e 20
		set @time = 5 + convert(int,(20-5+1)*rand())
	
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 1 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('A',@time)
			set @ctdtimes = @ctdtimes + 1
			--se o grupo ja tiver 5 times muda para o proximo grupo
			if (select count(grupo) from grupos where grupo = 'A') > 4
			begin
				set @ctdgrupo = @ctdgrupo +1
			end
		end
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 2 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('B',@time)
			set @ctdtimes = @ctdtimes + 1
			--se o grupo ja tiver 5 times muda para o proximo grupo
			if (select count(grupo) from grupos where grupo = 'B') > 4
			begin
				set @ctdgrupo = @ctdgrupo +1
			end
		end
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 3 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('C',@time)
			set @ctdtimes = @ctdtimes + 1
			--se o grupo ja tiver 5 times muda para o proximo grupo
			if (select count(grupo) from grupos where grupo = 'C') > 4
			begin
				set @ctdgrupo = @ctdgrupo +1
			end
		end
		--verifica se o time ja esta esta em algum grupo
		if @ctdgrupo = 4 and (select count(grupo) from grupos where codigotime = @time ) = 0
		begin
			insert into grupos values('D',@time)
			set @ctdtimes = @ctdtimes + 1
			--se o grupo ja tiver 5 times muda para o proximo grupo
			if (select count(grupo) from grupos where grupo = 'D') > 4
			begin
				set @ctdgrupo = @ctdgrupo +1
			end
		end
	end
end
--executa a procedure para criar 4 tabelas para os grupos para poder usar o indice
exec sp_criar_vetores

-------------------------------------------------------------------------------------------------------------------

--procedure pra colocar os times em 4 tabelas diferentes
create procedure sp_criar_vetores
as

--limpar as tabelas de grupos
truncate table grupoa
truncate table grupob
truncate table grupoc
truncate table grupod

declare @ctd int ,@grupo char(2)

set @ctd = 1

while @ctd <= 20
begin

	set @grupo = (Select grupo from grupos where codigotime = @ctd)

	if (@grupo = 'A') 
	begin
		insert into grupoa values('A',@ctd)
	end
	if (@grupo = 'B') 
	begin
		insert into grupob values('B',@ctd)
	end
	if (@grupo = 'C') 
	begin
		insert into grupoc values('C',@ctd)
	end
	if (@grupo = 'D') 
	begin
		insert into grupod values('D',@ctd)
	end
	
	set @ctd = @ctd +1

end

select * from times

select * from jogos

select * from jogos order by data

select * from grupos
Truncate table grupos
truncate table jogos
exec sp_grupos

exec sp_jogos