import 'dart:convert';

void main() async {
  // Simulação: JSON que veio da API (com um erro proposital na chave 'descricao')
  String jsonDaInternet = """
  [
    {"nome": "Nexor", "descricao": "Startup Tech", "ativo": true},
    {"nome": "Konta", "descrICAO": "Erro de digitação aqui", "ativo": true}, 
    {"nome": "Projeto Morto", "descricao": "Legado", "ativo": false}
  ]
  """;

  List<dynamic> listaBruta = jsonDecode(jsonDaInternet);
  Projetos gerenciador = Projetos();

  print("--- Processando JSON ---");

  for (var mapa in listaBruta) {
    try {
      Projeto p = Projeto.fromJson(mapa);
      gerenciador.adicionarProjetos(p);
    } catch (e) {
      print("ERRO CRÍTICO: Não foi possível importar um projeto. Motivo: $e");
    }
  }

  print("\n--- Relatório de Projetos Ativos ---");

  var ativos = await gerenciador.getProjetosAtivos();
  
  if (ativos.isEmpty) {
    print("Nenhum ativo.");
  } else {
    for (var p in ativos) {
      print("Nome: ${p.nome} | Descrição: ${p.descricao}");
    }
  }
}

class Projeto {
  final String nome;
  final String descricao;
  final bool ativo;

  Projeto({required this.nome, required this.descricao, required this.ativo});

  factory Projeto.fromJson(Map<String, dynamic> json) {
    if (json['nome'] == null) {
        throw FormatException("O JSON veio sem a chave 'nome'!");
    }

    return Projeto(
      nome: json['nome'],
      descricao: json['descricao'] ?? "Sem descrição disponível", 
      ativo: json['ativo'] ?? false, 
    );
  }
}

class Projetos {
  final List<Projeto> _listaDeProjetos = [];

  void adicionarProjetos(Projeto projeto) {
    _listaDeProjetos.add(projeto);
  }

  Future<List<Projeto>> getProjetosAtivos() async {
    // Simula delay de rede
    await Future.delayed(Duration(milliseconds: 500)); 
    return _listaDeProjetos.where((p) => p.ativo).toList();
  }
}