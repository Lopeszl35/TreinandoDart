import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor; // Cor do botão
  final Color textColor;       // Cor do texto
  final VoidCallback onPressed; // A função que ele executa (Callback)
  final bool isBig;            // Para o botão "0" que costuma ser duplo

  const ButtonWidget({
    super.key,
    required this.text,
    this.backgroundColor = const Color(0xFF333333), // Cinza Escuro (Padrão)
    this.textColor = Colors.white,
    required this.onPressed,
    this.isBig = false, // Padrão é botão normal (1x1)
  });

  @override
  Widget build(BuildContext context) {
    // Expanded: O botão vai ocupar todo o espaço disponível na linha (Row)
    return Expanded(
      flex: isBig ? 2 : 1, // Se for grande, ocupa o dobro do espaço (Matemática de Layout)
      child: Container(
        margin: const EdgeInsets.all(5.0), // Espacinho entre botões
        height: 80, // Altura fixa para ficar "Gordo" e tocável
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0), // Bem arredondado
            ),
            elevation: 2, // Sombra sutil
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}