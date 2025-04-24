import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final IconData? icon;
  final String? label;

  const TabItem({super.key, this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(icon, color: Colors.white, size: 18), Tab(text: label)],
    );
  }
}
