import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/search/search_delegate.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productosBloc = Provider.productosBloc(context);

    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
      drawer: _crearMenu(context),

      body: _crearListado(productosBloc),
      // floatingActionButton: _crearBoton(context),
    );
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

  Drawer _crearMenu(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('Carlos'),
            accountEmail: new Text('carlos@test.test'),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage('https://i.pravatar.cc/300'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.time_to_leave, color: Colors.grey[700]),
            title: Text('Garage'),
            onTap: () => Navigator.pushNamed(context, 'garagepage'),
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.grey[700]),
            title: Text('Cupones'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.grey[700]),
            title: Text('Mis compras'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.favorite_border, color: Colors.grey[700]),
            title: Text('Lista de deseados'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.keyboard_return, color: Colors.grey[700]),
            title: Text('Cerrar Sesion'),
            onTap: () => Navigator.pushNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}
