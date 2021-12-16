import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'ui/count_home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider _countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('provider Sample'),
      ),
      body: const CountHomeWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => _countProvider.add(),
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => _countProvider.remove(),
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
