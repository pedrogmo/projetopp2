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
	codUsuario int not null,
	data datetime not null
	constraint fkUsuarioPublicacao foreign key(codUsuario) references Usuario(codigo)
)

create table RepostaPublicacao(
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

insert into Licao values('Reciclagem','/Images/Licoes/i1.png', 1)

create table Pergunta(
	codigo int identity(1,1) primary key,
	texto varchar(50),
	codLicao int not null

	constraint fkLicao foreign key(codLicao) references Licao(codigo)
)

insert into Pergunta values('O que é reciclagem?', 1, 2)
insert into Pergunta values('Por que é bom reciclar?', 1, 2)

create table Resposta(
	codigo int identity(1,1) primary key,
	texto varchar(50) not null,
	urlImagem varchar(50) not null,
	codPergunta int not null,
	certa bit not null
	constraint fkPergunta foreign key(codPergunta) references Pergunta(codigo)
)

insert into Resposta values('É refazer objetos com materias usados', '', 2, 1)
insert into Resposta values('Porque gasta menos material', '', 3, 1)

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

create table ProblemaAmbiental(
	codigo int identity(1,1) primary key,
	nome varchar(50) not null,
	ocasioes int not null
)

insert into ProblemaAmbiental values('Poluição', 10)
insert into ProblemaAmbiental values('Chuva ácida', 5)

create table Notificacao(
	codigo int identity(1,1) primary key,
	texto ntext not null,
	codUsuario int not null

	constraint fkUsuarioNot foreign key(codUsuario) references Usuario(codigo)
)

create table SolicitacaoAmizade(
	codigo int identity(1,1) primary key,
	codUsuario1 int not null,
	codUsuario2 int not null

	constraint fkUsuarioS1 foreign key(codUsuario1) references Usuario(codigo),
	constraint fkUsuarioS2 foreign key(codUsuario2) references Usuario(codigo)
)