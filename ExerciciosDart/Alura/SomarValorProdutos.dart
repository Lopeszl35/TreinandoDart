void main() {
  void somarValorProdutos(Map<String, double> produtos) {
    var total = 0.0;
    for (var produto in produtos.values) {
      total += produto;
    }
    print('O total dos produtos é: $total');
  }

  
Map<String, double> precosProdutos = { 

  "Camiseta": 30.0, 

  "Calça": 50.0, 

  "Boné": 15.0, 

  "Tênis": 120.0 

}; 

somarValorProdutos(precosProdutos);
}