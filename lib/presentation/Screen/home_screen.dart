import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/data/model/post.dart';

import '../../business/postBloc/posts_data_bloc.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  void initState() {
    BlocProvider.of<PostsDataBloc>(context).add(GetDataFromApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PostsDataBloc, PostsDataState>(
        listener: (context, state) {
          final List<post> data =
              BlocProvider.of<PostsDataBloc>(context).state.posts;
        },
        builder: (context, state) {
          List<post> posts = <post>[];
          String errorMsg = '';
          if (state is PostsLoadingState) {
            print('Loading');
          }

          if (state is PostsLoadedState) {
            posts = state.posts;
          } else if (state is PostsLoadFailState) {
            print('IN error');
            errorMsg = state.error;
            print(errorMsg);
          }

          return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => Card(
                    child: Text("${posts[index].email}"),
                  ));
        },
      ),
    );
  }
}
