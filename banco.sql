create table Usuario(
	codigo int identity(1,1) primary key,
	nickname varchar(20) not null,
	email varchar(30) not null,
	senha varchar(50) not null,
	dataNascimento date not null,
	nivel int not null,
	fotoPerfil varchar(max)
)

create table Acesso(
	codigo int identity(1,1) primary key,
	codUsuario int not null,
	data dateTime not null

	constraint fkUsuarioAcesso foreign key(codUsuario) references Usuario(codigo)
)

create table Publicacao(
	codigo int identity(1,1) primary key,
	conteudo ntext not null,
	codUsuario int not null,
	data datetime not null
	constraint fkUsuarioPublicacao foreign key(codUsuario) references Usuario(codigo)
)

create table RespostaPublicacao(
	codigo int identity(1,1) primary key,
	conteudo ntext not null,
	codUsuario int not null,
	codPublicacao int not null,
	data datetime not null
	constraint fkUsuarioRespostaPublicacao foreign key(codUsuario) references Usuario(codigo)
)

create table Licao(
	codigo int identity(1,1) primary key,
	nome varchar(50) not null,	
	urlImagem varchar(50) not null,
	nivel int not null
)

select * from Licao

insert into Licao values('Reciclagem', '/Images/Licoes/Reciclagem/l1.png', 1)
insert into Licao values('Transportes', '/Images/Licoes/Transportes/p1r1.png', 2)
insert into Licao values('Energia', '/Images/Licoes/Energia/l2.png', 3)
insert into Licao values('Energia', '/Images/Licoes/Agua/l3.png', 6)

create table Pergunta(
	codigo int identity(1,1) primary key,
	texto varchar(50),
	codLicao int not null,
	urlImagem varchar(50) not null,
	qtdRespostas int not null
	constraint fkLicao foreign key(codLicao) references Licao(codigo)
)

select * from Pergunta       

alter proc AlteraFoto_sp
as
declare @n int = 1;
declare @c int = 8;

while(@n < 14 and @c < 21)
begin
update Pergunta set urlImagem='/Images/Licoes/Reciclagem/p'+CONVERT(varchar(2), @n)+'.png' where codigo = @c
set @n += 1;
set @c += 1;      
end    

AlteraFoto_sp                                                                                                               

insert into Pergunta values('Selecione o lixo correto para a BANANA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o FRANGO: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a GARRAFA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a GARRAFA PET: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a MAÇÃ: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a EMBALAGEM: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a LATA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a FOLHA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o LIVRO: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o PEIXE: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o POTE: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a GARRAFA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a TAÇA: ', 2, '', 5)


insert into Pergunta values('Selecione o transporte menos sustentável: ', 3, '', 4)
insert into Pergunta values('Selecione o transporte mais sustentável: ', 3, '', 4)

insert into Pergunta values('Selecione a energia gerada pelo vento: ', 4, '', 4)
insert into Pergunta values('Selecione a energia gerada pela luminosidade: ', 4, '', 4)
insert into Pergunta values('Selecione a energia gerada pela água: ', 4, '', 4)
insert into Pergunta values('Selecione a energia mais poluente: ', 4, '', 4)
insert into Pergunta values('Selecione a energia mais perigosa: ', 4, '', 4)


create table Resposta(
	codigo int identity(1,1) primary key,
	texto varchar(50) not null,
	urlImagem varchar(50) not null,
	codPergunta int not null,
	certa bit not null
	constraint fkPergunta foreign key(codPergunta) references Pergunta(codigo)
)

select * from Resposta

insert into Resposta values('Bicicleta', '/Images/Licoes/Transportes/p1r1.png', 22, 0)
insert into Resposta values('Skate', '/Images/Licoes/Transportes/p1r2.png', 22, 1)
insert into Resposta values('Ônibus', '/Images/Licoes/Transportes/p1r3.png', 22, 0)
insert into Resposta values('Carro', '/Images/Licoes/Transportes/p1r5.png', 22, 0)

insert into Resposta values('Bicicleta', '/Images/Licoes/Transportes/p1r1.png', 23, 0)
insert into Resposta values('Skate', '/Images/Licoes/Transportes/p1r2.png', 23, 1)
insert into Resposta values('Ônibus', '/Images/Licoes/Transportes/p1r3.png', 23, 0)
insert into Resposta values('Carro', '/Images/Licoes/Transportes/p1r5.png', 23, 0)

insert into Resposta values('Bicicleta', '/Images/Licoes/Transportes/p1r1.png', 23, 0)
insert into Resposta values('Skate', '/Images/Licoes/Transportes/p1r2.png', 23, 1)
insert into Resposta values('Ônibus', '/Images/Licoes/Transportes/p1r3.png', 23, 0)
insert into Resposta values('Carro', '/Images/Licoes/Transportes/p1r5.png', 23, 0)

create proc RespReciclagem_sp 
as

declare @i int = 8;

WHILE @i < 21
BEGIN
    insert into Resposta values('Plástico', '/Images/Licoes/Reciclagem/p1r1.png', @i, 0)
	insert into Resposta values('Papel', '/Images/Licoes/Reciclagem/p1r2.png', @i, 0)
	insert into Resposta values('Vidro', '/Images/Licoes/Reciclagem/p1r3.png', @i, 0)
	insert into Resposta values('Metal', '/Images/Licoes/Reciclagem/p1r4.png', @i, 0)
	insert into Resposta values('Orgânico', '/Images/Licoes/Reciclagem/p1r5.png', @i, 0)

	set @i += 1;

END

RespReciclagem_sp

select * from Resposta

create table UsuarioLicao(
	codigo int identity(1,1) primary key,
	codUsuario int not null,
	codLicao int not null,
	data datetime not null,
	acertos int not null

	constraint fkLicaoFeita foreign key(codLicao) references Licao(codigo),
	constraint fkUsuarioQueFez foreign key(codUsuario) references Usuario(codigo)
)

create table Amizade(
	codigo int identity(1,1) primary key,
	codUsuario1 int not null,
	codUsuario2 int not null

	constraint fkUsuario1 foreign key(codUsuario1) references Usuario(codigo),
	constraint fkUsuario2 foreign key(codUsuario2) references Usuario(codigo)
)

insert into Amizade values(2,3)
insert into Amizade values(3,2)

create table Cidade(
	codigo int identity(1,1) primary key,
	nome varchar(50) not null,
	pais varchar(50) not null,	
	poluicao int not null
)

insert into Cidade values('Riyadh', 'Arábia Saudita', 156)
insert into Cidade values('Dammam', 'Arábia Saudita', 121)
insert into Cidade values('Al Jubail', 'Arábia Saudit', 152)
insert into Cidade values('Zabol', 'Irã', 217)
insert into Cidade values('Patna', 'Índia', 149)
insert into Cidade values('Ludhiana', 'Índia', 122)
insert into Cidade values('Dehli', 'Índia', 122)
insert into Cidade values('Gwalior', 'Índia', 176)
insert into Cidade values('Allahabad', 'Índia', 170)
insert into Cidade values('Xingtau', 'China', 128)
insert into Cidade values('Shijiazhuang', 'China', 121)
insert into Cidade values('Baoding', 'China', 126)

create table Notificacao(
	codigo int identity(1,1) primary key,
	texto ntext not null,
	codUsuario int not null
	url varchar(50) not null
	constraint fkUsuarioNot foreign key(codUsuario) references Usuario(codigo)
)

create table SolicitacaoAmizade(
	codigo int identity(1,1) primary key,
	codUsuario1 int not null,
	codUsuario2 int not null

	constraint fkUsuarioS1 foreign key(codUsuario1) references Usuario(codigo),
	constraint fkUsuarioS2 foreign key(codUsuario2) references Usuario(codigo)
)

alter trigger delete_usuario on Usuario
instead of delete
as
declare @codU int
select @codU = codigo from Deleted
delete from Notificacao where codUsuario = @codU
delete from Acesso where codUsuario = @codU
delete from Amizade where codUsuario1 = @codU
delete from Amizade where codUsuario2 = @codU
delete from SolicitacaoAmizade where codUsuario1 = @codU
delete from SolicitacaoAmizade where codUsuario2 = @codU
delete from UsuarioLicao where codUsuario = @codU
delete from Publicacao where codUsuario = @codU
delete from RespostaPublicacao where codUsuario = @codU
delete from Usuario where codigo = @codU

create trigger delete_publicacao on Publicacao
instead of delete
as
declare @codP int
select @codP = codigo from Deleted
delete from RespostaPublicacao where codPublicacao = @codP
delete from Publicacao where codigo = @codP