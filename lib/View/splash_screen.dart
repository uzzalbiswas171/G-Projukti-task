import 'package:flutter/material.dart';
import 'package:gprojukti/CustomWidget/CustomText/custom_text.dart';

class SplashScrreen extends StatefulWidget {
  const SplashScrreen({Key? key}) : super(key: key);

  @override
  State<SplashScrreen> createState() => _SplashScrreenState();
}

class _SplashScrreenState extends State<SplashScrreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 150,width: 150,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage("asset/gprojukti.png"),fit: BoxFit.fill),
              color: Colors.red
            ),),
             Image.asset(
               "asset/gprojukti.png",
               height: 25,
               width: 25,
             )
           ],
        ),
      ),
    );
  }
}
