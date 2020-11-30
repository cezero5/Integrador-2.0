import 'dart:convert';

import 'package:formvalidation/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

import 'package:formvalidation/src/models/garage_model.dart';

class GarageProvider {
  final String _url = 'https://flutter-varios-d2538.firebaseio.com';
  final _prefs = new PreferenciasUsuario();

  Future<bool> crearGarage(GarageModel garage) async {
    final url = '$_url/vehiculos.json?auth=${_prefs.token}';

    final resp = await http.post(url, body: garageModelToJson(garage));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<bool> editarGarage(GarageModel garage) async {
    final url = '$_url/vehiculos/${garage.id}.json';

    final resp = await http.put(url, body: garageModelToJson(garage));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }

  Future<List<GarageModel>> cargarGarage() async {
    final url = '$_url/vehiculos.json?auth=${_prefs.token}';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<GarageModel> garages = new List();

    if (decodedData == null) return [];

    if (decodedData['error'] != null) return [];

    decodedData.forEach((id, prod) {
      final prodTemp = GarageModel.fromJson(prod);
      prodTemp.id = id;

      garages.add(prodTemp);
    });

    // print( productos[0].id );

    return garages;
  }

  /*Future<int> borrarProducto(String id) async {
    final url = '$_url/productos/$id.json?auth=${_prefs.token}';
    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }*/

  /* Future<String> subirImagen(File imagen) async {
    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/dh3e6oczl/image/upload?upload_preset=jlye7wzx');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', imagen.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);

    return respData['secure_url'];
  }*/

  /*Future<List<GarageModel>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final garage = new GarageModel.fromJson(decodedData['results']);

    return garage;
  }

  Future<List<GarageModel>> buscarGarage(String query) async {
    String _url = 'https://flutter-varios-d2538.firebaseio.com/vehiculos';
    final url = Uri.https(_url, 'AIzaSyDL4dolvRlp9ZNz3kkYg3za2Uyvc4I_hlY');

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final garage = decodedData;

    return await garage;
  }*/
}
