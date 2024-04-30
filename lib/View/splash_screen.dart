import 'package:flutter/material.dart';


import 'HomeScreen/home_screen.dart';
 

class SplashScrreen extends StatefulWidget {
  const SplashScrreen({Key? key}) : super(key: key);

  @override
  State<SplashScrreen> createState() => _SplashScrreenState();
}

class _SplashScrreenState extends State<SplashScrreen> {
  @override
  void initState() {
     Future.delayed(Duration(seconds: 2),() {
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
     },);
    // TODO: implement initState
    super.initState();
  }
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
      ),),
             SizedBox(height: 20,),
             Image.asset(
               "asset/loading.gif",
               height: 80,
               width: 80,
             )
           ],
        ),
      ),
    );
  }
}
