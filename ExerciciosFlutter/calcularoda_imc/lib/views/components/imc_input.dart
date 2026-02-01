import 'package:flutter/material.dart';

class ImcInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorMessage;
  final IconData icon;

  const ImcInput({
    super.key,
    required this.controller,
    required this.label,
    required this.errorMessage,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.deepPurple),
        // Icone no inicio do campo
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        // Bodar Padrão(quando o campo esta quieto) 
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple, width: 1.0),
          borderRadius: BorderRadius.circular(15.0)
        ),
        // Borda quando o campo estiver selecionado
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
          borderRadius: BorderRadius.circular(15.0)
        ),
        // Borda quando o campo estiver com erro
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
          borderRadius: BorderRadius.circular(15.0)
        ),
        // O FocusedErrorBorder é quando está com erro E selecionado
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.deepPurple,
            width: 2.0
          ),
          borderRadius: BorderRadius.circular(15.0)
        )
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.deepPurple, fontSize: 25.0),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        }
        return null;
      }
    );
  }
}