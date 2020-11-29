import 'dart:convert';

GarageModel garageModelFromJson(String str) =>
    GarageModel.fromJson(json.decode(str));

String garageModelToJson(GarageModel data) => json.encode(data.toJson());

class GarageModel {
  String id;
  int vin;
  double kilometros;
  String fecha;
  String modelo;

  GarageModel({
    this.id = '',
    this.vin = 0,
    this.kilometros = 0.0,
    this.fecha = '',
    this.modelo = '',
  });

  factory GarageModel.fromJson(Map<String, dynamic> json) => new GarageModel(
        id: json["id"],
        vin: json["vin"],
        kilometros: json["kilometros"],
        fecha: json["fecha"],
        modelo: json["modelo"],
      );

  Map<String, dynamic> toJson() => {
        // "name": name,
        "vin": vin,
        "kilometros": kilometros,
        "fecha": fecha,
        "modelo": modelo,
      };
}
