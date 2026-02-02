void main() {
  void contarRepeticaoProd(List<String> produtos) {
    Map<String, int> contagemProdutos = {};
    for (var produto in produtos) {
      contagemProdutos[produto] = (contagemProdutos[produto] ?? 0) + 1;
    }
    print(contagemProdutos);
  }

  List<String> produtos = ["maçã", "banana", "maçã", "laranja", "maçã"]; 
  contarRepeticaoProd(produtos);

}
