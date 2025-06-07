import 'package:flutter/material.dart';
import 'package:quick_mart/features/wishlist/presentation/views/widgets/wishlist_view_body.dart';
class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  static const routeName = 'wishlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WishlistViewBody(),

    );
  }
}
