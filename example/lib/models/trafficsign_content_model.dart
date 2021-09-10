// To parse this JSON data, do
//
//     final trafficSignContent = trafficSignContentFromJson(jsonString);

import 'dart:convert';

TrafficSignContentModel trafficSignContentFromJson(String str) => TrafficSignContentModel.fromJson(json.decode(str));

String trafficSignContentToJson(TrafficSignContentModel data) => json.encode(data.toJson());

class TrafficSignContentModel {
  TrafficSignContentModel({
    this.resultCount,
    required this.contentResult,
  });

  String? resultCount;
  List<ContentResult> contentResult;

  factory TrafficSignContentModel.fromJson(Map<String, dynamic> json) => TrafficSignContentModel(
    resultCount: json["resultCount"],
    contentResult: List<ContentResult>.from(json["searchResult"].map((x) => ContentResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resultCount": resultCount,
    "searchResult": List<dynamic>.from(contentResult.map((x) => x.toJson())),
  };
}

class ContentResult {
  ContentResult({
    this.madoituong,
    this.malienket,
    this.tendoituong,
    this.nhanbando,
    this.trangthai,
    this.idNoidungbienbao,
    this.idTenbien,
    this.noidungbienbao,
    this.bienso,
    this.resultnumber,
  });

  String? madoituong;
  String? malienket;
  String? tendoituong;
  String? nhanbando;
  String? trangthai;
  String? idNoidungbienbao;
  String? idTenbien;
  String? noidungbienbao;
  String? bienso;
  String? resultnumber;

  factory ContentResult.fromJson(Map<String, dynamic> json) => ContentResult(
    madoituong: json["madoituong"],
    malienket: json["malienket"],
    tendoituong: json["tendoituong"],
    nhanbando: json["nhanbando"],
    trangthai: json["trangthai"],
    idNoidungbienbao: json["id_noidungbienbao"],
    idTenbien: json["id_tenbien"],
    noidungbienbao: json["noidungbienbao"],
    bienso: json["bienso"],
    resultnumber: json["resultnumber"],
  );

  Map<String, dynamic> toJson() => {
    "madoituong": madoituong,
    "malienket": malienket,
    "tendoituong": tendoituong,
    "nhanbando": nhanbando,
    "trangthai": trangthai,
    "id_noidungbienbao": idNoidungbienbao,
    "id_tenbien": idTenbien,
    "noidungbienbao": noidungbienbao,
    "bienso": bienso,
    "resultnumber": resultnumber,
  };
}
