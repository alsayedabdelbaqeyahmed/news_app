// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/controller/science_bloc.dart/science_status.dart';
import 'package:news_app/model/dio_helper/dio_helper.dart';

class ScienceCubit extends Cubit<ScienceStatus> {
  ScienceCubit() : super(ScienceInitialStatus());

  static ScienceCubit get(context) => BlocProvider.of(context);

  List<dynamic>? scienceNews = [];

  void getScienceNews() async {
    DioHelper.getData(path: 'v2/top-headlines', map: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'c96e84b2641c4420a8735119e9d9709d'
    }).then((value) {
      // print(value);
      scienceNews = value.data['articles'];

      emit(ScienceGetSucessStatus());
    }).catchError((error) {
      print(error.toString());
      emit(
        ScienceErrorGetStatus(
          error.toString(),
        ),
      );
    });
  }
}
