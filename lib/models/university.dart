import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<University> universityFromJson(String str) =>
    List<University>.from(json.decode(str).map((x) => University.fromJson(x)));

class University {
  final UniqueKey id = UniqueKey();
  final String name;
  final String url;
  final String country;

  University({
    required this.name,
    required this.url,
    required this.country,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      url: json['web_pages'].first,
      country: json['country'],
    );
  }
}
