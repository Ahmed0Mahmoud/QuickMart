import 'package:flutter/material.dart';
import 'package:quick_mart/features/auth/presentation/views/login_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'custom_input_field.dart';
class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(searchIconVisible: false,),
          const SizedBox(height: 24,),
          Text('Signup',style: TextStyles.bold24,),
          Row(
            children: [
              Text('Already have an account?',style: TextStyles.regular14.copyWith(color: AppColors.grey150),),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginView.routeName);
                },
                child: Text('Login',style: TextStyles.medium14.copyWith(color: AppColors.cyan),

                ),
              ),
            ],
          ),
          const SizedBox(height: 32,),
          CustomInputField(labelText: 'Full Name', hintText: 'ahmed mahmoud'),
          const SizedBox(height: 16,),
          CustomInputField(labelText: 'Email', hintText: 'ahmed@gmail.com'),
          const SizedBox(height: 16,),
          CustomInputField(labelText: 'Password', hintText: 'Enter your password',suffixIcon: true,),
          SizedBox(height: 28,),
          CustomButton(title: Text("Create Account",style:TextStyles.bold16.copyWith(color: Colors.white),), onPressed: (){}, color: AppColors.cyan),
          SizedBox(height: 20,),
          CustomButton(
              title: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Signup with Google',style:TextStyles.bold16.copyWith(color: Colors.white)),
                  Image.asset('assets/google.png'),
                ],),
              onPressed: (){}, color: AppColors.grey50),
        ],
      ),
    );
  }
}
