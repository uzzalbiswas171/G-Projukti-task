
import 'package:flutter/material.dart';
import 'package:gprojukti/constant.dart';

class AddSection extends StatelessWidget {
  AddSection({super.key,required this.add_image,required this.height});
  String add_image;
  double height;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Container(
      width: w * 0.95,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: -30,
            child: Image.asset("asset/banar2.jpg")
          ),

        ],
      ),
    );
  }
}
