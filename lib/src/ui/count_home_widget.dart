import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/components/view_count.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);

  late final CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    print('Build called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Provider'),
      ),
      body: const ViewCountWidget(),
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
