import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/science_bloc.dart/science_cubit.dart';
import 'package:news_app/controller/science_bloc.dart/science_status.dart';
import 'package:news_app/model/constants/news.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScienceCubit, ScienceStatus>(
      builder: (ctx, state) {
        final scienceCubit = ScienceCubit.get(ctx).scienceNews;
        return scienceCubit!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : News(
                index: scienceCubit.length,
                newsData: scienceCubit,
              );
      },
      listener: (context, state) {},
    );
  }
}
