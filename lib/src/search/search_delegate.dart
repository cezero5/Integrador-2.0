import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/manager_search/producto_manager.dart';

class DataSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    if (query.trim().length == 0) {
      return Text('no hay valor en el query');
    }
    final productoManager = new ProductoManager();
    return FutureBuilder(
      future: productoManager.getProductoByName(query),
      builder: (_, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return _showProductos(snapshot.data);
        } else {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 4),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListTile(title: Text('suggestions'));
  }

  Widget _showProductos(List<ProductoModel> productos) {
    return ListView.builder(
      itemCount: productos.length,
      itemBuilder: (_, i) {
        final producto = productos[i];

        return ListTile(
          title: Text(producto.titulo),
          trailing: Text('\$' + producto.valor.toString()),
        );
      },
    );
  }
}
