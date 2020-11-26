import 'package:flutter/material.dart';

class HojavidaVehi extends StatefulWidget {
  HojavidaVehi({Key key}) : super(key: key);

  @override
  _HojavidaVehiState createState() => _HojavidaVehiState();
}

class _HojavidaVehiState extends State<HojavidaVehi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Hoja de vida de vehiculos"),
       ),
    );
  }
}