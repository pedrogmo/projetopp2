create table Usuario(
	codigo int identity(1,1) primary key,
	nome varchar(30) not null,
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

insert into Licao values('Reciclagem', '/Images/Licoes/Reciclagem/i1.png', 1)
insert into Licao values('Transportes', '/Images/Licoes/Transportes/i2.png', 2)
insert into Licao values('Energia', '/Images/Licoes/Energia/i3.png', 3)

create table Pergunta(
	codigo int identity(1,1) primary key,
	texto varchar(50),
	codLicao int not null

	constraint fkLicao foreign key(codLicao) references Licao(codigo)
)

insert into Pergunta values('Selecione o lixo correto', 2)

create table Resposta(
	codigo int identity(1,1) primary key,
	texto varchar(50) not null,
	urlImagem varchar(50) not null,
	codPergunta int not null,
	certa bit not null
	constraint fkPergunta foreign key(codPergunta) references Pergunta(codigo)
)

insert into Resposta values('Maçã', '/Images/Licoes/Reciclagem/maca.png', 6, 0)
insert into Resposta values('Peixinho', '/Images/Licoes/Reciclagem/peixe.png', 6, 0)
insert into Resposta values('Garrafa', '/Images/Licoes/Reciclagem/garrafa.png', 6, 1)
insert into Resposta values('Potin', '/Images/Licoes/Reciclagem/pote.png', 6, 0)

create table UsuarioLicao(
	codigo int identity(1,1) primary key,
	codUsuario int not null,
	codLicao int not null,
	data datetime not null,
	acertos int not null

	constraint fkLicaoFeita foreign key(codLicao) references Licao(codigo),
	constraint fkUsuarioQueFez foreign key(codUsuario) references Usuario(codigo)
)

insert into UsuarioLicao values(2, 2, '06/05/2019', 1)

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