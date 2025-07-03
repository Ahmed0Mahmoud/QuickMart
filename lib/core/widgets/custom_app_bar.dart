import 'package:flutter/material.dart';
import 'package:quick_mart/features/home/presentation/views/widgets/search_input_field.dart';

class CustomAppBar extends StatelessWidget {
  final bool searchIconVisible ;
  final String? hintText;
  final bool? isDense;
  final TextEditingController? controller;
  final void Function()? onPressed;

  const CustomAppBar({
    super.key,
    required this.searchIconVisible,
    this.hintText,
    this.isDense,
    this.controller,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image(image: AssetImage('assets/quickmart (1).png')),
      leadingWidth: 104,
      actions: [
        if (searchIconVisible == true)
          SearchInputField(
            hintText: hintText!,
            isDense: isDense,
            controller: controller!,
            onPressed: onPressed ?? () {},
          ),
      ],
    );
  }
}
