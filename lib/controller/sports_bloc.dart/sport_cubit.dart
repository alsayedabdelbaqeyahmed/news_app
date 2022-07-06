import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/sports_bloc.dart/sport_status.dart';
import 'package:news_app/model/dio_helper/dio_helper.dart';

class SportCubit extends Cubit<SportStatus> {
  SportCubit() : super(SportInitialStatus());

  static SportCubit get(context) => BlocProvider.of(context);

  List<dynamic>? sportNews = [];

  void getSportNews() async {
    DioHelper.getData(path: 'v2/top-headlines', map: {
      'country': 'eg',
      'category': 'sport',
      'apiKey': 'c96e84b2641c4420a8735119e9d9709d'
    }).then((value) {
      sportNews = value.data['articles'];
      emit(SportGetSucessStatus());
    }).catchError((error) {
      print(error.toString());
      emit(SportGetErrorStatus(error.toString()));
    });
  }
}
