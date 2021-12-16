import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  const CountHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build called');
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child) {
          return Text(
            provider.count.toString(),
            style: const TextStyle(fontSize: 80),
          );
        },
      ),
    );
  }
}
