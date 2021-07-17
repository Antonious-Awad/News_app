import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/news_cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class news_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "News",
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.get(context).changeTheme();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.BottomNavItems,
            onTap: (index) {
              cubit.changeNavBar(index);
            },
            currentIndex: cubit.currentIndex,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
