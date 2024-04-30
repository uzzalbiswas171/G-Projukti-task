
import 'package:flutter/material.dart';
import 'package:gprojukti/constant.dart';
import 'package:provider/provider.dart';

import '../../Statemanagement/add_to_card_proviser.dart';


class CustomIndividualAppbar extends StatelessWidget {
   CustomIndividualAppbar({super.key,required this.onPress,required this.title});
  final VoidCallback onPress;
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading:InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 26,
            ),
          ),
        ),
      ),
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () {     },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 15.0,left: 20),
                child: Icon(Icons.shopping_cart,color: Colors.black,size: 25,),
              ),

              Consumer<AddToCartProvider>(
                builder: (context, value, child) {
                  return Positioned(
                    right: 6,
                    top: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 7,
                      child: Text("${value.cart.length}",style: TextStyle(fontSize: 10,color: Colors.white),
                      ),
                    ),
                  );
                },

              ),
            ],
          ),
        ),
      ],
      backgroundColor: defaultBackgroundColor,
    );
  }
}
