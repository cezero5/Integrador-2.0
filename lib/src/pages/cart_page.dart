import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/productos_bloc.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/search/search_delegate.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<CartPage> {
  final productosBloc = new ProductosBloc();
  final producto = new ProductoModel();
  List cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
      ),
    );
  }

  void addCart(List lista) {
    lista.add(producto.titulo);
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) =>
                _crearItem(context, productosBloc, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc,
      ProductoModel producto) {
    return Center(
        // key: UniqueKey(),
        /*  background: Container(
          color: Colors.red,
        ),*/
        //       onDismissed: (direccion) => productosBloc.borrarProducto(producto.id),
        child: Card(
      child: Column(
        children: <Widget>[
          (producto.fotoUrl == null)
              ? Image(image: AssetImage('assets/no-image.png'))
              : FadeInImage(
                  image: NetworkImage(producto.fotoUrl),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  height: 300.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          //   Row(
          //  children: <Widget>[
          ListTile(
            title: Text('${producto.titulo} - Cantidad: ${producto.stock}'),
            subtitle: Text('\$' + producto.valor.toString()),
            onTap: () =>
                Navigator.pushNamed(context, 'detalle', arguments: producto),
          ),
        ],
      ),
      //  ],
      //),
    ));
  }
}
