import 'package:flutter/material.dart';
import '../models/ImcResultado.dart';

class ImcController {
  
  ImcResultado calcular({required String pesoTexto, required String alturaTexto}) {
    
    // Tratamento de erro básico se vier vazio
    if (pesoTexto.isEmpty || alturaTexto.isEmpty) {
      return ImcResultado(texto: "Preencha os dados", cor: Colors.black);
    }

    String pesoLimpo = pesoTexto.replaceAll(',', '.');
    String alturaLimpo = alturaTexto.replaceAll(',', '.');

    double peso = double.parse(pesoLimpo);
    double altura = double.parse(alturaLimpo) / 100; // Convertendo cm para m

    double imc = peso / (altura * altura);
    String imcFormatado = imc.toStringAsFixed(1);

    // Lógica de Decisão
    if (imc < 18.6) {
      return ImcResultado(
        texto: "Abaixo do Peso ($imcFormatado)", 
        cor: Colors.amber, // Amarelo de alerta
      );
    } else if (imc >= 18.6 && imc < 24.9) {
      return ImcResultado(
        texto: "Peso Ideal ($imcFormatado)", 
        cor: Colors.green, // Verde de sucesso
      );
    } else if (imc >= 24.9 && imc < 29.9) {
      return ImcResultado(
        texto: "Levemente Acima do Peso ($imcFormatado)", 
        cor: Colors.amber,
      );
    } else if (imc >= 29.9 && imc < 34.9) {
      return ImcResultado(
        texto: "Obesidade Grau I ($imcFormatado)", 
        cor: Colors.orange,
      );
    } else if (imc >= 34.9 && imc < 39.9) {
      return ImcResultado(
        texto: "Obesidade Grau II ($imcFormatado)", 
        cor: Colors.redAccent,
      );
    } else {
      return ImcResultado(
        texto: "Obesidade Grau III ($imcFormatado)", 
        cor: Colors.red, // Vermelho perigo
      );
    }
  }
}