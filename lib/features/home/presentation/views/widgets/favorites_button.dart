import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final double size;
  final void Function()? onTap;
  final Color? color;

  const FavoriteButton({super.key, required this.size, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(Icons.favorite_rounded, size: size, color: color),
      ),
    );
  }
}
