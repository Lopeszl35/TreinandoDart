import 'dart:io';

void main() {
  try {
    print("Digite seu peso em kg:");
    String? inputPeso = stdin.readLineSync();

    print("Digite sua altura em metros:");
    String? inputAltura = stdin.readLineSync();
    
    // Verificação defensiva antes de tentar converter
    if (inputPeso == null || inputAltura == null || inputPeso.isEmpty || inputAltura.isEmpty) {
        throw FormatException("Entrada vazia.");
    }

    final double peso = double.parse(inputPeso);
    final double altura = double.parse(inputAltura);
    
    final double imc = calcularIMC(peso: peso, altura: altura);
    
    print("Seu IMC é: ${imc.toStringAsFixed(2)}");
    print("Classificação: ${classificarIMC(imc)}");
    
  } catch (e) {
    print("\n--- ERRO ---");
    if (e is FormatException) {
      print("Você digitou texto ou deixou vazio. Use apenas números e ponto (ex: 1.75).");
    } else if (e is ArgumentError) {
      print(e.message); // Vai imprimir "Peso e altura devem ser maiores que zero."
    } else {
      print("Ocorreu um erro inesperado: $e");
    }
  }
}


double calcularIMC({required double peso, required double altura}) {
  if (altura <= 0 || peso <= 0) {
    throw ArgumentError("Peso e altura devem ser maiores que zero.");
  }
  return peso / (altura * altura);
}

String classificarIMC(double imc) {
  if (imc < 18.5) return "Abaixo do peso";
  if (imc < 24.9) return "Peso normal";
  if (imc < 29.9) return "Sobrepeso";
  return "Obesidade";
}