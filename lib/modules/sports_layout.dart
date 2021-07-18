import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/news_cubit.dart';
import 'package:news_app/shared/components/components.dart';

class SportsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // ignore: todo
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).sports;

        return articleBuilder(list, context);
      },
    );
  }
}
