-- Retorna Nome e Ano dos Filmes
SELECT Nome, Ano FROM Filmes

-- Retorna Nome e Ano dos Filmes em Ordem Crescente de Ano
SELECT Nome, Ano FROM Filmes ORDER BY Ano

-- Retorna "De Volta para O Futuro" com Nome, Ano e Duração
SELECT Nome, Ano, Duracao FROM Filmes WHERE Nome = 'De Volta para O Futuro'

-- Retorna filmes lançados em 1997
SELECT * FROM Filmes WHERE Ano = 1997

-- Retorna filmes lançados após 2000
SELECT * FROM Filmes WHERE Ano > 2000

-- Retorna filmes com duração maior que 100 e menor que 150, ordenando por duração crescente
SELECT * FROM Filmes WHERE Duracao > 100 AND Duracao < 150 ORDER BY Duracao

-- Retorna quantidade de filmes por ano, agrupando por ano, ordernando por duração decrescente
-- Como pode ver, não corresponde com a imagem, não sei o motivo, mas atende aos critérios dos requisitos
SELECT 
	Ano, COUNT(Ano) AS Quantidade
FROM
	Filmes 
GROUP BY 
	Ano
ORDER BY
	Quantidade DESC,
	SUM(Duracao) DESC

-- Retorna o PrimeiroNome e UltimoNome dos atores
SELECT
	PrimeiroNome, UltimoNome
FROM
	Atores
WHERE
	Genero = 'M'

-- Retorna o PrimeiroNome e UltimoNome das atrizes em ordem do PrimeiroNome
SELECT
	PrimeiroNome, UltimoNome
FROM
	Atores
WHERE
	Genero = 'F'
ORDER BY
	PrimeiroNome

-- Retorna Nome e Genero dos Filmes
SELECT
	Filmes.Nome, Generos.Genero
FROM
	Filmes
JOIN
	FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
JOIN
	Generos ON FilmesGenero.IdGenero = Generos.Id

-- Retorna Nome dos filmes de genero mistério
SELECT
	Filmes.Nome, Generos.Genero
FROM
	Filmes
JOIN
	FilmesGenero ON Filmes.Id = FilmesGenero.IdFilme
JOIN
	Generos ON FilmesGenero.IdGenero = Generos.Id
WHERE
	Generos.Genero = 'Mistério'

-- Retornar Nome dos Filmes com PrimeiroNome, UltimoNome e seus Papeis
SELECT
	Filmes.Nome, Atores.PrimeiroNome, Atores.UltimoNome, ElencoFilme.Papel
FROM
	Filmes
JOIN
	ElencoFilme ON Filmes.Id = ElencoFilme.IdFilme
JOIN
	Atores ON Atores.Id = ElencoFilme.IdAtor