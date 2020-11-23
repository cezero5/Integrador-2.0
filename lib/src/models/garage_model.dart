import 'dart:convert';

GarageModel garageModelFromJson(String str) =>
    GarageModel.fromJson(json.decode(str));

String garageModelToJson(GarageModel data) => json.encode(data.toJson());

class GarageModel {
  String name;
  int vin;
  double kilometros;

  GarageModel({
    this.name = '',
    this.vin = 0,
    this.kilometros = 0.0,
  });

  factory GarageModel.fromJson(Map<String, dynamic> json) => new GarageModel(
        name: json["name"],
        vin: json["valor"],
        kilometros: json["kilometros"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "vin": vin,
        "kilometros": kilometros,
      };
}
