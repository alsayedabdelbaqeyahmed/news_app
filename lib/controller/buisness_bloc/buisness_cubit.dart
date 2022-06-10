import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/buisness_bloc/buisness_status.dart';

class BuisnessCubit extends Cubit<BuisnessStatus> {
  BuisnessCubit() : super(BuisnessInitialStatus());

  static BuisnessCubit get(context) => BlocProvider.of(context);
}
