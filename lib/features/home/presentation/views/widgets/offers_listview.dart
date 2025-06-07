import 'package:flutter/material.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage('assets/Rectangle 6.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },itemCount: 3,),
    );
  }
}
