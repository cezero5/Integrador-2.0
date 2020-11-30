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
    return Dismissible(
      key: UniqueKey(),
      child: ListTile(
        key: UniqueKey(),
        //margin: EdgeInsetsGeometry.lerp(a, b, t),
        title: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mis vehiculos",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
              Text('Vin: ${garageM.vin} ', style: TextStyle(fontSize: 20.0)),
              Text('kilometros: ${garageM.kilometros}',
                  style: TextStyle(fontSize: 20.0)),
              Text('Proximo cambio de aceite: ${garageM.fecha}',
                  style: TextStyle(fontSize: 20.0)),
              Text('Modelo: ${garageM.modelo}',
                  style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ),
        onTap: () =>
            Navigator.pushNamed(context, 'hojavidavehi', arguments: garageM),
      ),
    );
  }
}
