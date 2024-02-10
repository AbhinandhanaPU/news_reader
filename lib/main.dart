import 'package:flutter/material.dart';
import 'package:news_api/controller/mycontroller.dart';
import 'package:news_api/controller/searchController.dart';
import 'package:news_api/view/home_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySearchController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
