create table Usuario(
	codigo int identity(1,1) primary key,
	nome varchar(30) not null,
	email varchar(30) not null,
	dataNascimento dateTime not null,
	nivel int not null
)

create table Pergunta(
	codigo int identity(1,1) primary key,
	texto varchar(50),
	nivel int not null,
	codResp1 int not null,
	codResp2 int not null,
	codResp3 int not null,
	codResp4 int not null,
	codRespCerta int not null

	constraint fkResp1 foreign key(codResp1) references Resposta(codigo),
	constraint fkResp2 foreign key(codResp2) references Resposta(codigo),
	constraint fkResp3 foreign key(codResp3) references Resposta(codigo),
	constraint fkResp4 foreign key(codResp4) references Resposta(codigo),
	constraint fkRespCerta foreign key(codRespCerta) references Resposta(codigo)
)

create table Resposta(
	codigo int identity(1,1) primary key,
	texto varchar(50) not null,
	urlImagem varchar(max) not null
)