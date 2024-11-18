part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class NavigateEvent extends HomeEvent{}

class PostsInitialFetchEvent extends HomeEvent{}


