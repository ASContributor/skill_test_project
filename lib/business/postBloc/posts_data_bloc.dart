import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:skill_test_project/data/model/post.dart';
import 'package:skill_test_project/data/repo/post_data.dart';

part 'posts_data_event.dart';
part 'posts_data_state.dart';

class PostsDataBloc extends Bloc<PostsDataEvent, PostsDataState> {
  postRepo repo;
  PostsDataBloc({required this.repo}) : super(const PostsLoadingState([])) {
    on<PostsDataEvent>((event, emit) async {
      if (event is GetDataFromApi) {
        emit(const PostsLoadingState([]));
        final List<post> posts = await repo.getPost();
        // print('Post Status ${posts[0].id}');
        if (posts.isEmpty) {
          print('empty');
          emit(PostsLoadFailState('unable to load'));
        } else {
          emit(PostsLoadedState(posts));
        }
      }
    });
  }
}
