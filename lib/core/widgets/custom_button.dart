import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget title;
  final void Function()? onPressed;
  final Color color;
  const CustomButton({
    super.key, required this.title, required this.onPressed, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      minWidth: double.infinity,
      height: 54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),

      child: title
      // Text(title , style:TextStyles.bold16.copyWith(color: Colors.white),),

    );
  }
}
