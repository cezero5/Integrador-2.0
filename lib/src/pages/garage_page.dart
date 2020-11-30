import 'package:flutter/material.dart';

import 'package:formvalidation/src/bloc/provider.dart';

import 'package:formvalidation/src/search/search_delegate.dart';

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    final garageBloc = Provider.garageBloc(context);
    garageBloc.cargarGarage();

    return Scaffold(
      appBar: AppBar(
        title: Text('Garage'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
        ],
      ),
      //---body---
      body: _listaBotones(),
    );
  }

  //diseño de la pantalla

  //-------Botones de mi garaje

  Widget _botonTableroControl() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text('Tablero de control'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Colors.grey[700],
        textColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'tabcontrol'));
  }

  Widget _botonMisVehiculos() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text('Mis Vehiculos'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Colors.grey[700],
        textColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'misvehiculos'));
  }

  Widget _botonHojaVidaVehiculos() {
    return RaisedButton(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text('Hoja de vida de mis vehiculos'),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 0.0,
        color: Colors.grey[700],
        textColor: Colors.white,
        onPressed: () => Navigator.pushNamed(context, 'hojavidavehi'));
  }

  Widget _listaBotones() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 110.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.0),
          _botonTableroControl(),
          SizedBox(height: 50.0),
          _botonMisVehiculos(),
          SizedBox(height: 50.0),
          _botonHojaVidaVehiculos()
        ],
      ),
    );
  }
}
