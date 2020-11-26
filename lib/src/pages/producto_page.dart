import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/garage_bloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/garage_model.dart';

import 'package:image_picker/image_picker.dart';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  GarageBloc garageBloc;
  GarageModel garage = new GarageModel();

  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {
    garageBloc = Provider.garageBloc(context);

    final GarageModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      garage = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearModelo(),
                _crearFecha(),
                _crearVin(),
                _crearKilometros(),
                _crearBoton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearModelo() {
    return TextFormField(
      initialValue: garage.modelo.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Vin'),
      onSaved: (value) => garage.modelo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del garage';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearFecha() {
    return TextFormField(
      initialValue: garage.fecha.toString(),
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Vin'),
      onSaved: (value) => garage.fecha = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del garage';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearVin() {
    return TextFormField(
      initialValue: garage.vin.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: false),
      decoration: InputDecoration(labelText: 'Vin'),
      onSaved: (value) => garage.vin = int.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.grey[700],
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: (_guardando) ? null : _submit,
    );
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    setState(() {
      _guardando = true;
    });

    if (garage.name == null) {
      garageBloc.agregarGarage(garage);
    } else {
      garageBloc.editarGarage(garage);
    }

    // setState(() {_guardando = false; });
    mostrarSnackbar('Registro guardado');

    Navigator.pop(context);
  }

  void mostrarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _crearKilometros() {
    return TextFormField(
      initialValue: garage.kilometros.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(labelText: 'Precio'),
      onSaved: (value) => garage.kilometros = double.parse(value),
      validator: (value) {
        if (utils.isNumeric(value)) {
          return null;
        } else {
          return 'Sólo números';
        }
      },
    );
  }
}
