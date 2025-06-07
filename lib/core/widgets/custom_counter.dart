import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomCounter extends StatelessWidget {
  const CustomCounter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: AppColors.grey50),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){}, icon:Icon(Icons.add,size: 24,color: Colors.white,),
          ),
          Text('1',style: TextStyles.medium16.copyWith(color: Colors.white),),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: (){}, icon:Icon(Icons.remove,size: 24,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
