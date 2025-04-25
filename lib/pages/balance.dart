import 'package:flutter/material.dart';
import 'package:mybalance/widget/app_header.dart';
import 'package:mybalance/widget/card_balance.dart';
import 'package:mybalance/widget/floating.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: BalanceHeader(userName: 'Kimhong'),
        body: CardBalanceWidget(),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}
