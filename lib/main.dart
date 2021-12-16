import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
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
      home: ChangeNotifierProvider(
        create: (context) => CountProvider(),
        child: const Home(),
      ),
    );
  }
}
