import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/home_bloc/home_status.dart';
import 'package:news_app/model/constants/constants.dart';
import 'package:news_app/model/shared_pref_helper/shared_pref_helper.dart';
import 'package:news_app/view/buisness/buisness_screen.dart';
import 'package:news_app/view/science/science_screen.dart';
import 'package:news_app/view/search/search_screen.dart';

import 'package:news_app/view/sports/sports_screen.dart';

class HomeCubit extends Cubit<HomeStatus> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> pages = const [
    BuisnessScreen(),
    ScienceScreen(),
    SportsScreen(),
    SearchScreen(),
  ];

  List<String>? themeList = [consystemTheme, condarkTheme, conlightTheme];
  String? themeValue = consystemTheme;
  ThemeMode? themeMode;
  bool? isDark;
  List<String> tittles = const ['Buisness', 'Science', 'Sports', 'Search'];

  void changeIndex(int? index) {
    currentIndex = index!;
    emit(HomeNavigationBarStatus());
  }

  Widget changeTheme(BuildContext context) {
    return PopupMenuButton<String?>(
      itemBuilder: (context) {
        return <PopupMenuEntry<String?>>[
          PopupMenuItem(
            value: themeList![0],
            child: Text(themeList![0]),
          ),
          PopupMenuItem(
            value: themeList![1],
            child: Text(themeList![1]),
          ),
          PopupMenuItem(
            value: themeList![2],
            child: Text(themeList![2]),
          ),
        ];
      },
      onSelected: (value) {
        themeValue = value;
        SharedHelper.addData(key: conthemeKey, value: themeValue);
        emit(HomeThemeChangeModeStatus());
      },
      icon: const Icon(Icons.dark_mode_outlined),
    );
  }

  ThemeMode choseTheme() {
    final String? themeData = SharedHelper.getData(key: conthemeKey);
    if (themeData != null) {
      if (themeData.trim() == conlightTheme.trim()) {
        themeMode = ThemeMode.light;
      } else if (themeData.trim() == condarkTheme) {
        themeMode = ThemeMode.dark;
      } else if (themeData.trim() == consystemTheme) {
        themeMode = ThemeMode.system;
      }
    } else {
      themeMode = ThemeMode.light;
    }
    emit(HomeThemeChangeModeStatus());
    return themeMode!;
  }
}
