
import 'package:flutter/material.dart';
import 'package:gprojukti/constant.dart';


class CustomIndividualAppbar extends StatelessWidget {
   CustomIndividualAppbar({super.key,required this.onPress,required this.title});
  final VoidCallback onPress;
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading:Container(
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
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {    },
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child:  Icon(
                  Icons.shopping_cart,
                  color: Colors.black87,
                  size: 22,
                )

            ),
          ),
        ),
      ],
      backgroundColor: defaultBackgroundColor,
    );
  }
}
