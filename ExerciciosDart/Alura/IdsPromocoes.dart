void main() {
  void exibirIdsPromocoes(Set<int> produtosSemana, Set<int> produtosMes) {
    Set<int> resultado = {};

    for (var produto in produtosSemana) {
      resultado.add(produto);
    }
    for (var produto in produtosMes) {
      resultado.add(produto);
    }
    for (var produto in resultado) {
      print(produto);
    }
  }

  
Set<int> produtosSemana = {1, 2, 3, 4};   

Set<int> produtosMes = {3, 4, 5, 6};  

exibirIdsPromocoes(produtosSemana, produtosMes);

}