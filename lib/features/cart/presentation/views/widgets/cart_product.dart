import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_counter.dart';
import '../../../../../core/widgets/show_buttom_modal_sheet.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage('assets/Rectangle 9 (2).png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loop Silicone Strong Magnetic',
                    style: TextStyles.medium15.copyWith(color: Colors.white),
                  ),
                  Text(
                    '\$15.25',
                    style: TextStyles.semiBold14.copyWith(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCounter(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          showButtomModalSheet(context);
                        },
                        icon: Image.asset('assets/trash.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
