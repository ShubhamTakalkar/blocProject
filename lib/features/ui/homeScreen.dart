import 'package:blocapp/features/homeBloc/home_bloc.dart';
import 'package:blocapp/features/ui/apiScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final HomeBloc homeBloc = HomeBloc();  

 @override
  void initState() {
    //homeBloc.add(event)
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  
    
    Scaffold(
      appBar: AppBar(
        title: const Text('Block assignment'),
        
      ),
      body: BlocListener(
        bloc:homeBloc,
        listener: 
      (context,state){
        if(state is NavigateState){
          Navigator.push(context, 
          MaterialPageRoute(builder:(context)=>  Apiscreen(homeBloc: homeBloc,))
          );
        }
      },
      child: Center(
        child: ElevatedButton(onPressed: (){
       //   context.read<HomeBloc>().add(NavigateEvent());
          homeBloc.add(NavigateEvent());
        }, child: 
        const Text('Get Post')
        ),
      ),
      )
   
  
    );
  }
}