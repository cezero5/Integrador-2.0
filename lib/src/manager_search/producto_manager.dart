import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:formvalidation/src/models/producto_model.dart';

class ProductoManager {
  final productoModel = new ProductoModel();

  Future getProductoByName(String name) async {
    /*for (var i = 0; i < ; i++) {
      if(name == productoModel[i].)
    }*/

    try {
      final _url = 'https://flutter-varios-d2538.firebaseio.com/productos.json';

      final resp = await http.get(_url);
      final Map<String, dynamic> decodeData = json.decode(resp.body);
      final List<ProductoModel> productos = new List();
      if (decodeData == null) return [];

      decodeData.forEach((id, prod) {
        final prodTemp = ProductoModel.fromJson(prod);
        prodTemp.id = id;
      });
    } catch (e) {
      print(e);
      return [];
    }
  }
}
