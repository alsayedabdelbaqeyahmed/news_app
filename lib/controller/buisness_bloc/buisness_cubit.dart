// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/buisness_bloc/buisness_status.dart';
import 'package:news_app/model/constants/constants.dart';
import 'package:news_app/model/dio_helper/dio_helper.dart';

class BuisnessCubit extends Cubit<BuisnessStatus> {
  BuisnessCubit() : super(BuisnessInitialStatus());

  static BuisnessCubit get(context) => BlocProvider.of(context);
  List<dynamic>? buisnessNews = [];

  void getBuisnessNews() {
    DioHelper.getData(path: 'v2/top-headlines', map: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'c96e84b2641c4420a8735119e9d9709d'
    }).then((value) {
      // print(value);
      buisnessNews = value.data['articles'];
      //print(buisnessNews![0][contitle]);
      emit(GetBuisnessScucessStatus());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetBuisnessErrorState(error.toString()));
      },
    );
  }
}
