import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showAnimatedSnackbar({
  required BuildContext context,
  required String message,
  required AnimatedSnackBarType type,
}) {
  AnimatedSnackBar.material(
    message,
    type: type,
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    duration: const Duration(seconds: 1),
  ).show(context);
}

