import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/pages/cart_page.dart';

class PageDetalle extends StatelessWidget {
  List<ProductoModel> _prductoModel = List<ProductoModel>();
  final producto1 = new ProductoModel();
  final cart = new CartPage();
  @override
  Widget build(BuildContext context) {
    final ProductoModel producto = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      floatingActionButton: _buttonCart(),
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppbar(producto),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0),
              _cuerpoDetalle(context, producto),
              SizedBox(height: 20),
              _descripcion(producto),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _crearAppbar(ProductoModel producto) {
    return SliverAppBar(
      elevation: 20.0,
      backgroundColor: Colors.grey[700],
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: FadeInImage(
          image: NetworkImage(producto.fotoUrl),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _cuerpoDetalle(BuildContext context, ProductoModel producto) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text(producto.titulo,
              style: TextStyle(fontSize: 30), overflow: TextOverflow.ellipsis),
          SizedBox(height: 10.0),
          Row(
            children: <Widget>[
              Text('Cantidad: ' + producto.stock.toString(),
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
              SizedBox(width: 50.0),
              Icon(Icons.attach_money),
              Text(producto.valor.toString(),
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          SizedBox(height: 10.0),
          Text('Vin: ${producto.vin}',
              style: TextStyle(fontSize: 23), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  FloatingActionButton _buttonCart() {
    return FloatingActionButton(
      child: Icon(Icons.shopping_cart),
      backgroundColor: Colors.grey[700],
      onPressed: () {
        //addCart(listCart);
      },
    );
  }

  void addCart(List lista) {
    lista.add(producto1.titulo);
  }

  Widget _descripcion(ProductoModel producto) {
    return Container(
      child: Text(
        producto.descripcion +
            producto.descripcion +
            producto.descripcion +
            producto.descripcion +
            producto.descripcion +
            producto.descripcion +
            producto.descripcion +
            producto.descripcion,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      /*SizedBox(
          height: 30,
        ),
        FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),*/
    );
  }
}
