-- ===============================================
-- BUSCAS ORIGINAIS (OTIMIZADAS COM SINTAXE JOIN)
-- ===============================================

-- 1. Listar todos os livros com seus autores:
SELECT 
    A.Nome AS Nome_Autor, 
    L.Titulo AS Titulo_Livro
FROM Livro AS L
INNER JOIN Autor AS A ON L.ID_Autor = A.ID_Autor;

-- 2. Listar todos os empréstimos e os usuários correspondentes:
SELECT 
    E.ID_Emprestimo, 
    U.Nome AS Nome_Usuario
FROM Emprestimo AS E
INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario;

-- 3. Listar todos os livros e suas categorias:
SELECT 
    L.Titulo AS Titulo_Livro, 
    C.Nome AS Nome_Categoria
FROM Livro AS L
INNER JOIN Livro_Categoria AS LC ON L.ID_Livro = LC.ID_Livro
INNER JOIN Categoria AS C ON LC.ID_Categoria = C.ID_Categoria;

-- 4. Listar todos os livros emprestados (e quem os pegou):
SELECT 
    L.Titulo AS Titulo_Livro, 
    U.Nome AS Nome_Usuario
FROM Emprestimo AS E
INNER JOIN Livro AS L ON E.ID_Livro = L.ID_Livro
INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario;

-- 5. Listar todos os autores e seus livros publicados:
SELECT 
    A.Nome AS Nome_Autor, 
    L.Titulo AS Titulo_Livro
FROM Autor AS A
INNER JOIN Livro AS L ON A.ID_Autor = L.ID_Autor
ORDER BY A.Nome;


-- ===============================================
-- 3 NOVAS BUSCAS
-- ===============================================

-- NOVA BUSCA 1: Listar todos os livros que estão atualmente emprestados (sem data de devolução)
SELECT 
    L.Titulo AS Titulo_Livro,
    U.Nome AS Nome_Usuario,
    E.Data_Emprestimo
FROM Emprestimo AS E
INNER JOIN Livro AS L ON E.ID_Livro = L.ID_Livro
INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario
WHERE E.Data_Devolucao IS NULL;

-- NOVA BUSCA 2: Contar quantos livros cada autor possui na biblioteca
-- (Usando LEFT JOIN para incluir autores sem livros cadastrados)
SELECT 
    A.Nome AS Nome_Autor,
    COUNT(L.ID_Livro) AS Quantidade_Livros
FROM Autor AS A
LEFT JOIN Livro AS L ON A.ID_Autor = L.ID_Autor
GROUP BY A.Nome
ORDER BY Quantidade_Livros DESC;

-- NOVA BUSCA 3: Listar todos os livros da categoria 'Ficção Científica' (ID 2)
SELECT 
    L.Titulo AS Titulo_Livro,
    A.Nome AS Nome_Autor,
    C.Nome AS Categoria
FROM Livro AS L
INNER JOIN Autor AS A ON L.ID_Autor = A.ID_Autor
INNER JOIN Livro_Categoria AS LC ON L.ID_Livro = LC.ID_Livro
INNER JOIN Categoria AS C ON LC.ID_Categoria = C.ID_Categoria
WHERE C.Nome = 'Ficção Científica';