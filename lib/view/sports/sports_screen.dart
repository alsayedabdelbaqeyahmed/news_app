import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/sports_bloc.dart/sport_cubit.dart';
import 'package:news_app/controller/sports_bloc.dart/sport_status.dart';
import 'package:news_app/model/constants/news.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SportCubit, SportStatus>(
        builder: (ctx, state) {
          final sportNews = SportCubit.get(ctx).sportNews;
          return sportNews!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : News(
                  index: sportNews.length,
                  newsData: sportNews,
                );
        },
        listener: (context, state) {});
  }
}
