import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/bloc_observer/bloc_observer.dart';
import 'package:news_app/controller/buisness_bloc/buisness_cubit.dart';
import 'package:news_app/controller/home_bloc/home_bloc.dart';
import 'package:news_app/controller/home_bloc/home_status.dart';
import 'package:news_app/controller/science_bloc.dart/science_cubit.dart';
import 'package:news_app/controller/search_bloc/search_cubit.dart';
import 'package:news_app/controller/sports_bloc.dart/sport_cubit.dart';
import 'package:news_app/model/dio_helper/dio_helper.dart';
import 'package:news_app/model/shared_pref_helper/shared_pref_helper.dart';
import 'package:news_app/view/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      HomeCubit();
      BuisnessCubit();
    },
    blocObserver: NewsObserver(),
  );
  DioHelper.init();
  await SharedHelper.initSharedPref();
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
        BlocProvider(create: ((context) => SportCubit()..getSportNews())),
        BlocProvider(create: ((context) => SearchCubit()))
      ],
      child: BlocConsumer<HomeCubit, HomeStatus>(
          listener: (context, state) {},
          builder: (ctx, state) {
            final cubit = HomeCubit.get(ctx);
            return LayoutBuilder(
              builder: (context, constr) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'News App',
                  themeMode: cubit.choseTheme(),
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.black,
                          fontSize: constr.maxWidth * 0.035,
                          fontWeight: FontWeight.bold),
                      bodyText2: TextStyle(
                        color: Colors.black,
                        fontSize: constr.maxWidth * .02,
                      ),
                    ),
                    bottomNavigationBarTheme:
                        const BottomNavigationBarThemeData(
                      selectedItemColor: Colors.deepOrange,
                      unselectedIconTheme: IconThemeData(color: Colors.black),
                      elevation: 0,
                      selectedIconTheme:
                          IconThemeData(color: Colors.deepOrange),
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
                        // status bar and ststus bar icon theme
                        systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark,
                        )),
                    primarySwatch: Colors.deepOrange,
                  ),
                  darkTheme: ThemeData(
                    textTheme: TextTheme(
                      bodyText1: TextStyle(
                          color: Colors.white,
                          fontSize: constr.maxWidth * 0.05,
                          fontWeight: FontWeight.bold),
                      bodyText2: TextStyle(
                        color: Colors.white,
                        fontSize: constr.maxWidth * .035,
                      ),
                    ),
                    scaffoldBackgroundColor: Colors.black,
                    backgroundColor: Colors.black,
                    bottomNavigationBarTheme:
                        const BottomNavigationBarThemeData(
                      backgroundColor: Colors.black,
                      selectedItemColor: Colors.deepOrange,
                      unselectedIconTheme: IconThemeData(
                        color: Colors.white,
                      ),
                      elevation: 0,
                      selectedIconTheme:
                          IconThemeData(color: Colors.deepOrange),
                    ),
                    appBarTheme: AppBarTheme(
                        iconTheme: IconThemeData(
                          color: Colors.white,
                          size: constr.maxWidth * 0.08,
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: constr.maxWidth * 0.06,
                        ),
                        backgroundColor: Colors.black,
                        elevation: 0,
                        // status bar and ststus bar icon theme
                        systemOverlayStyle: const SystemUiOverlayStyle(
                          statusBarColor: Colors.black,
                          statusBarIconBrightness: Brightness.light,
                        )),
                    primarySwatch: Colors.deepOrange,
                  ),
                  home: const Directionality(
                    textDirection: TextDirection.rtl,
                    child: MyHomePage(),
                  ),
                );
              },
            );
          }),
    );
  }
}
