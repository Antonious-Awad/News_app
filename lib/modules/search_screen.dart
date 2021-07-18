import 'package:flutter/material.dart';
import 'package:news_app/shared/components/components.dart';

class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: textField(
              Controller: searchController,
              keyboard: TextInputType.name,
              valide: (value) {
                if (value!.isEmpty) {
                  return 'Search must not be Empty';
                }
                return null;
              },
              label: 'Search',
              preIcon: Icons.search)),
    );
  }
}
