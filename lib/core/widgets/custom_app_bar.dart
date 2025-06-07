import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool searchIconVisible;
  const CustomAppBar({
    super.key, required this.searchIconVisible,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image(image: AssetImage('assets/quickmart (1).png')),
      leadingWidth: 104,
      actions: [
        Visibility(
          visible: searchIconVisible,
          child: Image.asset('assets/search-normal.png'),
        ),
      ],
    );
  }
}
