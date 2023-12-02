// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

List<StateModel> stateModelFromJson(String str) =>
    List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  String? stateName;

  StateModel({
    this.stateName,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "state_name": stateName,
      };
}
