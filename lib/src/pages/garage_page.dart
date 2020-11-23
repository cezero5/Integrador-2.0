import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/garage_bloc.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/garage_model.dart';
import 'package:formvalidation/src/search/search_delegate.dart';

class GaragePage extends StatefulWidget {
  @override
  _GaragePageState createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    final garageBloc = Provider.garageBloc(context);

    garageBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('garagepage'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'cart');
            },
          ),
        ],
      ),

      body: _crearListado(garageBloc),
      // floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(GarageBloc garageBloc) {
    return StreamBuilder(
      stream: garageBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<GarageModel>> snapshot) {
        /*if (snapshot.hasData) {
          final garages = snapshot.data;

          return ListView.builder(
            itemCount: garages.length,
            itemBuilder: (context, i) =>
                _crearItem(context, garageBloc, garages[i]),
          );
        } else {*/
        return Center(child: CircularProgressIndicator());
        //}
      },
    );
  }

  /* Widget _crearItem(
      BuildContext context, GarageBloc garageBloc, GarageModel garage) {
    return Center(
        // key: UniqueKey(),
        /*  background: Container(
          color: Colors.red,
        ),*/
        //       onDismissed: (direccion) => garageBloc.borrarProducto(garage.id),
        child: Card(
      child: Column(
        children: <Widget>[
          (garage.fotoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                  image: NetworkImage(garage.fotoUrl),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          //   Row(
          //  children: <Widget>[
          /* ListTile(
            title: Text('${garage.titulo} - Cantidad: ${garage.stock}'),
            subtitle: Text('\$' + garage.valor.toString()),
            onTap: () =>
                Navigator.pushNamed(context, 'detalle', arguments: garage),
          ),*/
        ],
      ),
      //  ],
      //),
    ));
  }*/
}
