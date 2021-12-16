import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  const CountHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Center(
      child: Text(
        Provider.of<CountProvider>(context).count.toString(),
        style: TextStyle(fontSize: 80),
      ),
    );
  }
}
