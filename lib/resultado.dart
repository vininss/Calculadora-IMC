import 'dart:ui';

import 'package:calculadora_imc/main.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class result extends StatefulWidget{
  double imc;
  String classificacao;
  result(this.imc, this.classificacao);
  @override
  _resultState createState() => _resultState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _resultState extends State<result> {
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          child: Column(
            children: [
              Center(
                child: Text(widget.imc.toStringAsPrecision(4), style: TextStyle(color: Colors.cyan.shade800, fontSize: 50.0, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text(widget.classificacao, style: TextStyle(color: Colors.cyan, fontSize: 25.0,),
                  textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}