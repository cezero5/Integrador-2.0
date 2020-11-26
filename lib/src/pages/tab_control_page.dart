import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/garage_bloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/garage_model.dart';

class TableroControl extends StatefulWidget {
  TableroControl({Key key}) : super(key: key);

  @override
  _TableroControlState createState() => _TableroControlState();
}

class _TableroControlState extends State<TableroControl> {
  @override
  Widget build(BuildContext context) {
    final garageBl = Provider.garageBloc(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tablero de control"),
      ),
      body: _crearTablacontrol(garageBl),
    );
  }

  Widget _crearTablacontrol(GarageBloc garageBloc) {
    return StreamBuilder(
      stream: garageBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<GarageModel>> snapshot) {
        if (snapshot.hasData) {
          final garages = snapshot.data;

          return ListView.builder(
            itemCount: garages.length,
            itemBuilder: (context, i) =>
                _tablaControl(context, garageBloc, garages[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _tablaControl(
      BuildContext conctext, GarageBloc garageBl, GarageModel garageM) {
    return Center(
      child: Card(
        //margin: EdgeInsetsGeometry.lerp(a, b, t),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Mis vehiculos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
            Text('Vin: ${garageM.vin} ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
            Text('kilometros: ${garageM.kilometros}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0)),
          ],
        ),
      ),
    );
  }
}
