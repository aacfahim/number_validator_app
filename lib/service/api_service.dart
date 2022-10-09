import 'dart:convert';

import 'package:phone_number_validator/constants/const.dart';
import 'package:phone_number_validator/model/json_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<JsonModel>> fetchData(String number) async {
    List<JsonModel> numberInfoList = [];
    JsonModel jsonModel;

    var link = "$baseURL$number";
    var response = await http.get(Uri.parse(link));
    var data = jsonDecode(response.body);

    print("data: $data");

    try {
      if (response.statusCode == 200) {
        for (var i in data) {
          jsonModel = JsonModel.fromJson(i);
          numberInfoList.add(jsonModel);
        }
        return numberInfoList;
      } else {
        showToast("Something went wrong");
        return numberInfoList;
      }
    } catch (e) {
      print(e);
      return numberInfoList;
    }
  }
}
