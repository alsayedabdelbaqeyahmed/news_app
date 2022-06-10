import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/buisness_bloc/buisness_cubit.dart';
import 'package:news_app/controller/home_bloc/home_bloc.dart';
import 'package:news_app/view/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => BuisnessCubit()),
      ],
      child: LayoutBuilder(builder: (context, constr) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
              unselectedIconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              selectedIconTheme: IconThemeData(color: Colors.deepOrange),
            ),
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: constr.maxWidth * 0.08,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: constr.maxWidth * 0.06,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                )),
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        );
      }),
    );
  }
}
