import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final double size;
  const FavoriteButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          Icons.favorite_border_outlined,
          size: size,
          color: Colors.black,
        ),
      ),
    );
  }
}
