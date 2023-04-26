import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget  {
  @override
  Size get preferredSize => const Size.fromHeight(55);
  
  const AppBarWidget({
    Key? key, 
    required this.title
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, 
      title: Text(title),
    );
  }
}
