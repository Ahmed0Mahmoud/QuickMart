import 'package:flutter/material.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/presentation/views/signup_view.dart';
import 'package:quick_mart/features/auth/presentation/views/widgets/custom_input_field.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../home/presentation/views/main_view.dart';
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(searchIconVisible: false,),
          const SizedBox(height: 24,),
          Text('Login',style: TextStyles.bold24,),
          Row(
            children: [
              Text('Don’t have an account?',style: TextStyles.regular14.copyWith(color: AppColors.grey150),),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignupView.routeName);
                  },
                  child: Text('Signup',style: TextStyles.medium14.copyWith(color: AppColors.cyan),

                  ),
              ),
            ],
          ),
          const SizedBox(height: 32,),
          CustomInputField(labelText: 'Email', hintText: 'ahmed@gmail.com'),
          const SizedBox(height: 16,),
          CustomInputField(labelText: 'Password', hintText: 'Enter your password',suffixIcon: true,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
               onPressed: (){},
                  child: Text('Forgot password?',style: TextStyles.medium14.copyWith(color: AppColors.cyan),
                  ),
              ),
            ),
          ),
          CustomButton(title: Text("Login",style:TextStyles.bold16.copyWith(color: Colors.white),), onPressed: (){
            Navigator.pushNamed(context, MainView.routeName);
          }, color: AppColors.cyan),
          SizedBox(height: 20,),
          CustomButton(
              title: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login with Google',style:TextStyles.bold16.copyWith(color: Colors.white)),
                  Image.asset('assets/google.png'),
                   ],),
                onPressed: (){}, color: AppColors.grey50),
        ],
      ),
    );
  }
}

