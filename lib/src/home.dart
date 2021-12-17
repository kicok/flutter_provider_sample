import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/bottom_navigation_provider.dart';
import 'ui/count_home_widget.dart';
import 'ui/movie_list_widget.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentIndex) {
      case 0:
        print(_bottomNavigationProvider.currentIndex);
        return CountHomeWidget();
      case 1:
        print(_bottomNavigationProvider.currentIndex);
        return MovieListWidget();
    }

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

    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}
