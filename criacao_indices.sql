-- Índices para otimizar os JOINs nas chaves estrangeiras
-- Sem eles, as buscas em tabelas grandes seriam muito lentas (Table Scan)

-- Na tabela Livro, para buscar o Autor
CREATE INDEX idx_livro_id_autor ON Livro (ID_Autor);

-- Na tabela Livro_Categoria, para buscar Livros e Categorias
CREATE INDEX idx_livro_categoria_id_livro ON Livro_Categoria (ID_Livro);
CREATE INDEX idx_livro_categoria_id_categoria ON Livro_Categoria (ID_Categoria);

-- Na tabela Emprestimo, para buscar Livros e Usuários
CREATE INDEX idx_emprestimo_id_livro ON Emprestimo (ID_Livro);
CREATE INDEX idx_emprestimo_id_usuario ON Emprestimo (ID_Usuario);