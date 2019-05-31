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

insert into Paragrafo values('A reciclagem é um processo em que determinados tipos de materiais, cotidianamente reconhecidos como lixo, são reutilizados como matéria-prima para a fabricação de novos produtos. Além de se apresentarem com propriedades físicas diferentes, estes também possuem uma nova composição química – fator principal que difere o reaproveitamento da reciclagem, conceitos estes muitas vezes confundidos.', 2)
insert into Paragrafo values('Este processo é importante, nos dias de hoje, porque transforma aquilo que iria ou já se encontra no lixo em novos produtos, reduzindo resíduos que seriam lançados na natureza, ao mesmo tempo em que poupa matérias-primas, muitas vezes oriundas de recursos não renováveis, e energia. Para produzir alumínio reciclado, por exemplo, utiliza-se apenas 5% da energia necessária para fabricar o produto primário.', 2)
insert into Paragrafo values('Dessa forma, é importante separar esses materiais, para que não sejam encaminhados juntamente com o lixo que não é reciclável, não tendo outro destino a não ser ocupar espaço nos aterros sanitários e lixões.', 2)
insert into Paragrafo values('Em nosso país, quase toda a totalidade de latinhas descartáveis e garrafas PET são recicladas. Entretanto, plásticos, latas de aço, vidro, dentre outros matérias, são pouco considerados neste processo, reforçando as estatísticas que apontam que somente 11% de tudo o que se joga na lata de lixo, em nosso país é, de fato, reciclado.', 2)
insert into Paragrafo values('No Brasil, Curitiba (PR), Itabira (MG), Santo André (SP) e Santos (SP) são as cidades que mais reciclam seus materiais.', 2)
insert into Paragrafo values('Por Mariana Araguaia , graduada em Biologia. Fonte : Brasil Escola', 2)
insert into Paragrafo values('Legenda dos lixos para reciclagem:', 2)
insert into Paragrafo values('* Vermelho: plástico', 2)
insert into Paragrafo values('* Azul: papel', 2)
insert into Paragrafo values('* Verde: vidro', 2)
insert into Paragrafo values('* Amarelo: metal', 2)
insert into Paragrafo values('* Marrom: orgânico (não reciclável)', 2)

insert into Paragrafo values('Os transportes são fundamentais para os cidadãos das cidades, porque permitem a locomoção para trabalho e lazer. No entanto, se muitas pessoas utilizam o carro para transporte, as ruas da cidade vão engarrafar sempre, porque muito espaço é ocupado para poucas pessoas.', 3)
insert into Paragrafo values('Por isso, é importante que haja transportes coletivos ou individuais de pequeno porte. Por exemplo, se muitas pessoas vão ao mesmo local, um ônibus é uma boa opção, embora também polua o ar. Mas se alguém quer ir para um local próximo, pode ir de bicicleta ou até mesmo de skate, que ocupa muito pouco espaço.', 3)
insert into Paragrafo values('É daí que vem o termo mobilidade urbana, que significa uma locomoção boa pela cidade, sem engarrafamentos, com velocidade e qualidade. Esse conceito também se relaciona com transporte sustentável.', 3)
insert into Paragrafo values('São importantes medidas que ampliem o transporte coletivo e sustentável para um maior bem estar de todos', 3)

insert into Paragrafo values('A energia movimenta o mundo e dela as empresas dependem para a produção, comercialização e distribuição de seus produtos, seja no Brasil, nos Estados Unidos, na China ou qualquer outra parte da terra. Também as pessoas dependem da energia em suas residências, no trabalho e outros meios de convívio social. Por fim os países dependem da energia para movimentar suas economias e criar produtos competitivos no mundo globalizado. Mas quais os tipos de energia e como podemos classificá-las? Veja abaixo os principais tipos.', 3)
insert into Paragrafo values('Energia Hidrelétrica', 4)
insert into Paragrafo values('A energia hidrelétrica é aquela que é gerada em uma usina hidrelétrica e tem como fonte de produção a força da água em movimento. Para a sua obtenção são necessários os passos abaixo:', 4)
insert into Paragrafo values('Primeiro é necessário a construção de enormes barragens que são criadas sob o leito de um rio com a finalidade de represar a água;', 4)
insert into Paragrafo values('Á água que corria livremente pelo leito do rio agora começa a ficar contida pela barragem e inicia a formação de um grande reservatório;', 4)
insert into Paragrafo values('Enormes turbinas são instaladas nas barragens com certo desnível, permitindo que a água que passa pela barragem caia com enorme força sobre as turbinas que são movimentas transformando a energia potencial em energia mecânica;', 4)
insert into Paragrafo values('A energia mecânica gerada nas turbinas é captada por um gerador de eletricidade que a transforma em energia elétrica;', 4)
insert into Paragrafo values('A última parte do processo é a transmissão da energia que ocorre por meio das redes de transmissão de alta tensão. Quando chega ao seu destino a energia é transformada em baixa tensão para as residências e comércios e em média tensão para as indústrias.', 4)
insert into Paragrafo values('A grande maioria da energia gerada e consumida no Brasil é hidrelétrica, isto ocorre pelo enorme potencial hidrelétrico que o país tem. A abundância de rios e os longos percursos desses permitiram a construção de inúmeras usinas hidrelétricas por aqui. A grande vantagem da energia hidrelétrica é que ela limpa, ou seja, não é poluente o que contribui para o equilíbrio ambiental.', 4)
insert into Paragrafo values('Energia Eólica', 4)
insert into Paragrafo values('A energia eólica é talvez a bola da vez, isto é, ela está na moda, assim como a energia solar(ver abaixo). Esta energia é produzida usando a força dos ventos para movimentar enormes aero-geradores que são conectados a turbinas para a geração da energia elétrica. Assim coo outras energias, a eólica também é limpa e renovável o que a torna muito atraente para os dias atuais.', 4)
insert into Paragrafo values('Para a sua produção são necessários a instalação dos aero-geradores em locais com abundância de ventos, tanto em volume como em regularidade, ou seja, não basta ter ventos fontes é preciso que eles sejam constantes. A velocidade dos ventos precisa ser superior a 3,6 m/s.', 4)
insert into Paragrafo values('Assim como a energia hidrelétrica, o Brasil tem um grande potencial para a produção de energia eólica, visto que há regiões onde a presença dos ventos favorece a instalação de parques eólicos. Neste cenário destacam-se os estados do Rio Grande do Norte e Ceará, ambos na região nordeste do país. Atualmente os principais parques eólicos do Brasil são:', 4)
insert into Paragrafo values('Complexo eólico Alto Sertão I no estado da Bahia', 4)
insert into Paragrafo values('Parque eólico de Osório no Rio Grande do Sul', 4)
insert into Paragrafo values('Usina de Energia Eólica de Praia Formosa no Ceará', 4)
insert into Paragrafo values('Energia Nuclear', 4)
insert into Paragrafo values('A energia nuclear se produz a partir de uma reação denominada fissão, a fissão segundo o Dicionário Priberan da Língua Portuguesa, é para a física nuclear a divisão de um núcleo de átomo pesado (urânio,plutônio, etc.) em dois ou vários fragmentos, determinada por um bombardeamento de neutrões, e que liberta uma enorme quantidade de energia e vários neutrões. =CISÃO. E é a partir da fissão do núcleo de um átomo que bombardeia uns contra os  outros ocasionando o rompimento do núcleos e gerando grandes quantidades de energia.', 4)
insert into Paragrafo values('As usinas nucleares, apesar de ser mais uma opção de gerar energia elétrica, também provocam acidentes graves no ecossistema, assim como ocorreu nas usinas de Three Miles Island, nos EUA, em 1979, e Chernobyl, na Ucrânia, em 1986, pois a extração do núcleos dos átomos ocorre a liberação de dejetos radioativos que altera a genética, provoca o câncer, além de danificar de modo incalculável o meio ambiente.', 4)
insert into Paragrafo values('Só no Brasil existem duas usinas nucleares em funcionamento, (Angra 1 e 2), no município de Angra dos Reis, RJ.', 4)
insert into Paragrafo values('Energia Solar – Térmica e Fotovoltaica', 4)
insert into Paragrafo values('O Sol é em si grande produtor de calor e potência, proporcionadas pela radiação eletromagnética que ele libera, assim o Sol através de processos distintos é responsável pela geração de dois tipos de energia elétrica, a energia térmica e a energia fotovoltaica, entendamos como funciona cada processo e como cada uma é utilizada.', 4)
insert into Paragrafo values('A energia térmica é gerada a partir de coletores solares que ao captar a energia provinda do Sol transfere à água, utilizada geralmente em chuveiros elétricos, pois a água é totalmente aquecida quando recebe a energia térmica. Já a energia fotovoltaica, possui duas possíveis formas de ser coletadas, seja por lâminas ou por painéis conhecidos por painéis fotovoltaicos, tanto um como o outro são compostos de um material que possui capacidade de capturar a radiação liberada pelo sol e produzir energia elétrica. A energia fotovoltaica possui mais um fator interessante, ela poder ser utilizada diretamente ou então pode ser abrigada em baterias para ser utilizada quando não houver sol.', 4)
insert into Paragrafo values('A grande vantagem da energia provinda do sol, térmica ou fotovoltaica, é que é uma energia limpa, isto é, não ocasiona a poluição, alem de dispensar a utilização da turbinas e geradores, no entanto, o custo para a realização desses processos ainda encontram-se elevados.', 4)
insert into Paragrafo values('Energia termelétrica', 4)
insert into Paragrafo values('Conhecida também por calorífica, esta energia é resultante da combustão de materiais de fontes não renováveis, por exemplo, carvão, petróleo e gás natural, e também outros de fontes renováveis como a lenha, o bagaço de cana, etc. A energia termelétrica pode ser utilizada tanto como energia mecânica como também por eletricidade.', 4)
insert into Paragrafo values('Depois de conhecer os tipos de energia elétrica que temos como opção, nos dê sua opinião sobre qual delas poderia ser muito útil a nós e não causaria tantos danos ao meio ambiente.', 4)
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
insert into Pergunta values('Selecione o transporte que ocupa menos espaço: ', 3, '', 4)

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

insert into Resposta values('Solar', '/Images/Licoes/Energia/p1r1.png', 24, 0)
insert into Resposta values('Eólica', '/Images/Licoes/Energia/p1r2.png', 24, 1)
insert into Resposta values('Hidrelétrica', '/Images/Licoes/Energia/p1r3.png', 24, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 24, 0)

insert into Resposta values('Solar', '/Images/Licoes/Energia/p1r1.png', 25, 1)
insert into Resposta values('Eólica', '/Images/Licoes/Energia/p1r2.png', 25, 0)
insert into Resposta values('Termoelétrica', '/Images/Licoes/Energia/p1r7.png', 25, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 25, 0)

insert into Resposta values('Eólica', '/Images/Licoes/Energia/p1r2.png', 26, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 26, 0)
insert into Resposta values('Termoelétrica', '/Images/Licoes/Energia/p1r7.png', 26, 0)
insert into Resposta values('Hidrelétrica', '/Images/Licoes/Energia/p1r3.png', 26, 1)

insert into Resposta values('Hidrelétrica', '/Images/Licoes/Energia/p1r3.png', 27, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 27, 0)
insert into Resposta values('Termoelétrica', '/Images/Licoes/Energia/p1r7.png', 27, 1)
insert into Resposta values('Eólica', '/Images/Licoes/Energia/p1r2.png', 27, 0)

insert into Resposta values('Hidrelétrica', '/Images/Licoes/Energia/p1r3.png', 28, 0)
insert into Resposta values('Nuclear', '/Images/Licoes/Energia/p1r6.png', 28, 1)
insert into Resposta values('Termoelétrica', '/Images/Licoes/Energia/p1r7.png', 28, 0)
insert into Resposta values('Eólica', '/Images/Licoes/Energia/p1r2.png', 28, 0)

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