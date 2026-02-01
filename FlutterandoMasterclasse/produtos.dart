import 'dart:io';
void main() {
  final List<String> produtos = [];

  var isRunning = true;

  while (isRunning == true) {
    // Limpa a tela
    print("\x1B[2J\x1B[0;0H");
    print('\n === Menu de Produtos');
    print('1. Adicionar Produto');
    print('2. Listar Produtos');
    print('3. Sair');

    print('Escolha uma opção:');
    String? inputOpcao = stdin.readLineSync();

    if (!ValidadorDeEntradaOpcoesMenu(int.tryParse(inputOpcao!))) {
      print('Opção inválida. Por favor, escolha uma opção entre 1 e 3.');
      main();
    } else {
      switch (int.parse(inputOpcao)) {
        case 1:
          print('Digite o nome do produto para adicionar:');
          String? nomeProduto = stdin.readLineSync();
          if (ValidadorDeEntradaProduto(nomeProduto)) {
            produtos.add(nomeProduto!.trim());
            print('Produto "$nomeProduto" adicionado com sucesso!');
          } else {
            print('Nome de produto inválido. Use apenas letras e espaços.');
            continue;
          }
          break;
        case 2:
          if (produtos.isEmpty) {
            print('Nenhum produto cadastrado.');
          } else {
            print('- Produtos cadastrados -');
            for (var produto in produtos) {
              print('- $produto -');
            }
          }
          break;
        case 3:
          print('Saindo do programa. Até mais!');
          isRunning = false;
          break;
        default:
          print('Opção inválida. Por favor, escolha uma opção entre 1 e 3.');
          continue;
      }
      print('\nPressione Enter para continuar...');
      stdin.readLineSync();
    }


  }

}

bool ValidadorDeEntradaOpcoesMenu(int? entrada) {
  return entrada != null && entrada >= 1 && entrada <= 3;
}

bool ValidadorDeEntradaProduto(String? entrada) {
  return entrada != null && entrada.trim().isNotEmpty && RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(entrada);
}