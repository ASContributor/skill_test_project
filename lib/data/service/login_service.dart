import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static String url = 'https://www.universal-tutorial.com/api/getaccesstoken';
  Future<String> getToken(
      {required String email, required String token}) async {
    try {
      print(email);
      print(token);
      var response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "api-token": token,
        "user-email": email
      });
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      return data['auth_token'];
    } catch (e) {
      return '';
    }
  }
}
