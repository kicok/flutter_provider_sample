import 'package:flutter/material.dart';
import 'package:flutter_provider_sample/src/provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'provider/bottom_navigation_provider.dart';
import 'ui/count_home_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  late final CountProvider _countProvider;
  late final BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movie'),
          ],
          currentIndex: _bottomNavigationProvider.currentIndex,
          selectedItemColor: Colors.red,
          onTap: (index) {
            _bottomNavigationProvider.updateCurrentPage(index);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Build home');
    _countProvider = Provider.of<CountProvider>(context, listen: false);
    _bottomNavigationProvider =
        Provider.of<BottomNavigationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('provider Sample'),
      ),
      body: const CountHomeWidget(), //_navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
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
