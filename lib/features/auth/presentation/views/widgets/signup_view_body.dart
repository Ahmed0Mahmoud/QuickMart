import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart/core/widgets/show_dialog.dart';
import 'package:quick_mart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:quick_mart/features/auth/presentation/views/login_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../home/presentation/views/main_view.dart';
import 'custom_input_field.dart';
class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is SignupSuccess || state is GoogleLoginSuccess){
      showAnimatedSnackbar(context: context, message: 'success', type: AnimatedSnackBarType.success);
      Navigator.pushNamedAndRemoveUntil(context, MainView.routeName, (route) => false);
    }

    else if(state is SignupFailure){
      showAnimatedSnackbar(context: context, message: state.errMessage, type: AnimatedSnackBarType.error);
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
              CustomInputField(labelText: 'Full Name', hintText: 'ahmed mahmoud',controller: _nameController,),
              const SizedBox(height: 16,),
              CustomInputField(labelText: 'Email', hintText: 'ahmed@gmail.com',controller: _emailController,),
              const SizedBox(height: 16,),
              CustomInputField(labelText: 'Password', hintText: 'Enter your password',suffixIcon: true,controller: _passwordController,obscureText: true,),
              SizedBox(height: 28,),
              CustomButton(title: state is SignupLoading ? CircularProgressIndicator() : Text("Create Account",style:TextStyles.bold16.copyWith(color: Colors.white),),
                  onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                    await context.read<AuthCubit>().signup(name: _nameController.text, email: _emailController.text, password: _passwordController.text);
                    if (!mounted) return;
                  }
                  }, color: AppColors.cyan),
              SizedBox(height: 20,),
              CustomButton(
                  title:state is GoogleLoginLoading ? CircularProgressIndicator() : Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Signup with Google',style:TextStyles.bold16.copyWith(color: Colors.white)),
                      Image.asset('assets/google.png'),
                    ],),
                  onPressed: ()async{
                    await context.read<AuthCubit>().googleSignIn();
                    if (!mounted) return;
                  },
                  color: AppColors.grey50),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
