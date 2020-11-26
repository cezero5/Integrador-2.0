import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/garage_bloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/garage_model.dart';

class MisVehiculos extends StatefulWidget {
  MisVehiculos({Key key}) : super(key: key);

  @override
  _MisVehiculosState createState() => _MisVehiculosState();
}

class _MisVehiculosState extends State<MisVehiculos> {
  @override
  Widget build(BuildContext context) {
    final garageBl = Provider.garageBloc(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Vehiculos"),
      ),
      body: _crearPantallaVin(garageBl),
    );
  }

  Widget _crearPantallaVin(GarageBloc garageBloc) {
    return StreamBuilder(
      stream: garageBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<GarageModel>> snapshot) {
        if (snapshot.hasData) {
          final garages = snapshot.data;

          return ListView.builder(
            itemCount: garages.length,
            itemBuilder: (context, i) =>
                _crearVin(context, garageBloc, garages[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearVin(
      BuildContext conctext, GarageBloc garageBl, GarageModel garageM) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Vin: ${garageM.vin}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}
