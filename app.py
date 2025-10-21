import sqlite3
from flask import Flask, render_template, jsonify, request

# Cria a aplicação Flask
app = Flask(__name__)

# Define o nome do arquivo do banco de dados
DATABASE_FILE = 'biblioteca.db'

def get_db_connection():
    """Cria uma conexão com o banco de dados."""
    conn = sqlite3.connect(DATABASE_FILE)
    # Isso faz com que os resultados venham como dicionários (melhor para JSON)
    conn.row_factory = sqlite3.Row 
    return conn

def get_query_by_id(query_id):
    """Retorna a string SQL com base no ID da consulta."""
    
    # Mapeia os IDs para as consultas do seu arquivo consultas.sql
    queries = {
        'q1': """
            -- 1. Listar todos os livros com seus autores:
            SELECT 
                A.Nome AS Nome_Autor, 
                L.Titulo AS Titulo_Livro
            FROM Livro AS L
            INNER JOIN Autor AS A ON L.ID_Autor = A.ID_Autor;
        """,
        'q2': """
            -- 2. Listar todos os empréstimos e os usuários correspondentes:
            SELECT 
                E.ID_Emprestimo, 
                U.Nome AS Nome_Usuario
            FROM Emprestimo AS E
            INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario;
        """,
        'q3': """
            -- 3. Listar todos os livros e suas categorias:
            SELECT 
                L.Titulo AS Titulo_Livro, 
                C.Nome AS Nome_Categoria
            FROM Livro AS L
            INNER JOIN Livro_Categoria AS LC ON L.ID_Livro = LC.ID_Livro
            INNER JOIN Categoria AS C ON LC.ID_Categoria = C.ID_Categoria;
        """,
        'q4': """
            -- 4. Listar todos os livros emprestados (e quem os pegou):
            SELECT 
                L.Titulo AS Titulo_Livro, 
                U.Nome AS Nome_Usuario
            FROM Emprestimo AS E
            INNER JOIN Livro AS L ON E.ID_Livro = L.ID_Livro
            INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario;
        """,
        'q5': """
            -- 5. Listar todos os autores e seus livros publicados:
            SELECT 
                A.Nome AS Nome_Autor, 
                L.Titulo AS Titulo_Livro
            FROM Autor AS A
            INNER JOIN Livro AS L ON A.ID_Autor = L.ID_Autor
            ORDER BY A.Nome;
        """,
        'q6': """
            -- NOVA BUSCA 1: Livros atualmente emprestados
            SELECT 
                L.Titulo AS Titulo_Livro,
                U.Nome AS Nome_Usuario,
                E.Data_Emprestimo
            FROM Emprestimo AS E
            INNER JOIN Livro AS L ON E.ID_Livro = L.ID_Livro
            INNER JOIN Usuario AS U ON E.ID_Usuario = U.ID_Usuario
            WHERE E.Data_Devolucao IS NULL;
        """,
        'q7': """
            -- NOVA BUSCA 2: Contagem de livros por autor
            SELECT 
                A.Nome AS Nome_Autor,
                COUNT(L.ID_Livro) AS Quantidade_Livros
            FROM Autor AS A
            LEFT JOIN Livro AS L ON A.ID_Autor = L.ID_Autor
            GROUP BY A.Nome
            ORDER BY Quantidade_Livros DESC;
        """,
        'q8': """
            -- NOVA BUSCA 3: Livros de 'Ficção Científica'
            SELECT 
                L.Titulo AS Titulo_Livro,
                A.Nome AS Nome_Autor,
                C.Nome AS Categoria
            FROM Livro AS L
            INNER JOIN Autor AS A ON L.ID_Autor = A.ID_Autor
            INNER JOIN Livro_Categoria AS LC ON L.ID_Livro = LC.ID_Livro
            INNER JOIN Categoria AS C ON LC.ID_Categoria = C.ID_Categoria
            WHERE C.Nome = 'Ficção Científica';
        """
    }
    return queries.get(query_id, None) # Retorna a query ou None se o ID for inválido

# Rota principal (Interface): http://127.0.0.1:5000/
@app.route('/')
def index():
    """Serve o arquivo HTML principal."""
    return render_template('index.html')

# Rota da API (para o JavaScript buscar os dados)
@app.route('/api/query', methods=['POST'])
def run_query():
    """Executa uma consulta no banco de dados e retorna os resultados como JSON."""
    
    # Pega o ID da query ("q1", "q2", etc) vindo do JavaScript
    data = request.get_json()
    query_id = data.get('query_id')
    
    sql_query = get_query_by_id(query_id)
    
    if not sql_query:
        return jsonify({"error": "Consulta inválida"}), 400
        
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute(sql_query)
        
        # Pega os nomes das colunas
        headers = [description[0] for description in cursor.description]
        
        # Pega todas as linhas de resultado
        rows = cursor.fetchall()
        conn.close()
        
        # Converte os resultados (que são sqlite3.Row) para dicionários
        data_rows = [dict(row) for row in rows]
        
        # Retorna os cabeçalhos e as linhas como JSON
        return jsonify({"headers": headers, "rows": data_rows})
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Inicia o servidor web
if __name__ == '__main__':
    print("Servidor rodando em http://127.0.0.1:5000")
    app.run(debug=True)