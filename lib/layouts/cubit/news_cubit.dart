import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/modules/business_layout.dart';
import 'package:news_app/modules/science_layout.dart';
import 'package:news_app/modules/settings_screen.dart';
import 'package:news_app/modules/sports_layout.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomNavItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  List<Widget> screens = [
    businessLayout(),
    sportsLayout(),
    scienceLayout(),
  ];

  void changeNavBar(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(NewsBottomNav());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  void getBusiness() {
    emit(NewsGetBusinessLoading());
    dioHelper.getData("v2/top-headlines", {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'b0e0dd81a02a4effaf57d863ae37d283'
    }).then((value) {
      business = value.data['articles'];
      // print(business[0]['title']);
      emit(NewsGetBusinessSuccess());
    }).catchError((error) {
      print("data retrieval error: ${error.toString()}");
      emit(NewsGetBusinessError(error.toString()));
    });
  }

  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoading());
      dioHelper.getData("v2/top-headlines", {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'b0e0dd81a02a4effaf57d863ae37d283'
      }).then((value) {
        sports = value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetSportsSuccess());
      }).catchError((error) {
        print("data retrieval error: ${error.toString()}");
        emit(NewsGetSportsError(error.toString()));
      });
    } else
      emit(NewsGetSportsSuccess());
  }

  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoading());
      dioHelper.getData("v2/top-headlines", {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'b0e0dd81a02a4effaf57d863ae37d283'
      }).then((value) {
        science = value.data['articles'];
        // print(business[0]['title']);
        emit(NewsGetScienceSuccess());
      }).catchError((error) {
        print("data retrieval error: ${error.toString()}");
        emit(NewsGetScienceError(error.toString()));
      });
    } else
      emit(NewsGetScienceSuccess());
  }

  bool isDark = false;
  void changeTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeTheme());
    } else {
      isDark = !isDark;
      cacheHelper
          .putDate('isDark', isDark)
          .then((value) => emit(NewsChangeTheme()));
    }
  }
}
