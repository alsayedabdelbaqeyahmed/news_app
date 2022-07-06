import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/bloc_observer/bloc_observer.dart';
import 'package:news_app/controller/buisness_bloc/buisness_cubit.dart';
import 'package:news_app/controller/home_bloc/home_bloc.dart';
import 'package:news_app/controller/science_bloc.dart/science_cubit.dart';
import 'package:news_app/controller/sports_bloc.dart/sport_cubit.dart';
import 'package:news_app/model/dio_helper/dio_helper.dart';
import 'package:news_app/view/home/home_page.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      HomeCubit();
      BuisnessCubit();
    },
    blocObserver: NewsObserver(),
  );
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => BuisnessCubit()..getBuisnessNews()),
        BlocProvider(create: (context) => ScienceCubit()..getScienceNews()),
        BlocProvider(create: ((context) => SportCubit()..getSportNews()))
      ],
      child: LayoutBuilder(builder: (context, constr) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          themeMode: ThemeMode.system,
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
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                )),
            primarySwatch: Colors.deepOrange,
          ),
          home: const MyHomePage(),
        );
      }),
    );
  }
}
