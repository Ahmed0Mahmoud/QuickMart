import 'package:flutter/material.dart';
import 'package:quick_mart/features/profile/presentation/views/widgets/profile_view_body.dart';
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : ProfileViewBody(),
    );
  }
}
