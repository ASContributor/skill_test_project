part of 'posts_data_bloc.dart';

sealed class PostsDataEvent {
  const PostsDataEvent();
}

class GetDataFromApi extends PostsDataEvent {}
