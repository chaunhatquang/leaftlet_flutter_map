import 'dart:core';

class MyItem {
  late double mLat;
  late double mLng;
  late String mTitle;
  late String mSnippet;

  ///constructor
  MyItem({required this.mLat,required this.mLng,required this.mTitle,required this.mSnippet});

  MyItem.fromJson(Map<String, dynamic> json) {
    mLat = json['lat'];
    mLng = json['lng'];
    mTitle = json['title'] ?? '';
    mSnippet = json['snippet'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['lat'] = mLat;
    data['lng'] = mLng;
    data['title'] = mTitle;
    data['snippet'] = mSnippet;
    return data;
  }
}