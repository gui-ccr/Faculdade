#include <iostream>
#include <string>
#include <queue>
#include <stack>

using namespace std;

struct Tarefa {
    int id;
    string descricao;
};

queue<Tarefa> filaTarefas;
stack<Tarefa> historicoTarefas;
int proximoId = 1;

void adicionarTarefa() {
    string descricao;
    cout << "\n--- Adicionar Nova Tarefa ---" << endl;
    cout << "Digite a descricao da tarefa: ";
    cin.ignore();
    getline(cin, descricao);
    
    Tarefa novaTarefa;
    novaTarefa.id = proximoId++;
    novaTarefa.descricao = descricao;
    
    filaTarefas.push(novaTarefa);
    
    cout << "Tarefa #" << novaTarefa.id << " adicionada a fila com sucesso!" << endl;
}

void executarProximaTarefa() {
    cout << "\n--- Executar Proxima Tarefa ---" << endl;
    
    if (filaTarefas.empty()) {
        cout << "Nao ha tarefas pendentes para executar!" << endl;
        return;
    }
    
    Tarefa tarefa = filaTarefas.front();
    filaTarefas.pop();
    historicoTarefas.push(tarefa);
    
    cout << "Tarefa #" << tarefa.id << " executada: " << tarefa.descricao << endl;
}


void mostrarProximaTarefa() {
    cout << "\n--- Proxima Tarefa da Fila ---" << endl;
    
    if (filaTarefas.empty()) {
        cout << "Nao ha tarefas pendentes na fila!" << endl;
        return;
    }
    
    Tarefa tarefa = filaTarefas.front();
    cout << "ID: " << tarefa.id << endl;
    cout << "Descricao: " << tarefa.descricao << endl;
}


void mostrarHistorico() {
    cout << "\n--- Historico de Tarefas Executadas ---" << endl;
    cout << "(Da mais recente para a mais antiga)" << endl;
    
    if (historicoTarefas.empty()) {
        cout << "Nenhuma tarefa foi executada ainda!" << endl;
        return;
    }
    
    stack<Tarefa> pilhaAux = historicoTarefas;
    
    int posicao = 1;
    while (!pilhaAux.empty()) {
        Tarefa tarefa = pilhaAux.top();
        pilhaAux.pop();
        
        cout << posicao++ << ". ID: " << tarefa.id 
             << " - " << tarefa.descricao << endl;
    }
}

void desfazerUltimaTarefa() {
    cout << "\n--- Desfazer Ultima Tarefa ---" << endl;
    
    if (historicoTarefas.empty()) {
        cout << "Nao ha tarefas no historico para desfazer!" << endl;
        return;
    }
    
    Tarefa tarefa = historicoTarefas.top();
    historicoTarefas.pop();
    
    queue<Tarefa> filaAux;
    filaAux.push(tarefa);
    
    while (!filaTarefas.empty()) {
        filaAux.push(filaTarefas.front());
        filaTarefas.pop();
    }
    
    filaTarefas = filaAux;
    
    cout << "Tarefa #" << tarefa.id << " desfeita: " << tarefa.descricao << endl;
    cout << "Tarefa retornou para o inicio da fila!" << endl;
}

void mostrarQuantidadePendentes() {
    cout << "\n--- Tarefas Pendentes ---" << endl;
    cout << "Quantidade de tarefas na fila: " << filaTarefas.size() << endl;
}

void exibirMenu() {
    cout << "\n========================================" << endl;
    cout << "   CENTRAL DE PROCESSAMENTO DE TAREFAS  " << endl;
    cout << "========================================" << endl;
    cout << "1 - Adicionar nova tarefa na fila" << endl;
    cout << "2 - Executar proxima tarefa" << endl;
    cout << "3 - Mostrar proxima tarefa da fila" << endl;
    cout << "4 - Mostrar historico de tarefas executadas" << endl;
    cout << "5 - Desfazer ultima tarefa executada" << endl;
    cout << "6 - Mostrar quantidade de tarefas pendentes" << endl;
    cout << "7 - Sair" << endl;
    cout << "========================================" << endl;
    cout << "Escolha uma opcao: ";
}

int main() {
    int opcao;
    
    do {
        exibirMenu();
        cin >> opcao;
        
        switch (opcao) {
            case 1:
                adicionarTarefa();
                break;
            case 2:
                executarProximaTarefa();
                break;
            case 3:
                mostrarProximaTarefa();
                break;
            case 4:
                mostrarHistorico();
                break;
            case 5:
                desfazerUltimaTarefa();
                break;
            case 6:
                mostrarQuantidadePendentes();
                break;
            case 7:
                cout << "\nEncerrando o sistema... Ate logo!" << endl;
                break;
            default:
                cout << "\nOpcao invalida! Tente novamente." << endl;
        }
        
    } while (opcao != 7);
    
    return 0;
}