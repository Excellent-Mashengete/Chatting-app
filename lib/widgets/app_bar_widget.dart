import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  @override
  Size get preferredSize => const Size.fromHeight(55);

  const AppBarWidget({
    Key? key, 
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon; 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: (){ Navigator.pop(context); },
        icon: const Icon(Icons.arrow_back),
      ),
      title: Text(title),
    );
  }
}
