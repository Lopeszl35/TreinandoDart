import 'package:flutter/material.dart';
import '../controllers/imc_controller.dart'; 
import '../models/ImcResultado.dart';
import 'components/imc_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  final ImcController _controller = ImcController();

  // Estado Inicial
  ImcResultado _resultado = ImcResultado(texto: "Informe seus dados", cor: Colors.deepPurple);

  void _resetFields() {
    _pesoController.clear();
    _alturaController.clear();
    setState(() {
      _resultado = ImcResultado(texto: "Informe seus dados", cor: Colors.deepPurple);
      _formKey.currentState?.reset();
    });
  }

  void _calcular() {
    ImcResultado resultadoCalculado = _controller.calcular(
      pesoTexto: _pesoController.text, 
      alturaTexto: _alturaController.text
    );

    setState(() {
      _resultado = resultadoCalculado;
    });
  }

  @override
  void dispose() {
    _pesoController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      resizeToAvoidBottomInset: true, // Evita que o teclado fique sobreposto
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline, size: 120.0, color: Colors.deepPurple),
              
              const SizedBox(height: 20),

              // Componentes Customizados
              ImcInput(
                controller: _pesoController,
                label: 'Peso (kg)',
                errorMessage: 'Insira seu peso!',
                icon: Icons.monitor_weight_outlined,
              ),

              const SizedBox(height: 20.0),

              ImcInput(
                controller: _alturaController,
                label: 'Altura (cm)',
                errorMessage: 'Insira sua altura!',
                icon: Icons.height_outlined,
              ),

              const SizedBox(height: 30.0),

              // Botão Calcular
              SizedBox(
                height: 55.0, // Botão um pouco mais alto
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calcular();
                      FocusScope.of(context).unfocus(); // Esconde o teclado
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // Lógica do Card de Resultado (Sem Texto Solto)
              if (_resultado.texto != "Informe seus dados")
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: _resultado.cor.withValues(alpha: 0.2), 
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: _resultado.cor, width: 2.0),
                  ),
                  child: Column(
                    children: [
                      Text("Diagnóstico:", style: TextStyle(color: _resultado.cor)),
                      const SizedBox(height: 5),
                      Text(
                        _resultado.texto,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _resultado.cor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        height: 50,
        child: Center(
          child: const Text(
            'Desenvolvido por Rafael Lopes',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}