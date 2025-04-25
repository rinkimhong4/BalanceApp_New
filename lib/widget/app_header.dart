import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceHeader extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final VoidCallback? onBellPressed;

  const BalanceHeader({
    super.key,
    required this.userName,
    this.onBellPressed,
    TabBar? bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Hi, $userName!',
        style: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color(0xFF3629B7),
      actions: [
        IconButton(
          onPressed: onBellPressed,
          icon: SvgPicture.asset('assets/Bell.svg', width: 24, height: 24),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
