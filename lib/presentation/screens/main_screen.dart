import 'package:base_app/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: ShapeBorder.lerp(
          const CircleBorder(),
          const StadiumBorder(),
          1,
        ),
        onPressed: () {},
        child: const Icon(Iconsax.scan),
      ),
      appBar: const CustomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomBar(),
      body: const IndexedStack(
        index: 0,
        children: [
          HomeView(),
        ],
      ),
    );
  }
}
