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

create table Licao(
	codigo int identity(1,1) primary key,
	nome varchar(30) not null,
	urlImagem varchar(50) not null
)

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