import 'package:skill_test_project/data/model/post.dart';

import '../service/list_of_post.dart';

class postRepo {
  PostList PostAPI = PostList();

  Future<List<post>> getPost() async {
    List<post> posts = await PostAPI.getPost();
    if (posts.isEmpty) {
      print('empty');
      return [];
    } else {
      print(posts);
      return posts;
    }
  }
}
