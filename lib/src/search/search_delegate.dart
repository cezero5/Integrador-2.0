import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';

class DataSearch extends SearchDelegate {
  final producto = new ProductoModel();
  List list = [
    'Motor v8',
    'Retrovisores',
    'Frenos',
    'Caja de cambios',
    'Volante',
    'Tubo de escape',
    'llantas',
    'Motor V-12'
  ];
  List listRecent = ['Motor v8', 'Aire acondicionado', 'Rin'];
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
    return Container(
      height: 100,
      width: 100,
      child: Card(
        color: Colors.black,
        child: Center(
          child: Text(producto.titulo),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? list
        : listRecent
            .where((element) =>
                element.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      /* itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.car_repair),
        title: Text(producto.titulo),
        onTap: () {
          close(context, null);
          producto.id.toString();
          Navigator.pushNamed(context, 'detalle', arguments: producto);
        },
      ),*/
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.shop_two),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
    );
  }

  /*List _addListaNormal() {
    List lista = [];
    lista.add(producto.titulo);
    print('lista $lista');
    for (var i = 1; i >= lista.length + 1; i++) {
      final producto1 = new ProductoModel();
      lista[i].add(producto1.titulo);
    }
    return lista;
  }

  List _addListaRecent() {
    List lista = [''];
    for (var i = (lista.length - 3); i >= lista.length; i++) {
      final producto1 = new ProductoModel();
      lista[i].add(producto1.titulo);
    }
    return lista;
  }*/
}
