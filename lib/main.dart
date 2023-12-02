import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_project/app_route.dart';
import 'package:skill_test_project/business/authBloc/auth_bloc.dart';
import 'package:skill_test_project/business/productBloc/product_bloc.dart';

import 'business/bottom_navBloc/bottom_navigator_bloc.dart';
import 'business/postBloc/posts_data_bloc.dart';
import 'data/repo/post_data.dart';
import 'data/repo/product_repo.dart';

void main() {
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => productRepo(),
      ),
      RepositoryProvider(
        create: (context) => postRepo(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (context) => BottomNavigatorBloc(),
        ),
           BlocProvider(
          
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) =>
              PostsDataBloc(repo: RepositoryProvider.of<postRepo>(context)),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(ProRepo: RepositoryProvider.of<productRepo>(context)),
        ),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        onGenerateRoute: appRoutes().onGenerateRoute,
      ),
    );
  }
}
