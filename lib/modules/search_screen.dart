import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/cubit/news_cubit.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // ignore: todo
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: textField(
                    controller: searchController,
                    keyboard: TextInputType.text,
                    valide: (value) {
                      if (value!.isEmpty) {
                        return 'Search must not be Empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    preIcon: Icons.search,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: articleBuilder(list, context)),
            ],
          ),
        );
      },
    );
  }
}
