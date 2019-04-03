create table Usuario(
	codigo int identity(1,1) primary key,
	nome varchar(30) not null,
	email varchar(30) not null,
	senha varchar(30) not null,
	dataNascimento dateTime not null,
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

create table Pergunta(
	codigo int identity(1,1) primary key,
	texto varchar(50),
	nivel int not null,
	codRespCerta int not null
)

create table Resposta(
	codigo int identity(1,1) primary key,
	texto varchar(50) not null,
	urlImagem varchar(50) not null,
	codPergunta int not null

	constraint fkPergunta foreign key(codPergunta) references Pergunta(codigo)
)

alter table Pergunta
add constraint fkRespCerta foreign key(codRespCerta) references Resposta(codigo)