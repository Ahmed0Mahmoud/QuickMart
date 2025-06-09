import 'package:flutter/material.dart';
import 'package:quick_mart/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/presentation/views/login_view.dart';
class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
  listener: (context, state) {
    if(state is LogoutSuccess){
      Navigator.pushReplacementNamed(context, LoginView.routeName);
    }
  },
  builder: (context, state) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.3,
                    decoration: BoxDecoration(
                      color: AppColors.cyan,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                        ),
                        const SizedBox(width: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 2,
                          children: [
                            Text('Ahmed Mahmoud',style: TextStyles.semiBold16.copyWith(color: Colors.white)),
                            Text('ahmed2523@gmail.com',style: TextStyles.semiBold14.copyWith(color: Colors.white)),
                          ],
                        ),
                        const SizedBox(width: 80,),
                        IconButton(padding: EdgeInsets.zero,
                            splashColor: AppColors.grey150,
                            onPressed: () async {
                              await context.read<AuthCubit>().logout();

                            }, icon: Icon(Icons.logout,color: Colors.white,)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height*0.28,
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Personal Information',style: TextStyles.bold19,),
                            const SizedBox(height: 20,),
                            Expanded(child: Text('Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for... Read more',maxLines: 5,overflow: TextOverflow.ellipsis,style: TextStyles.regular14.copyWith(color: AppColors.grey150),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],


        ),
        if (state is LogoutLoading)
          Container(
            color: Colors.black45,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  },
);
  }
}
