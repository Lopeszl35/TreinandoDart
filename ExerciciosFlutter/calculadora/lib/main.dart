import 'package:flutter/material.dart';
import 'views/pages/calculator_page.dart'; // Importa a página que criamos

void main() {
  runApp(const CalculadoraNexorApp());
}

class CalculadoraNexorApp extends StatelessWidget {
  const CalculadoraNexorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora Nexor',
      theme: ThemeData(
        // Define Laranja como a "Semente" de cores do sistema
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 158, 156, 154)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
      ),
      
      // PONTO DE ENTRADA
      home: const CalculatorPage(),
    );
  }
}