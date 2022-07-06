import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/buisness_bloc/buisness_cubit.dart';
import 'package:news_app/controller/buisness_bloc/buisness_status.dart';
import 'package:news_app/model/constants/constants.dart';
import 'package:news_app/model/constants/news.dart';

class BuisnessScreen extends StatelessWidget {
  const BuisnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuisnessCubit, BuisnessStatus>(
      listener: (context, state) {},
      builder: (ctx, state) {
        final cubit = BuisnessCubit.get(ctx).buisnessNews;
        return cubit!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : News(
                index: cubit.length,
                newsData: cubit,
              );
      },
    );
  }
}
