# Painel de Consultas - Biblioteca (Flask + SQLite)

Este projeto é uma aplicação web completa que serve como uma interface gráfica (GUI) moderna para analisar um banco de dados SQLite de uma biblioteca. O backend é construído com **Python** e o micro-framework **Flask**, enquanto o frontend utiliza **HTML, CSS e JavaScript** para criar um dashboard profissional e responsivo.

Originalmente uma atividade acadêmica de análise e desempenho de SGBDs, o projeto evoluiu para uma aplicação interativa que permite ao usuário executar consultas SQL complexas com o clique de um botão e visualizar os resultados em tempo real.

<div align="center">
<img src="![Image](https://github.com/user-attachments/assets/9de6f3ed-070e-4760-a293-fb5e6d601eca)" width="700px" />
</div>
## Funcionalidades Principais

* **Backend com API:** Um servidor Flask que expõe uma API RESTful para executar consultas no banco de dados.
* **Interface Reativa:** Frontend moderno com HTML, CSS e JS que consome a API sem precisar recarregar a página.
* **Dashboard Profissional:** Layout com barra lateral de navegação (sidebar), ícones (Font Awesome) e tabelas de resultados com estilo.
* **Consultas Pré-definidas:** Executa 8 consultas SQL otimizadas (incluindo as 5 originais da atividade e 3 novas) para análise de dados da biblioteca.
* **Estrutura de Banco de Dados:** Inclui scripts SQL para criar a estrutura de tabelas, inserir um conjunto de dados de exemplo e criar índices para otimização de desempenho.

## Tecnologias Utilizadas

* **Backend:** Python 3, Flask
* **Frontend:** HTML5, CSS3, JavaScript (ES6+)
* **Banco de Dados:** SQLite
* **Ícones:** Font Awesome

## Pré-requisitos

Antes de começar, você precisará ter as seguintes ferramentas instaladas em sua máquina:

1.  [**Python 3.x**](https://www.python.org/downloads/): Certifique-se de que o Python e o gerenciador de pacotes `pip` estejam instalados e acessíveis pelo terminal.
2.  [**SQLite 3**](https://www.sqlite.org/download.html): O executável do SQLite é necessário para criar o banco de dados a partir dos scripts.

## Guia de Instalação e Execução

Siga este passo a passo para configurar e rodar o projeto localmente.

### 1. Clone o Repositório

Primeiro, clone este repositório para sua máquina local (ou simplesmente baixe os arquivos).

```bash
git clone [https://github.com/seu-usuario/nome-do-repositorio.git](https://github.com/seu-usuario/nome-do-repositorio.git)
cd nome-do-repositorio
2. Crie um Ambiente Virtual (Recomendado)
É uma boa prática isolar as dependências do projeto em um ambiente virtual.

Bash

# Criar o ambiente virtual (venv)
python -m venv venv

# Ativar o ambiente no Windows (PowerShell)
.\venv\Scripts\Activate
(Se estiver usando CMD, o comando é .\venv\Scripts\activate.bat. No Linux/Mac, é source venv/bin/activate)

3. Instale as Dependências do Python
Com o ambiente ativado, instale o Flask (e quaisquer outras dependências listadas no requirements.txt).

Bash

pip install -r requirements.txt
4. Crie o Banco de Dados (Passo Crítico)
O servidor Flask não cria o banco de dados; ele apenas se conecta ao arquivo biblioteca.db. Você precisa criar e popular este arquivo manualmente usando os scripts SQL fornecidos.

4.1. Baixe o SQLite:

Acesse https://www.sqlite.org/download.html.

Na seção "Precompiled Binaries for Windows", baixe o arquivo zip que contém o sqlite3.exe (ex: sqlite-tools-win-x64-*.zip).

Extraia o arquivo sqlite3.exe e coloque-o na raiz da pasta do seu projeto (junto com app.py).

4.2. Execute os Scripts no Terminal:

Abra seu terminal (PowerShell, CMD, etc.) na pasta do projeto.

Digite o comando a seguir para criar o banco e entrar no prompt do SQLite:

Bash

.\sqlite3.exe biblioteca.db
O terminal mudará para sqlite>. Agora, execute os scripts na ordem correta, um de cada vez:

Snippet de código

-- 1. Criar as tabelas
.read criacao.sql

-- 2. Inserir todos os dados
.read insercao.sql

-- 3. Criar os índices de otimização
.read criacao_indices.sql
Se nenhum erro aparecer, o banco foi criado. Você pode verificar digitando .tables para ver a lista de tabelas.

Saia do SQLite para "liberar" o arquivo do banco:

Snippet de código

.quit
Pronto! O arquivo biblioteca.db agora existe e está populado.

Como Usar o Programa
Com o banco de dados criado e as dependências instaladas, você está pronto para rodar a aplicação web.

Certifique-se de que seu ambiente virtual esteja ativado (Passo 2).

No seu terminal, na raiz do projeto, execute o servidor Flask:

Bash

python app.py
O terminal informará que o servidor está rodando:

 * Serving Flask app 'app'
 * Debug mode: on
 * Running on [http://127.0.0.1:5000](http://127.0.0.1:5000)
Press CTRL+C to quit
Abra seu navegador (Chrome, Firefox, etc.) e acesse o endereço:

http://127.0.0.1:5000

A interface do dashboard será carregada. Use o menu na barra lateral para clicar nas consultas desejadas. Os resultados aparecerão na tabela principal.

Estrutura do Projeto
/PASTA-DO-PROJETO
├── app.py              # O servidor backend (Python/Flask)
├── biblioteca.db       # O banco de dados (criado no Passo 4)
├── criacao.sql         # Script de criação das tabelas
├── insercao.sql        # Script de inserção de dados (originais + 15 novos)
├── criacao_indices.sql # Script de otimização (criação de índices)
├── consultas.sql       # Arquivo de referência com as 8 consultas
├── requirements.txt    # Dependências do Python (Flask)
├── sqlite3.exe         # (Ferramenta baixada no Passo 4.1)
├── static/
│   ├── style.css       # Folha de estilos do dashboard
│   └── script.js       # Lógica do frontend (JavaScript)
└── templates/
    └── index.html      # A estrutura HTML da página principal
