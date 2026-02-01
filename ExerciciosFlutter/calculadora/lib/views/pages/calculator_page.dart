import 'package:flutter/material.dart';
// IMPORTANTE: Importamos o Contrato (Model) e o Componente de Layout (Row)
import '../../models/button_model.dart';
import '../components/calculator_row.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  
  String _output = "0";

  // Essa função logo sairá daqui para ir pro Controller
  void _onButtonClick(String text) {
    print("Clicou em $text");
    setState(() {
      if (_output == "0") {
        _output = text;
      } else {
        _output += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Definimos as cores aqui para usar nos Models
    const Color corLaranja = Color(0xFFFF9500);
    const Color corCinzaClaro = Color(0xFFA5A5A5);
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // --- DISPLAY (Mantivemos igual por enquanto) ---
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  _output,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80.0,
                    fontWeight: FontWeight.w300,
                  ),
                  maxLines: 1,
                ),
              ),
            ),

            // --- AQUI COMEÇA A REFATORAÇÃO ---
            // Em vez de Widgets visuais, passamos DADOS (Models).
            
            // LINHA 1
            CalculatorRow(
              buttons: [
                ButtonModel(text: 'AC', backgroundColor: corCinzaClaro, textColor: Colors.black),
                ButtonModel(text: 'DEL', backgroundColor: corCinzaClaro, textColor: Colors.black),
                ButtonModel(text: '%', backgroundColor: corCinzaClaro, textColor: Colors.black),
                ButtonModel(text: '/', backgroundColor: corLaranja),
              ],
              onPressed: _onButtonClick, // Passamos a referência da função
            ),

            // LINHA 2
            CalculatorRow(
              buttons: [
                ButtonModel(text: '7'), // Cor padrão (Cinza Escuro) é assumida automaticamente
                ButtonModel(text: '8'),
                ButtonModel(text: '9'),
                ButtonModel(text: 'x', backgroundColor: corLaranja),
              ],
              onPressed: _onButtonClick,
            ),

            // LINHA 3
            CalculatorRow(
              buttons: [
                ButtonModel(text: '4'),
                ButtonModel(text: '5'),
                ButtonModel(text: '6'),
                ButtonModel(text: '-', backgroundColor: corLaranja),
              ],
              onPressed: _onButtonClick,
            ),

            // LINHA 4
            CalculatorRow(
              buttons: [
                ButtonModel(text: '1'),
                ButtonModel(text: '2'),
                ButtonModel(text: '3'),
                ButtonModel(text: '+', backgroundColor: corLaranja),
              ],
              onPressed: _onButtonClick,
            ),

            // LINHA 5
            CalculatorRow(
              buttons: [
                ButtonModel(text: '0', isBig: true), // Configuramos botão duplo
                ButtonModel(text: '.'),
                ButtonModel(text: '=', backgroundColor: corLaranja),
              ],
              onPressed: _onButtonClick,
            ),
          ],
        ),
      ),
    );
  }
}