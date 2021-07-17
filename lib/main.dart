import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layouts/cubit/news_cubit.dart';
import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
                textDirection: TextDirection.rtl, child: news_layout()),
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  color: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  centerTitle: true),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 30,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black))
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  color: HexColor('333739'),
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  centerTitle: true),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('333739'),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 30,
                  unselectedItemColor: Colors.grey),
            ),
            themeMode: NewsCubit.get(context).appmode,
          );
        },
      ),
    );
  }
}
