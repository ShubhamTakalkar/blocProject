part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class NavigateState extends HomeState {}

class PostsFetchingLoadingState extends HomeState {}

class PostsFetchingErrorState extends HomeState {}

class PostFetchingSuccessfulState extends HomeState {
  final List<PostDataUiModel> posts;
  PostFetchingSuccessfulState({
    required this.posts,
  });
}