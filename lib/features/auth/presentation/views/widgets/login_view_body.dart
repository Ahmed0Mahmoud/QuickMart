import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/utils/app_colors.dart';
import 'package:quick_mart/core/utils/app_text_styles.dart';
import 'package:quick_mart/core/widgets/custom_button.dart';
import 'package:quick_mart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:quick_mart/features/auth/presentation/views/signup_view.dart';
import 'package:quick_mart/features/auth/presentation/views/widgets/custom_input_field.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/show_dialog.dart';
import '../../../../home/presentation/views/main_view.dart';
class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is LoginFailure){
      showAnimatedSnackbar(message: state.errMessage, type:AnimatedSnackBarType.error, context: context);
    }
    else if (state is LoginSuccess){
      showAnimatedSnackbar(message: 'Success', type:AnimatedSnackBarType.success, context: context);
      Navigator.pushNamedAndRemoveUntil(context, MainView.routeName, (route) => false);
    }
  },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              CustomInputField(labelText: 'Email', hintText: 'ahmed@gmail.com',controller: _emailController,),
              const SizedBox(height: 16,),
              CustomInputField(labelText: 'Password', hintText: 'Enter your password',suffixIcon: true,controller: _passwordController,),
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
              CustomButton(
                  title: state is LoginLoading ? CircularProgressIndicator() :Text("Login",style:TextStyles.bold16.copyWith(color: Colors.white),),
                  onPressed: ()async{
                        if(_formKey.currentState!.validate()){
                          await context.read<AuthCubit>().login(email: _emailController.text, password: _passwordController.text);
                        }
                        }, color: AppColors.cyan),
              const SizedBox(height: 20,),
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
        ),
      ),
    );
  },
);
  }
}

