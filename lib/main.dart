import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/bottom_navigation_provider.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:flutter_provider_sample/src/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import 'src/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider()),
          ChangeNotifierProvider<BottomNavigationProvider>(
              create: (_) => BottomNavigationProvider()),
          ChangeNotifierProvider<MovieProvider>(create: (_) => MovieProvider()),
        ],
        child: Home(),
      ),
    );
  }
}
