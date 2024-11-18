import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocapp/features/model/posts_model.dart';
import 'package:blocapp/features/repo/post_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NavigateEvent>((event,emit){
        emit(NavigateState());
    });
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

   FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<HomeState> emit) async {
    emit(PostsFetchingLoadingState());
    try{
    List<PostDataUiModel> posts = await PostsRepo.fetchPosts();
   emit(PostFetchingSuccessfulState(posts: posts));
    }catch(e){
      emit(PostsFetchingErrorState());
    }
    
  }


}
