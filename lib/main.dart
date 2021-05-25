import 'package:calculadora_imc/resultado.dart';
import 'package:flutter/material.dart';
import 'resultado.dart';
void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String infoText;

  TextEditingController weightController= TextEditingController();
  TextEditingController heightController= TextEditingController();

  Widget buildTextField(String label, TextEditingController c){
    return TextField(
      decoration: InputDecoration(
          labelText: label, labelStyle: TextStyle(color: Colors.cyan, fontSize: 20.0),
          border: OutlineInputBorder()
      ),
      style: TextStyle(color: Colors.cyan, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }
  void _resetFilds(){
    setState(() {
      weightController.clear();
      heightController.clear();
    });
  }
  void _calcular(){
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100.0;
    double imc = weight/(height * height);

    setState(() {
      if (imc < 18.6) {
        infoText = "ABAIXO DO PESO";
      } else if (imc < 25.0)
        infoText = "PESO IDEAL";
      else if (imc < 30.0)
        infoText = "LEVEMENTE ACIMA DO PESO";
      else if (imc < 35.0)
        infoText = "OBESIDADE GRAU I";
      else if (imc < 40.0)
        infoText = "OBESIDADE GRAU II";
      else
        infoText = "OBESIDADE GRAU III";

    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => result(imc, infoText)));

  }
  @override
  // TODO: implement widget
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFilds();
            },),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline, size: 170.0, color: Colors.black26,),
            buildTextField("Peso(kg)", weightController),
            Divider(),
            buildTextField("Altura(cm)", heightController),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  child: Text("Verificar", style: TextStyle(color: Colors.white, fontSize: 20.0,)),
                  onPressed: _calcular,
                  color: Colors.cyan,
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}