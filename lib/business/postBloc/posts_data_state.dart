part of 'posts_data_bloc.dart';

sealed class PostsDataState extends Equatable {
  const PostsDataState(this.posts);
  final List<post> posts;
  @override
  List<Object> get props => [];
}

final class PostsLoadingState extends PostsDataState {
  const PostsLoadingState(super.posts);
}

final class PostsLoadedState extends PostsDataState {
 
  const PostsLoadedState(posts) : super(posts);

  @override
  List<Object> get props => [posts];
}

final class PostsLoadFailState extends PostsDataState {
  final String error;

  PostsLoadFailState(this.error) : super([]);
  @override
  List<Object> get props => [error];
}
