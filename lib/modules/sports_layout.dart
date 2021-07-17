import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/news_cubit.dart';
import 'package:news_app/shared/components/components.dart';

class sportsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => newsItem(list[index]),
              separatorBuilder: (context, index) => MyDivider(),
              itemCount: list.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
