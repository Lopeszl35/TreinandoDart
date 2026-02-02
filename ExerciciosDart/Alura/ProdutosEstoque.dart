void main() {
  void produtosNaoVendidos(Set<String> produtosVendidos, Set<String> produtosEstoque) {
    for (var produto in produtosEstoque) {
      if(!produtosVendidos.contains(produto)) {
        print('O produto $produto nao foi vendido');
      }
    }
  }

  
Set<String> produtosVendidos = {"maçã", "banana", "laranja"};   

Set<String> produtosEstoque = {"banana", "kiwi", "laranja"};  

produtosNaoVendidos(produtosVendidos, produtosEstoque);
}