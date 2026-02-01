class ImcController {
  String calcular({required String pesoTexto, required String AlturaTexto}) {

    // Limpa o texto, trocando as virgulas por pontos
    String pesoLimpo = pesoTexto.replaceAll(',', '.');
    String alturaLimpo = AlturaTexto.replaceAll(',', '.');

    // Parsing (conversão)
    double peso = double.parse(pesoLimpo);
    double altura = double.parse(alturaLimpo);
 
    // Cálculo
    double imc = peso / (altura * altura);

    // Formatação e classificação
    String imcFormatado = imc.toStringAsFixed(2);

    if (imc < 18.6) {
      return "Abaixo do Peso ($imcFormatado)";
    } else if (imc >= 18.6 && imc < 24.9) {
      return "Peso Ideal ($imcFormatado)";
    } else if (imc >= 24.9 && imc < 29.9) {
      return "Levemente Acima do Peso ($imcFormatado)";
    } else if (imc >= 29.9 && imc < 34.9) {
      return "Obesidade Grau I ($imcFormatado)";
    } else if (imc >= 34.9 && imc < 39.9) {
      return "Obesidade Grau II ($imcFormatado)";
    } else {
      return "Obesidade Grau III ($imcFormatado)";
    }
  }
}