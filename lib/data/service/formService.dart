import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skill_test_project/data/model/countryModel.dart';
import 'package:skill_test_project/data/model/stateModel.dart';

class FormService {
  Future<List<Country>> getCountry(String token) async {
    print(token);
    var res = await http.get(
        Uri.parse('https://www.universal-tutorial.com/api/countries/'),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        });
    if (res.statusCode == 200) {
      List<Country> data = (jsonDecode(res.body) as List)
          .map((e) => Country.fromJson(e))
          .toList();
      // print(data[0].countryName);
      return data;
    } else {
      return [];
    }
  }

  Future<List<StateModel>> getState(String token, String country) async {
    var res = await http.get(
        Uri.parse('https://www.universal-tutorial.com/api/states/$country'),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json"
        });
    if (res.statusCode == 200) {
      List<dynamic> tmp = jsonDecode(res.body);
      List<StateModel> data = (tmp).map((e) => StateModel.fromJson(e)).toList();

      return data;
    } else {
      return [];
    }
  }
}
