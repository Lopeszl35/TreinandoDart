import 'package:flutter/material.dart';
// IMPORTANTE: Importe o modelo e o widget do botão
import '../../models/button_model.dart';
import 'button_widget.dart';

class CalculatorRow extends StatelessWidget {
  final List<ButtonModel> buttons;
  final Function(String) onPressed;

  const CalculatorRow({
    super.key,
    required this.buttons,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons.map((model) {
        return ButtonWidget(
          text: model.text,
          backgroundColor: model.backgroundColor ?? const Color(0xFF333333),
          textColor: model.textColor ?? Colors.white,
          isBig: model.isBig,
          onPressed: () => onPressed(model.text),
        );
        
      }).toList(),
    );
  }
}