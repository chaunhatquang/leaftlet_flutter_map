// To parse this JSON data, do
//
//     final trafficSignsModel = trafficSignsModelFromJson(jsonString);

import 'dart:convert';

TrafficSignsModel trafficSignsModelFromJson(String str) => TrafficSignsModel.fromJson(json.decode(str));

String trafficSignsModelToJson(TrafficSignsModel data) => json.encode(data.toJson());

class TrafficSignsModel {
  TrafficSignsModel({
    required this.resultCount,
    required this.searchResult,
  });

  String resultCount;
  List<SearchResult> searchResult;

  factory TrafficSignsModel.fromJson(Map<String, dynamic> json) => TrafficSignsModel(
    resultCount: json["resultCount"],
    searchResult: List<SearchResult>.from(json["searchResult"].map((x) => SearchResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "resultCount": resultCount,
    "searchResult": List<dynamic>.from(searchResult.map((x) => x.toJson())),
  };
}

class SearchResult {
  SearchResult({
    required this.madoituong,
    required this.malienket,
    required this.tendoituong,
    required this.nhanbando,
    required this.xdaidien,
    required this.ydaidien,
    required this.geom,
    required this.trangthai,
    required this.sGeo,
    required this.sXdaidien,
    required this.sYdaidien,
    required this.sohieu,
    required this.lytrinh,
    required this.manoidungbienbao,
    required this.noidungbienbao,
    required this.loaibienbao,
    required this.tenduong,
    required this.vitridat,
    required this.huongdat,
    required this.donviquanly,
    required this.ngaylapkh,
    required this.ngaylapdat,
    required this.ngaythaodo,
    required this.nguoithuchien,
    required this.nguoipheduyet,
    required this.tinhtrang,
    required this.ghichu,
    required this.capquanly,
    required this.resultnumber,
  });

  String madoituong;
  String malienket;
  String tendoituong;
  String nhanbando;
  String xdaidien;
  String ydaidien;
  String geom;
  String trangthai;
  String sGeo;
  String sXdaidien;
  String sYdaidien;
  String sohieu;
  String lytrinh;
  String manoidungbienbao;
  String noidungbienbao;
  String loaibienbao;
  String tenduong;
  String vitridat;
  String huongdat;
  String donviquanly;
  String ngaylapkh;
  String ngaylapdat;
  String ngaythaodo;
  String nguoithuchien;
  String nguoipheduyet;
  String tinhtrang;
  String ghichu;
  String capquanly;
  String resultnumber;

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    madoituong: json["madoituong"],
    malienket: json["malienket"],
    tendoituong: json["tendoituong"],
    nhanbando: json["nhanbando"],
    xdaidien: json["xdaidien"] ,
    ydaidien: json["ydaidien"],
    geom: json["geom"],
    trangthai: json["trangthai"],
    sGeo: json["s_geo"],
    sXdaidien: json["s_xdaidien"],
    sYdaidien: json["s_ydaidien"],
    sohieu: json["sohieu"],
    lytrinh: json["lytrinh"],
    manoidungbienbao: json["manoidungbienbao"],
    noidungbienbao: json["noidungbienbao"],
    loaibienbao: json["loaibienbao"],
    tenduong: json["tenduong"],
    vitridat: json["vitridat"],
    huongdat: json["huongdat"],
    donviquanly: json["donviquanly"],
    ngaylapkh: json["ngaylapkh"],
    ngaylapdat: json["ngaylapdat"],
    ngaythaodo: json["ngaythaodo"],
    nguoithuchien: json["nguoithuchien"],
    nguoipheduyet: json["nguoipheduyet"],
    tinhtrang: json["tinhtrang"],
    ghichu: json["ghichu"],
    capquanly: json["capquanly"],
    resultnumber: json["resultnumber"],
  );

  Map<String, dynamic> toJson() => {
    "madoituong": madoituong,
    "malienket": malienket,
    "tendoituong": tendoituong,
    "nhanbando": nhanbando,
    "xdaidien": xdaidien,
    "ydaidien": ydaidien,
    "geom": geom,
    "trangthai": trangthai,
    "s_geo": sGeo,
    "s_xdaidien": sXdaidien,
    "s_ydaidien": sYdaidien,
    "sohieu": sohieu,
    "lytrinh": lytrinh,
    "manoidungbienbao": manoidungbienbao,
    "noidungbienbao": noidungbienbao,
    "loaibienbao": loaibienbao,
    "tenduong": tenduong,
    "vitridat": vitridat,
    "huongdat": huongdat,
    "donviquanly": donviquanly,
    "ngaylapkh": ngaylapkh,
    "ngaylapdat": ngaylapdat,
    "ngaythaodo": ngaythaodo,
    "nguoithuchien": nguoithuchien,
    "nguoipheduyet": nguoipheduyet,
    "tinhtrang": tinhtrang,
    "ghichu": ghichu,
    "capquanly": capquanly,
    "resultnumber": resultnumber,
  };
}
