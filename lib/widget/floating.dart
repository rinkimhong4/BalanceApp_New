import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final Color? primaryColor;

  const FloatingActionButtonWidget({
    super.key,
    this.primaryColor = const Color(0xFF3629B7),
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () {},
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
