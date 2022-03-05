import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/blocks/list_post_cubit.dart';
import 'package:patterns_bloc/pages/Post_add_page.dart';
import 'package:patterns_bloc/pages/bottomsheet_page.dart';
import 'package:patterns_bloc/pages/home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ListPostCubit()),
        ],
        child: const Home_page(),
      ),
      //
      routes: {
        Home_page.id:(context)=>const Home_page(),
        Post_add_page.id:(context)=>const Post_add_page(),
        BottomSheetpage.id:(context)=>BottomSheetpage(),
      },
    );

  }
}
