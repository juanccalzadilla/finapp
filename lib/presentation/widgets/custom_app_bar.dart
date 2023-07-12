import 'package:base_app/config/env/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.notification),
          iconSize: 25.0,
          color: Colors.white,
        ),
      ],
      backgroundColor: Enviroment().getColor,
      leading: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: CircleAvatar(
            backgroundImage: NetworkImage(
          'https://picsum.photos/200/300',
        )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bienvenido',
              style: textTheme.bodySmall!.copyWith(color: Colors.white38)),
          Text('Juan Calzadilla',
              style: textTheme.titleMedium!.copyWith(
                  color: Colors.white70, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
