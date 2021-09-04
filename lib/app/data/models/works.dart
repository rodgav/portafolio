// To parse this JSON data, do
//
//     final worksModel = worksModelFromJson(jsonString);

import 'dart:convert';

WorksModel worksModelFromJson(String str) => WorksModel.fromJson(json.decode(str));

String worksModelToJson(WorksModel data) => json.encode(data.toJson());

class WorksModel {
  WorksModel({
    required this.works,
  });

  List<Work> works;

  factory WorksModel.fromJson(Map<String, dynamic> json) => WorksModel(
    works: List<Work>.from(json["works"].map((x) => Work.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "works": List<dynamic>.from(works.map((x) => x.toJson())),
  };
}

class Work {
  Work({
    required this.name,
    required this.description,
    required this.asset,
    required this.state,
    required this.url,
    required this.accomplished,
    required this.backend,
  });

  String name;
  String description;
  String asset;
  String state;
  String url;
  String accomplished;
  List<String> backend;

  factory Work.fromJson(Map<String, dynamic> json) => Work(
    name: json["name"],
    description: json["description"],
    asset: json["asset"],
    state: json["state"],
    url: json["url"],
    accomplished: json["accomplished"],
    backend: List<String>.from(json["backend"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "asset": asset,
    "state": state,
    "url": url,
    "accomplished": accomplished,
    "backend": List<dynamic>.from(backend.map((x) => x)),
  };
}
