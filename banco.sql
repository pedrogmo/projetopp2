create table Usuario(
	codigo int identity(1,1) primary key,
	nome varchar(50) not null,
	email varchar(50) not null,
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
	codUsuario int not null

	constraint fkUsuarioPublicacao foreign key(codUsuario) references Usuario(codigo)
)

create table RepostaPublicacao(
	codigo int identity(1,1) primary key,
	conteudo ntext not null,
	codUsuario int not null,
	codPublicacao int not null

	constraint fkUsuarioRespostaPublicacao foreign key(codUsuario) references Usuario(codigo)
)

create table Licao(
	codigo int identity(1,1) primary key,
	nome varchar(50) not null,	
	urlImagem varchar(50) not null,
	nivel int not null
)

insert into Licao values('Reciclagem','/Images/Licoes/i1.png', 1)

create table Pergunta(
	codigo int identity(1,1) primary key,
	texto varchar(50),
	nivel int not null,
	codRespCerta int not null,
	codLicao int not null

	constraint fkLicao foreign key(codLicao) references Licao(codigo)
)

create table Resposta(
	codigo int identity(1,1) primary key,
	texto varchar(50) not null,
	urlImagem varchar(50) not null,
	codPergunta int not null

	constraint fkPergunta foreign key(codPergunta) references Pergunta(codigo)
)

create table UsuarioLicao(
	codigo int identity(1,1) primary key,
	codUsuario int not null,
	codLicao int not null,
	data datetime not null

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

create table Erro(
	codigo int identity(1,1) primary key,
	nome varchar(50) not null,
	ocasioes int not null
)

insert into Erro values('Conex�o com banco', 1)
insert into Erro values('Ponteiro nulo', 5)
insert into Erro values('Formata��o de String', 3)
insert into Erro values('Importa��o de arquivo externo', 7)
insert into Erro values('L�gica errada', 2)
insert into Erro values('Css incorreto', 9)