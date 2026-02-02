
void main() {
  void imprimirIdsPares(List<int> ids) {
    for (var id in ids) {
      if (id % 2 == 0) {
        print(id);
      }
    }
  }

  List<int> idsFuncionarios = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  imprimirIdsPares(idsFuncionarios);

  
}