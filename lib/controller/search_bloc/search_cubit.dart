// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/search_bloc/search_status.dart';
import 'package:news_app/model/dio_helper/dio_helper.dart';

class SearchCubit extends Cubit<SearchStatus> {
  SearchCubit() : super(InitSearchStatus());

  static SearchCubit get(contetx) => BlocProvider.of(contetx);
  List<dynamic>? searchNews = [];

  void getSearchNews(String? value) {
    DioHelper.getData(
      path: 'v2/everything',
      map: {
        'q': value,
        'apiKey': 'c96e84b2641c4420a8735119e9d9709d',
      },
    ).then((value) {
      // print(value);
      searchNews = value.data['articles'];
      //print(buisnessNews![0][contitle]);
      emit(GetSearchResultsSucessStatus());
    }).catchError(
      (error) {
        print(error.toString());
        emit(GetSearchResultsErrorStatus());
      },
    );
  }
}
