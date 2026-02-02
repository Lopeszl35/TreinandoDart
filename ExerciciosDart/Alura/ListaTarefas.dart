
void main() {
  List<String> tarefas = ['Tarefa 1', 'Tarefa 2', 'Tarefa 3', 'Tarefa 4', 'Tarefa 5'];
 
  ListaTarefas listaTarefas = ListaTarefas();
 
  listaTarefas.mostrarTarefas(tarefas);
 
}

class ListaTarefas {
  List<String> tarefas = [];

  void mostrarTarefas(List<String> tarefas) {
    for (var tarefa in tarefas) {
      print(tarefa);
    }
  }
}