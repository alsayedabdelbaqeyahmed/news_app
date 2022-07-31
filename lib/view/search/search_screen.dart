// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/search_bloc/search_cubit.dart';
import 'package:news_app/controller/search_bloc/search_status.dart';
import 'package:news_app/model/constants/news.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStatus>(
      listener: (context, state) {},
      builder: (ctx, state) {
        final cubit = SearchCubit.get(ctx);
        return LayoutBuilder(builder: (context, constr) {
          return Form(
            key: _key,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                end: constr.maxWidth * 0.05,
                start: constr.maxWidth * 0.05,
                top: constr.maxHeight * 0.02,
                bottom: constr.maxHeight * 0.02,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      //labelText: 'search',
                      label: IconButton(
                        icon: Icon((Icons.search)),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                          }
                        },
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty || value.trim() == null) {
                        return 'please enter a valid value';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      print(value);
                      cubit.getSearchNews(value);
                    },
                    onSaved: (value) {
                      cubit.getSearchNews(value);
                    },
                  ),
                  Expanded(
                    child: News(
                      index: cubit.searchNews!.length,
                      newsData: cubit.searchNews,
                      constrain: constr,
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
