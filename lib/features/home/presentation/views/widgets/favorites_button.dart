import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child:Icon(Icons.favorite_border_outlined,size: 18,color: Colors.black,),

      ),
    );
  }
}
