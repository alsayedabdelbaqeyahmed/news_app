import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/home_bloc/home_status.dart';
import 'package:news_app/view/buisness/buisness_screen.dart';
import 'package:news_app/view/science/science_screen.dart';
import 'package:news_app/view/settings/settings.dart';
import 'package:news_app/view/sports/sports_screen.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> pages = const [
    BuisnessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SettingsScreen()
  ];
  List<String> tittles = const ['Buisness', 'Science', 'Sports', 'Settings'];

  void changeIndex(int? index) {
    currentIndex = index!;
    emit(HomeNavigationBarStatus());
  }
}
