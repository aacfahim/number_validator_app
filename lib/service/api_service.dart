import 'dart:convert';
import 'package:phone_number_validator/constants/const.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> getNumberData(String number) async {
    var link = "$baseURL$number";
    var response = await http.get(Uri.parse(link));
    var json = jsonDecode(response.body);

    return json;
  }
}
