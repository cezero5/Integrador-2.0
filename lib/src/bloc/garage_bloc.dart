import 'package:formvalidation/src/models/garage_model.dart';
import 'package:formvalidation/src/providers/garage_provider.dart';

import 'package:rxdart/rxdart.dart';

class GarageBloc {
  final _garageController = new BehaviorSubject<List<GarageModel>>();
  final _cargandoController = new BehaviorSubject<bool>();

  final _garageProvider = new GarageProvider();

  Stream<List<GarageModel>> get productosStream => _garageController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarGarage() async {
    final garages = await _garageProvider.cargarGarage();
    _garageController.sink.add(garages);
  }

  void agregarGarage(GarageModel garage) async {
    _cargandoController.sink.add(true);
    await _garageProvider.crearGarage(garage);
    _cargandoController.sink.add(false);
  }

  /*Future<String> subirFoto(File foto) async {
    _cargandoController.sink.add(true);
    final fotoUrl = await _garageProvider.subirImagen(foto);
    _cargandoController.sink.add(false);

    return fotoUrl;
  }*/

  void editarGarage(GarageModel garage) async {
    _cargandoController.sink.add(true);
    await _garageProvider.editarGarage(garage);
    _cargandoController.sink.add(false);
  }

  /*void borrarProducto( String id ) async {

    await _productosProvider.borrarProducto(id);

  }*/

  dispose() {
    _garageController?.close();
    _cargandoController?.close();
  }
}
