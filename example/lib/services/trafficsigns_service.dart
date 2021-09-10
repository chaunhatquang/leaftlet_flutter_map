import 'package:flutter_map_marker_cluster_example/models/trafficsign_content_model.dart';
import 'package:flutter_map_marker_cluster_example/models/trafficsigns_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

const String urlTrafficSigns = "https://gissonganh.thuathienhue.gov.vn/gservices/rest/geodatas/gsv_data/BB_BienBaoDuongBo";
const String urlTrafficSignsCategory = "https://gissonganh.thuathienhue.gov.vn/gservices/rest/geodatas/gsv_data/DM_NoiDungBienBao";

///Test call Api trafficsigns
Future<List<SearchResult>> fetchAllTrafficSignProvince() async {
  // tạo GET request
  List<SearchResult> results = [];
  Response response = await get(Uri.parse(urlTrafficSigns));
  // data sample trả về trong response
  int statusCode = response.statusCode;
  //Map<String, String> headers = response.headers;
  //String contentType = headers['content-type'];
  if (statusCode == 200) {
    //json string
    var jsonString = response.body;
    var tagObjsJson = jsonDecode(jsonString)['searchResult'] as List;
    results = tagObjsJson.map((tagJson) => SearchResult.fromJson(tagJson)).toList();
  } else {
    throw Exception('Failed to load results');
  }
  // Thực hiện convert json to object...
  return results;
}


///goi danh muc bien bao
Future<List<ContentResult>> fetchTrafficSignCategory() async {
  // tạo GET request
  List<ContentResult> results = [];
  Response response = await get(Uri.parse(urlTrafficSignsCategory));
  // data sample trả về trong response
  int statusCode = response.statusCode;
  //Map<String, String> headers = response.headers;
  //String contentType = headers['content-type'];
  if (statusCode == 200) {
    //json string
    var jsonString = response.body;
    var tagObjsJson = jsonDecode(jsonString)['searchResult'] as List;
    results = tagObjsJson.map((tagJson) => ContentResult.fromJson(tagJson)).toList();
  } else {
    throw Exception('Failed to load results');
  }
  // Thực hiện convert json to object...
  return results;
}
