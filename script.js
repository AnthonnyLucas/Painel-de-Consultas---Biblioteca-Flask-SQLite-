document.addEventListener('DOMContentLoaded', () => {
    const buttonContainer = document.getElementById('query-buttons');
    const resultTableHead = document.getElementById('result-head');
    const resultTableBody = document.getElementById('result-body');
    const resultTitle = document.getElementById('result-title');
    const statusMessageDiv = document.getElementById('status-message');
    const mainDashboardTitle = document.getElementById('main-dashboard-title'); // Novo elemento

    let currentActiveButton = null; // Para controlar o botão ativo

    // Função para exibir mensagens de status
    function displayStatusMessage(message, type = 'info') {
        statusMessageDiv.innerHTML = `<p><i class="fas ${type === 'error' ? 'fa-exclamation-triangle' : 'fa-info-circle'}"></i> ${message}</p>`;
        statusMessageDiv.className = `status-${type}`;
        statusMessageDiv.style.display = 'block';
    }

    // Função para limpar a tabela
    function clearTable() {
        resultTableHead.innerHTML = '';
        resultTableBody.innerHTML = '';
        if (currentActiveButton) {
            currentActiveButton.classList.remove('active');
        }
    }

    // Listener para os cliques nos botões da sidebar
    buttonContainer.addEventListener('click', async (event) => {
        const button = event.target.closest('button'); // Usa closest para pegar o botão mesmo se clicar no ícone
        if (button && button.dataset.query) {
            const queryId = button.dataset.query;
            const queryName = button.textContent.trim().replace(/^\d+\.\s*\(Nova\)\s*/, '').trim(); // Limpa o texto para o título

            // Marca o botão como ativo
            if (currentActiveButton) {
                currentActiveButton.classList.remove('active');
            }
            button.classList.add('active');
            currentActiveButton = button;

            await fetchQueryData(queryId, queryName);
        }
    });

    // Função assíncrona para buscar os dados no backend
    async function fetchQueryData(queryId, queryName) {
        resultTitle.textContent = `Executando: ${queryName}...`;
        mainDashboardTitle.textContent = `Consulta: ${queryName}`; // Atualiza título do navbar
        displayStatusMessage('Buscando dados no banco de dados...', 'info');
        clearTable(); // Limpa a tabela antiga

        try {
            const response = await fetch('/api/query', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ query_id: queryId }),
            });

            if (!response.ok) {
                const errorData = await response.json();
                throw new Error(errorData.error || `Erro HTTP: ${response.status}`);
            }

            const data = await response.json();

            resultTitle.textContent = `Resultados da Consulta: ${queryName}`;
            statusMessageDiv.style.display = 'none'; // Esconde a mensagem de status

            populateTable(data.headers, data.rows);

        } catch (error) {
            console.error('Erro ao buscar consulta:', error);
            resultTitle.textContent = `Erro ao executar: ${queryName}`;
            displayStatusMessage(`Erro: ${error.message}. Verifique o console para mais detalhes.`, 'error');
            mainDashboardTitle.textContent = `Erro na Consulta`; // Atualiza título do navbar
        }
    }

    // Função para preencher a tabela com os dados
    function populateTable(headers, rows) {
        resultTableHead.innerHTML = '';
        resultTableBody.innerHTML = ''; // Garante que a tabela está limpa

        if (rows.length === 0) {
            displayStatusMessage('A consulta não retornou resultados.', 'info');
            return;
        }

        // Cria o Cabeçalho (thead)
        const headerRow = document.createElement('tr');
        headers.forEach(headerText => {
            const th = document.createElement('th');
            th.textContent = headerText.replace(/_/g, ' '); // Substitui underscores por espaços para melhor leitura
            headerRow.appendChild(th);
        });
        resultTableHead.appendChild(headerRow);

        // Cria as Linhas (tbody)
        rows.forEach(rowData => {
            const row = document.createElement('tr');
            headers.forEach(header => {
                const td = document.createElement('td');
                // Garante que valores NULL sejam exibidos como vazio ou "-"
                td.textContent = rowData[header] === null ? '-' : rowData[header];
                row.appendChild(td);
            });
            resultTableBody.appendChild(row);
        });
    }
});