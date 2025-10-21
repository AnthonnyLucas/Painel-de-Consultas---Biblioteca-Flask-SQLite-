-- Insercao dos dados (Originais)
INSERT INTO Autor (ID_Autor, Nome, Data_Nascimento) VALUES (1, 'J.K. Rowling', '1965-07-31');
INSERT INTO Autor (ID_Autor, Nome, Data_Nascimento) VALUES (2, 'George R.R. Martin', '1948-09-20');
INSERT INTO Autor (ID_Autor, Nome, Data_Nascimento) VALUES (3, 'J.R.R. Tolkien', '1892-01-03');

INSERT INTO Categoria (ID_Categoria, Nome) VALUES (1, 'Fantasia');
INSERT INTO Categoria (ID_Categoria, Nome) VALUES (2, 'Ficção Científica');
INSERT INTO Categoria (ID_Categoria, Nome) VALUES (3, 'Aventura');

INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (1, 'Harry Potter e a Pedra Filosofal', 1, 1997);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (2, 'A Guerra dos Tronos', 2, 1996);
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES (3, 'O Senhor dos Anéis', 3, 1954);

INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (1, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (1, 3);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (2, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (2, 2);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (3, 1);
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES (3, 3);

INSERT INTO Usuario (ID_Usuario, Nome, Email) VALUES (1, 'Alice', 'alice@example.com');
INSERT INTO Usuario (ID_Usuario, Nome, Email) VALUES (2, 'Bob', 'bob@example.com');
INSERT INTO Usuario (ID_Usuario, Nome, Email) VALUES (3, 'Charlie', 'charlie@example.com');

INSERT INTO Emprestimo (ID_Emprestimo, ID_Livro, ID_Usuario, Data_Emprestimo, Data_Devolucao) VALUES (1, 1, 1, '2024-07-01', '2024-07-10');
INSERT INTO Emprestimo (ID_Emprestimo, ID_Livro, ID_Usuario, Data_Emprestimo, Data_Devolucao) VALUES (2, 2, 2, '2024-07-05', '2024-07-15');
INSERT INTO Emprestimo (ID_Emprestimo, ID_Livro, ID_Usuario, Data_Emprestimo, Data_Devolucao) VALUES (3, 3, 3, '2024-07-10', NULL);

-- ===============================================
-- NOVAS INSERÇÕES (15+ por tabela)
-- ===============================================

-- 15 Novos Autores (IDs 4 a 18)
INSERT INTO Autor (ID_Autor, Nome, Data_Nascimento) VALUES
(4, 'Machado de Assis', '1839-06-21'),
(5, 'Clarice Lispector', '1920-12-10'),
(6, 'Isaac Asimov', '1920-01-02'),
(7, 'Agatha Christie', '1890-09-15'),
(8, 'Stephen King', '1947-09-21'),
(9, 'Neil Gaiman', '1960-11-10'),
(10, 'Ursula K. Le Guin', '1929-10-21'),
(11, 'Frank Herbert', '1920-10-08'),
(12, 'Philip K. Dick', '1928-12-16'),
(13, 'George Orwell', '1903-06-25'),
(14, 'Aldous Huxley', '1894-07-26'),
(15, 'Margaret Atwood', '1939-11-18'),
(16, 'Yuval Noah Harari', '1976-02-24'),
(17, 'Jane Austen', '1775-12-16'),
(18, 'Mary Shelley', '1797-08-30');

-- 15 Novas Categorias (IDs 4 a 18)
INSERT INTO Categoria (ID_Categoria, Nome) VALUES
(4, 'Romance'),
(5, 'Mistério'),
(6, 'Terror'),
(7, 'Distopia'),
(8, 'História'),
(9, 'Não-Ficção'),
(10, 'Quadrinhos'),
(11, 'Clássico'),
(12, 'Policial'),
(13, 'Biografia'),
(14, 'Suspense'),
(15, 'Poesia'),
(16, 'Drama'),
(17, 'Humor'),
(18, 'Autoajuda');

-- 15 Novos Livros (IDs 4 a 18)
INSERT INTO Livro (ID_Livro, Titulo, ID_Autor, Ano_Publicacao) VALUES
(4, 'Dom Casmurro', 4, 1899),
(5, 'A Hora da Estrela', 5, 1977),
(6, 'Fundação', 6, 1951),
(7, 'O Assassinato no Expresso do Oriente', 7, 1934),
(8, 'O Iluminado', 8, 1977),
(9, 'Sandman: Prelúdios e Noturnos', 9, 1989),
(10, 'O Feiticeiro de Terramar', 10, 1968),
(11, 'Duna', 11, 1965),
(12, 'Androides Sonham com Ovelhas Elétricas?', 12, 1968),
(13, '1984', 13, 1949),
(14, 'Admirável Mundo Novo', 14, 1932),
(15, 'O Conto da Aia', 15, 1985),
(16, 'Sapiens: Uma Breve História da Humanidade', 16, 2011),
(17, 'Orgulho e Preconceito', 17, 1813),
(18, 'Frankenstein', 18, 1818);

-- Novas Relações Livro_Categoria
INSERT INTO Livro_Categoria (ID_Livro, ID_Categoria) VALUES
(4, 4), (4, 11), (4, 16),
(5, 4), (5, 11),
(6, 2), (10, 1),
(7, 5), (7, 12),
(8, 6), (8, 14),
(9, 1), (9, 10),
(11, 2), (11, 1),
(12, 2), (13, 2), (13, 7),
(14, 2), (14, 7),
(15, 2), (15, 7),
(16, 9), (16, 8),
(17, 4), (17, 11),
(18, 6), (18, 11), (18, 2);

-- 15 Novos Usuários (IDs 4 a 18)
INSERT INTO Usuario (ID_Usuario, Nome, Email) VALUES
(4, 'Daniel', 'daniel@example.com'),
(5, 'Eduarda', 'eduarda@example.com'),
(6, 'Felipe', 'felipe@example.com'),
(7, 'Gabriela', 'gabriela@example.com'),
(8, 'Heitor', 'heitor@example.com'),
(9, 'Isabela', 'isabela@example.com'),
(10, 'João', 'joao@example.com'),
(11, 'Karla', 'karla@example.com'),
(12, 'Lucas', 'lucas@example.com'),
(13, 'Manuela', 'manuela@example.com'),
(14, 'Nicolas', 'nicolas@example.com'),
(15, 'Olivia', 'olivia@example.com'),
(16, 'Pedro', 'pedro@example.com'),
(17, 'Quintino', 'quintino@example.com'),
(18, 'Rafaela', 'rafaela@example.com');

-- 15 Novos Empréstimos (IDs 4 a 18)
INSERT INTO Emprestimo (ID_Emprestimo, ID_Livro, ID_Usuario, Data_Emprestimo, Data_Devolucao) VALUES
(4, 4, 4, '2024-07-11', '2024-07-20'),
(5, 5, 5, '2024-07-12', '2024-07-22'),
(6, 6, 6, '2024-07-13', NULL),
(7, 7, 7, '2024-07-14', '2024-07-24'),
(8, 8, 8, '2024-07-15', NULL),
(9, 9, 9, '2024-07-16', '2024-07-26'),
(10, 10, 10, '2024-07-17', NULL),
(11, 11, 11, '2024-07-18', '2024-07-28'),
(12, 12, 12, '2024-07-19', NULL),
(13, 13, 13, '2024-07-20', '2024-07-30'),
(14, 14, 14, '2024-07-21', NULL),
(15, 15, 15, '2024-07-22', '2024-08-01'),
(16, 16, 16, '2024-07-23', NULL),
(17, 17, 17, '2024-07-24', '2024-08-03'),
(18, 18, 18, '2024-07-25', NULL);