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
	nivel int not null,
	teoria ntext not null
)

insert into Licao values('Reciclagem', '/Images/Licoes/Reciclagem/l1.png', 1)
insert into Licao values('Transportes', '/Images/Licoes/Transportes/p1r1.png', 2)
insert into Licao values('Energia', '/Images/Licoes/Energia/l2.png', 3)
insert into Licao values('Energia', '/Images/Licoes/Agua/l3.png', 6)

create table Paragrafo(
	codigo int identity(1,1) primary key,
	texto ntext not null,
	codLicao int not null

	constraint fkTeoriaLicao foreign key(codLicao) references Licao(codigo)
)

insert into Paragrafo values('A reciclagem � um processo em que determinados tipos de materiais, cotidianamente reconhecidos como lixo, s�o reutilizados como mat�ria-prima para a fabrica��o de novos produtos. Al�m de se apresentarem com propriedades f�sicas diferentes, estes tamb�m possuem uma nova composi��o qu�mica � fator principal que difere o reaproveitamento da reciclagem, conceitos estes muitas vezes confundidos.', 2)
insert into Paragrafo values('Este processo � importante, nos dias de hoje, porque transforma aquilo que iria ou j� se encontra no lixo em novos produtos, reduzindo res�duos que seriam lan�ados na natureza, ao mesmo tempo em que poupa mat�rias-primas, muitas vezes oriundas de recursos n�o renov�veis, e energia. Para produzir alum�nio reciclado, por exemplo, utiliza-se apenas 5% da energia necess�ria para fabricar o produto prim�rio.', 2)
insert into Paragrafo values('Dessa forma, � importante separar esses materiais, para que n�o sejam encaminhados juntamente com o lixo que n�o � recicl�vel, n�o tendo outro destino a n�o ser ocupar espa�o nos aterros sanit�rios e lix�es.', 2)
insert into Paragrafo values('Em nosso pa�s, quase toda a totalidade de latinhas descart�veis e garrafas PET s�o recicladas. Entretanto, pl�sticos, latas de a�o, vidro, dentre outros mat�rias, s�o pouco considerados neste processo, refor�ando as estat�sticas que apontam que somente 11% de tudo o que se joga na lata de lixo, em nosso pa�s �, de fato, reciclado.', 2)
insert into Paragrafo values('No Brasil, Curitiba (PR), Itabira (MG), Santo Andr� (SP) e Santos (SP) s�o as cidades que mais reciclam seus materiais.', 2)
insert into Paragrafo values('Por Mariana Araguaia , graduada em Biologia. Fonte : Brasil Escola', 2)
insert into Paragrafo values('Legenda dos lixos para reciclagem:', 2)
insert into Paragrafo values('* Vermelho: pl�stico', 2)
insert into Paragrafo values('* Azul: papel', 2)
insert into Paragrafo values('* Verde: vidro', 2)
insert into Paragrafo values('* Amarelo: metal', 2)
insert into Paragrafo values('* Marrom: org�nico (n�o recicl�vel)', 2)

insert into Paragrafo values('Os transportes s�o fundamentais para os cidad�os das cidades, porque permitem a locomo��o para trabalho e lazer. No entanto, se muitas pessoas utilizam o carro para transporte, as ruas da cidade v�o engarrafar sempre, porque muito espa�o � ocupado para poucas pessoas.', 3)
insert into Paragrafo values('Por isso, � importante que haja transportes coletivos ou individuais de pequeno porte. Por exemplo, se muitas pessoas v�o ao mesmo local, um �nibus � uma boa op��o, embora tamb�m polua o ar. Mas se algu�m quer ir para um local pr�ximo, pode ir de bicicleta ou at� mesmo de skate, que ocupa muito pouco espa�o.', 3)
insert into Paragrafo values('� da� que vem o termo mobilidade urbana, que significa uma locomo��o boa pela cidade, sem engarrafamentos, com velocidade e qualidade. Esse conceito tamb�m se relaciona com transporte sustent�vel.', 3)
insert into Paragrafo values('S�o importantes medidas que ampliem o transporte coletivo e sustent�vel para um maior bem estar de todos', 3)

insert into Paragrafo values('A energia movimenta o mundo e dela as empresas dependem para a produ��o, comercializa��o e distribui��o de seus produtos, seja no Brasil, nos Estados Unidos, na China ou qualquer outra parte da terra. Tamb�m as pessoas dependem da energia em suas resid�ncias, no trabalho e outros meios de conv�vio social. Por fim os pa�ses dependem da energia para movimentar suas economias e criar produtos competitivos no mundo globalizado. Mas quais os tipos de energia e como podemos classific�-las? Veja abaixo os principais tipos.', 3)
insert into Paragrafo values('Energia Hidrel�trica', 4)
insert into Paragrafo values('A energia hidrel�trica � aquela que � gerada em uma usina hidrel�trica e tem como fonte de produ��o a for�a da �gua em movimento. Para a sua obten��o s�o necess�rios os passos abaixo:', 4)
insert into Paragrafo values('Primeiro � necess�rio a constru��o de enormes barragens que s�o criadas sob o leito de um rio com a finalidade de represar a �gua;', 4)
insert into Paragrafo values('� �gua que corria livremente pelo leito do rio agora come�a a ficar contida pela barragem e inicia a forma��o de um grande reservat�rio;', 4)
insert into Paragrafo values('Enormes turbinas s�o instaladas nas barragens com certo desn�vel, permitindo que a �gua que passa pela barragem caia com enorme for�a sobre as turbinas que s�o movimentas transformando a energia potencial em energia mec�nica;', 4)
insert into Paragrafo values('A energia mec�nica gerada nas turbinas � captada por um gerador de eletricidade que a transforma em energia el�trica;', 4)
insert into Paragrafo values('A �ltima parte do processo � a transmiss�o da energia que ocorre por meio das redes de transmiss�o de alta tens�o. Quando chega ao seu destino a energia � transformada em baixa tens�o para as resid�ncias e com�rcios e em m�dia tens�o para as ind�strias.', 4)
insert into Paragrafo values('A grande maioria da energia gerada e consumida no Brasil � hidrel�trica, isto ocorre pelo enorme potencial hidrel�trico que o pa�s tem. A abund�ncia de rios e os longos percursos desses permitiram a constru��o de in�meras usinas hidrel�tricas por aqui. A grande vantagem da energia hidrel�trica � que ela limpa, ou seja, n�o � poluente o que contribui para o equil�brio ambiental.', 4)
insert into Paragrafo values('Energia E�lica', 4)
insert into Paragrafo values('A energia e�lica � talvez a bola da vez, isto �, ela est� na moda, assim como a energia solar(ver abaixo). Esta energia � produzida usando a for�a dos ventos para movimentar enormes aero-geradores que s�o conectados a turbinas para a gera��o da energia el�trica. Assim coo outras energias, a e�lica tamb�m � limpa e renov�vel o que a torna muito atraente para os dias atuais.', 4)
insert into Paragrafo values('Para a sua produ��o s�o necess�rios a instala��o dos aero-geradores em locais com abund�ncia de ventos, tanto em volume como em regularidade, ou seja, n�o basta ter ventos fontes � preciso que eles sejam constantes. A velocidade dos ventos precisa ser superior a 3,6 m/s.', 4)
insert into Paragrafo values('Assim como a energia hidrel�trica, o Brasil tem um grande potencial para a produ��o de energia e�lica, visto que h� regi�es onde a presen�a dos ventos favorece a instala��o de parques e�licos. Neste cen�rio destacam-se os estados do Rio Grande do Norte e Cear�, ambos na regi�o nordeste do pa�s. Atualmente os principais parques e�licos do Brasil s�o:', 4)
insert into Paragrafo values('Complexo e�lico Alto Sert�o I no estado da Bahia', 4)
insert into Paragrafo values('Parque e�lico de Os�rio no Rio Grande do Sul', 4)
insert into Paragrafo values('Usina de Energia E�lica de Praia Formosa no Cear�', 4)
insert into Paragrafo values('Energia Nuclear', 4)
insert into Paragrafo values('A energia nuclear se produz a partir de uma rea��o denominada fiss�o, a fiss�o segundo o Dicion�rio Priberan da L�ngua Portuguesa, � para a f�sica nuclear a divis�o de um n�cleo de �tomo pesado (ur�nio,plut�nio, etc.) em dois ou v�rios fragmentos, determinada por um bombardeamento de neutr�es, e que liberta uma enorme quantidade de energia e v�rios neutr�es. =CIS�O. E � a partir da fiss�o do n�cleo de um �tomo que bombardeia uns contra os  outros ocasionando o rompimento do n�cleos e gerando grandes quantidades de energia.', 4)
insert into Paragrafo values('As usinas nucleares, apesar de ser mais uma op��o de gerar energia el�trica, tamb�m provocam acidentes graves no ecossistema, assim como ocorreu nas usinas de Three Miles Island, nos EUA, em 1979, e Chernobyl, na Ucr�nia, em 1986, pois a extra��o do n�cleos dos �tomos ocorre a libera��o de dejetos radioativos que altera a gen�tica, provoca o c�ncer, al�m de danificar de modo incalcul�vel o meio ambiente.', 4)
insert into Paragrafo values('S� no Brasil existem duas usinas nucleares em funcionamento, (Angra 1 e 2), no munic�pio de Angra dos Reis, RJ.', 4)
insert into Paragrafo values('Energia Solar � T�rmica e Fotovoltaica', 4)
insert into Paragrafo values('O Sol � em si grande produtor de calor e pot�ncia, proporcionadas pela radia��o eletromagn�tica que ele libera, assim o Sol atrav�s de processos distintos � respons�vel pela gera��o de dois tipos de energia el�trica, a energia t�rmica e a energia fotovoltaica, entendamos como funciona cada processo e como cada uma � utilizada.', 4)
insert into Paragrafo values('A energia t�rmica � gerada a partir de coletores solares que ao captar a energia provinda do Sol transfere � �gua, utilizada geralmente em chuveiros el�tricos, pois a �gua � totalmente aquecida quando recebe a energia t�rmica. J� a energia fotovoltaica, possui duas poss�veis formas de ser coletadas, seja por l�minas ou por pain�is conhecidos por pain�is fotovoltaicos, tanto um como o outro s�o compostos de um material que possui capacidade de capturar a radia��o liberada pelo sol e produzir energia el�trica. A energia fotovoltaica possui mais um fator interessante, ela poder ser utilizada diretamente ou ent�o pode ser abrigada em baterias para ser utilizada quando n�o houver sol.', 4)
insert into Paragrafo values('A grande vantagem da energia provinda do sol, t�rmica ou fotovoltaica, � que � uma energia limpa, isto �, n�o ocasiona a polui��o, alem de dispensar a utiliza��o da turbinas e geradores, no entanto, o custo para a realiza��o desses processos ainda encontram-se elevados.', 4)
insert into Paragrafo values('Energia termel�trica', 4)
insert into Paragrafo values('Conhecida tamb�m por calor�fica, esta energia � resultante da combust�o de materiais de fontes n�o renov�veis, por exemplo, carv�o, petr�leo e g�s natural, e tamb�m outros de fontes renov�veis como a lenha, o baga�o de cana, etc. A energia termel�trica pode ser utilizada tanto como energia mec�nica como tamb�m por eletricidade.', 4)
insert into Paragrafo values('Depois de conhecer os tipos de energia el�trica que temos como op��o, nos d� sua opini�o sobre qual delas poderia ser muito �til a n�s e n�o causaria tantos danos ao meio ambiente.', 4)
insert into Paragrafo values('Fonte: www.educacao.cc', 4)

select * from Paragrafo
update Paragrafo set codLicao = 4 where codigo > 19

insert into Paragrafo values('', 4)

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
insert into Pergunta values('Selecione o lixo correto para a MA��: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a EMBALAGEM: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a LATA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a FOLHA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o LIVRO: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o PEIXE: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para o POTE: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a GARRAFA: ', 2, '', 5)
insert into Pergunta values('Selecione o lixo correto para a TA�A: ', 2, '', 5)


insert into Pergunta values('Selecione o transporte menos sustent�vel: ', 3, '', 4)
insert into Pergunta values('Selecione o transporte que ocupa menos espa�o: ', 3, '', 4)

insert into Pergunta values('Selecione a energia gerada pelo vento: ', 4, '', 4)
insert into Pergunta values('Selecione a energia gerada pela luminosidade: ', 4, '', 4)
insert into Pergunta values('Selecione a energia gerada pela �gua: ', 4, '', 4)
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
insert into Resposta values('�nibus', '/Images/Licoes/Transportes/p1r3.png', 22, 0)
insert into Resposta values('Carro', '/Images/Licoes/Transportes/p1r5.png', 22, 0)

insert into Resposta values('Bicicleta', '/Images/Licoes/Transportes/p1r1.png', 23, 0)
insert into Resposta values('Skate', '/Images/Licoes/Transportes/p1r2.png', 23, 1)
insert into Resposta values('�nibus', '/Images/Licoes/Transportes/p1r3.png', 23, 0)
insert into Resposta values('Carro', '/Images/Licoes/Transportes/p1r5.png', 23, 0)

insert into Resposta values('Solar', '/Images/Licoes/Energia/p1r1.png', 24, 0)
insert into Resposta values('E�lica', '/Images/Licoes/Energia/p1r2.png', 24, 1)
insert into Resposta values('Hidrel�trica', '/Images/Licoes/Energia/p1r3.png', 24, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 24, 0)

insert into Resposta values('Solar', '/Images/Licoes/Energia/p1r1.png', 25, 1)
insert into Resposta values('E�lica', '/Images/Licoes/Energia/p1r2.png', 25, 0)
insert into Resposta values('Termoel�trica', '/Images/Licoes/Energia/p1r7.png', 25, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 25, 0)

insert into Resposta values('E�lica', '/Images/Licoes/Energia/p1r2.png', 26, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 26, 0)
insert into Resposta values('Termoel�trica', '/Images/Licoes/Energia/p1r7.png', 26, 0)
insert into Resposta values('Hidrel�trica', '/Images/Licoes/Energia/p1r3.png', 26, 1)

insert into Resposta values('Hidrel�trica', '/Images/Licoes/Energia/p1r3.png', 27, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 27, 0)
insert into Resposta values('Termoel�trica', '/Images/Licoes/Energia/p1r7.png', 27, 1)
insert into Resposta values('E�lica', '/Images/Licoes/Energia/p1r2.png', 27, 0)

insert into Resposta values('Hidrel�trica', '/Images/Licoes/Energia/p1r3.png', 28, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 28, 1)
insert into Resposta values('Termoel�trica', '/Images/Licoes/Energia/p1r7.png', 28, 0)
insert into Resposta values('E�lica', '/Images/Licoes/Energia/p1r2.png', 28, 0)

create proc RespReciclagem_sp 
as

declare @i int = 8;

WHILE @i < 21
BEGIN
    insert into Resposta values('Pl�stico', '/Images/Licoes/Reciclagem/p1r1.png', @i, 0)
	insert into Resposta values('Papel', '/Images/Licoes/Reciclagem/p1r2.png', @i, 0)
	insert into Resposta values('Vidro', '/Images/Licoes/Reciclagem/p1r3.png', @i, 0)
	insert into Resposta values('Metal', '/Images/Licoes/Reciclagem/p1r4.png', @i, 0)
	insert into Resposta values('Org�nico', '/Images/Licoes/Reciclagem/p1r5.png', @i, 0)

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

insert into Cidade values('Riyadh', 'Ar�bia Saudita', 156)
insert into Cidade values('Dammam', 'Ar�bia Saudita', 121)
insert into Cidade values('Al Jubail', 'Ar�bia Saudit', 152)
insert into Cidade values('Zabol', 'Ir�', 217)
insert into Cidade values('Patna', '�ndia', 149)
insert into Cidade values('Ludhiana', '�ndia', 122)
insert into Cidade values('Dehli', '�ndia', 122)
insert into Cidade values('Gwalior', '�ndia', 176)
insert into Cidade values('Allahabad', '�ndia', 170)
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