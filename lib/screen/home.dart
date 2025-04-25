import 'package:flutter/material.dart';
import 'package:mybalance/pages/balance.dart';
import 'package:mybalance/pages/task.dart';
import 'package:mybalance/pages/timer.dart';
import 'package:mybalance/widget/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final _listPages = [BalanceScreen(), TaskScreen(), TimerScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPages[_selectedPage],
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: _selectedPage,
        onItemTapped: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }
}
