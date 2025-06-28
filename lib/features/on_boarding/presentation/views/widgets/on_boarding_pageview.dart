import 'package:flutter/material.dart';
import 'package:quick_mart/features/on_boarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController controller;

  const OnBoardingPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (index) {
        controller.page!.round();
      },
      controller: controller,
      reverse: false,
      children: [
        PageViewItem(
          image: "assets/01 Online Shopping 2.png",
          title: 'Explore a wide range of \nproducts',
          subTitle:
              'Explore a wide range of products at your fingertips. QuickMart offers an extensive collection to suit your needs.',
          isVisible: true,
        ),
        PageViewItem(
          image: "assets/01 Online Shopping 5.png",
          title: 'Unlock exclusive offers \nand discounts',
          subTitle:
              'Get access to limited-time deals and special promotions available only to our valued customers.',
          isVisible: false,
        ),
        // PageViewItem(
        //   image: "assets/01 Online Shopping 5.png",
        //   title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   textDirection: TextDirection.rtl,
        //   children: [
        //     Text('ابحث وتسوق',style: TextStyles.bold23),
        //   ],
        // ), subTitle: 'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
        //   isVisible: false,
        // ),
      ],
    );
  }
}
