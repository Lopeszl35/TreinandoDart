void main() {

  void verificarDisponibilidade(Set<int> itens, int codigo) {
    if (itens.contains(codigo)) {
      print('O item $codigo esta disponivel');
    } else {
      print('O item $codigo nao esta disponivel');
    }
  }

  Set<int> codigosDisponiveis = {1, 2, 3, 4, 5}; 

  verificarDisponibilidade(codigosDisponiveis, 1);
  verificarDisponibilidade(codigosDisponiveis, 6);

}