import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged onItemTapped;
  final double iconSize;
  final Color primaryColor;

  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.iconSize = 24.0,
    this.primaryColor = const Color(0xFF3629B7),
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            selectedIndex == 0 ? 'assets/bank-2.svg' : 'assets/bank-1.svg',
            colorFilter:
                selectedIndex == 0
                    ? ColorFilter.mode(primaryColor, BlendMode.srcIn)
                    : ColorFilter.mode(Colors.grey.shade700, BlendMode.srcIn),
            width: iconSize,
            height: iconSize,
          ),
          label: 'Balance',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            selectedIndex == 1 ? 'assets/task-2.svg' : 'assets/task-1.svg',
            colorFilter:
                selectedIndex == 1
                    ? ColorFilter.mode(primaryColor, BlendMode.srcIn)
                    : ColorFilter.mode(Colors.grey.shade700, BlendMode.srcIn),
            width: iconSize,
            height: iconSize,
          ),
          label: 'Task',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            selectedIndex == 2 ? 'assets/timer-2.svg' : 'assets/timer-1.svg',
            colorFilter:
                selectedIndex == 2
                    ? ColorFilter.mode(primaryColor, BlendMode.srcIn)
                    : ColorFilter.mode(Colors.grey.shade700, BlendMode.srcIn),
            width: iconSize,
            height: iconSize,
          ),
          label: 'Timer',
        ),
      ],
      elevation: 0,
      backgroundColor: primaryColor.withAlpha(15),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 13, fontFamily: 'Inter'),
      unselectedLabelStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'Inter',
        color: Colors.grey,
      ),
    );
  }
}
