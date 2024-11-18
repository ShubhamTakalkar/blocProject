import 'package:blocapp/features/homeBloc/home_bloc.dart';
import 'package:blocapp/features/ui/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Apiscreen extends StatefulWidget {
  HomeBloc homeBloc;
   Apiscreen({super.key, required this.homeBloc});

  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {

  @override
  void initState() {
    widget.homeBloc.add(PostsInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.homeBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
              case PostsFetchingLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case PostFetchingSuccessfulState:
                final successState = state as PostFetchingSuccessfulState;
                debugPrint('length is ${successState.posts.length}');
                return Scaffold(
appBar: AppBar(
   title: const Text('Api call'),
),
                  body: Container(
                    child: ListView.builder(
                      itemCount: successState.posts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(successState.posts[index].title),
                              Text(successState.posts[index].body)
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              default:
                return const SizedBox();
            }
      },
    );
  }
}