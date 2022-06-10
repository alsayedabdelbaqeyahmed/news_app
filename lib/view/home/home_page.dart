import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/controller/home_bloc/home_bloc.dart';
import 'package:news_app/controller/home_bloc/home_status.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStatus>(
      builder: (BuildContext ctx, state) {
        final cubit = HomeCubit.get(ctx);
        return LayoutBuilder(builder: (context, size) {
          return Scaffold(
              appBar: AppBar(
                title: Text(cubit.tittles[cubit.currentIndex]),
                actions: [
                  IconButton(
                    padding:
                        EdgeInsetsDirectional.only(end: size.maxWidth * 0.04),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  )
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Buisness',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.science),
                    label: 'Science',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: 'Sports',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
              body: cubit.pages[cubit.currentIndex]);
        });
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
