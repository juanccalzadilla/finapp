
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:base_app/config/env/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Iconsax.home_14,
        Iconsax.document,
        Iconsax.heart_tick,
        Iconsax.user,
      ],
      gapLocation: GapLocation.center,
      activeIndex: 0,
      onTap: (index) => print("current index is $index"),
      activeColor: Enviroment().getColor,
      inactiveColor: Colors.grey,
      notchSmoothness: NotchSmoothness.defaultEdge,
    );
  }
}