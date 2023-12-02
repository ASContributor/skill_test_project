import 'dart:convert';

import 'package:http/http.dart ' as http;
import 'package:skill_test_project/data/model/post.dart';

class PostList {
  Future<List<post>> getPost() async {
    try {
      http.Response apiresponse;
      apiresponse = await http.get(Uri.parse('https://reqres.in/api/users'));
      // print('hear ${apiresponse.body}');
      Map<String, dynamic> parsedResponse = jsonDecode(apiresponse.body);

      List<post> posts = (parsedResponse['data'] as List)
          .map((postJson) => post.fromJson(postJson))
          .toList();

      // posts.forEach((post) => print(post.id));

      return posts;
    } catch (e) {
      return [];
    }
  }
}
