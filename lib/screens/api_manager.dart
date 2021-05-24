import 'package:http/http.dart' as http;

import '../constants/strings.dart';
import '../models/university.dart';

// ignore: camel_case_types
class API_Manager {
  Future<List<University>> getUniversities() async {
    var client = http.Client();
    List<University> university = [];
    var response = await client.get(Uri.parse(Strings.universiries_url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      university = universityFromJson(jsonString);
    } else
      throw Exception('Failed to load album');

    return university;
  }
}
