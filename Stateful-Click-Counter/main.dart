import 'package:flutter/material.dart';

void main() {
  runApp(IMCCalculator());
}

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IMCCalculatorPage(),
    );
  }
}

class IMCCalculatorPage extends StatefulWidget {
  @override
  _IMCCalculatorPageState createState() => _IMCCalculatorPageState();
}

class _IMCCalculatorPageState extends State<IMCCalculatorPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _resultado = '';

  void _calcularIMC() {
    final double peso = double.parse(_pesoController.text);
    final double altura = double.parse(_alturaController.text) / 100;

    final double imc = peso / (altura * altura);

    setState(() {
      if (imc < 18.5) {
        _resultado = 'IMC: ${imc.toStringAsFixed(2)} (Bajo peso)';
      } else if (imc >= 18.5 && imc < 24.9) {
        _resultado = 'IMC: ${imc.toStringAsFixed(2)} (Peso normal)';
      } else if (imc >= 25 && imc < 29.9) {
        _resultado = 'IMC: ${imc.toStringAsFixed(2)} (Sobrepeso)';
      } else {
        _resultado = 'IMC: ${imc.toStringAsFixed(2)} (Obesidad)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
