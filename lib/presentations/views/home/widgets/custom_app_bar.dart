import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback onTap;

  const CustomAppBar({super.key, required this.isDarkMode, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 1,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          'Where in the world?',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 4.0,right: 14),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  const Icon(Icons.dark_mode_outlined),
                  const SizedBox(width: 8),
                  Text(
                    isDarkMode? 'Light Mode' : 'Dark Mode',
                    style: Theme.of(context).appBarTheme.toolbarTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
