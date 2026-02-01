import 'package:flutter/material.dart';
import '../controllers/imc_controller.dart';

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

  String _infoText = "Informe seus dados";

  void _resetFields() {
    _pesoController.text = '';
    _alturaController.text = '';
    setState(() {
      _infoText = "Informe seus dados";
      _formKey.currentState?.reset();
    });
  }

  void calcular() {
    String resultado = _controller.calcular(pesoTexto: _pesoController.text, AlturaTexto: _alturaController.text);

    // Atualiza a tela com o resultado
    setState(() => _infoText = resultado);
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
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(Icons.person_outline, size: 120.0, color: Colors.deepPurple),
              TextFormField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira seu peso!';
                  }
                  return null;
                },
              ),
              // Espaçamento entre os campos
              TextFormField(
                controller: _alturaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.deepPurple, fontSize: 25.0),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira sua altura!';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 20.0,
              ),

              //Botão de calcular
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('Formulario validado');
                      calcular();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                )
              ),

              //Texto de Resultado
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.deepPurple, fontSize: 25.0), 
                )
              ),
              // espaço para botão de resetar
              SizedBox(
                height: 20.0,
              ),
              // Botão de resetar
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    _resetFields();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Resetar',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                )
              )

            ],
          )
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Container(
          height: 50.0,
          alignment: Alignment.center,
          child: const Text(
            'Desenvolvido por Rafael Lopes',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}