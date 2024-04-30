
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gprojukti/CustomWidget/CustomAppbar/custom_appbar.dart';
import 'package:gprojukti/View/HomeScreen/main_home.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomText/custom_text.dart';
import '../../constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:1);

  /// Controller to handle bottom nav bar and also handles initial page
  var _controller = NotchBottomBarController(index: 1);

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
@override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [


    Container(),
    MainHomeScreen(),
    Container(),



  ];
final _scaffoldkey=GlobalKey<ScaffoldState>();

int Select_index=0;
  @override
  Widget build(BuildContext context) {

     print("AAAAAAAAAAAATTTTTTTTTT ${GetStorage().read("Api_token")}");
     print("AAAAAAAAAAAATTTTTTTTTT ${GetStorage().read("Api_token")}");

    return WillPopScope(
      onWillPop: () { return Future(() => false); },
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(70), child: CustomAppbar()),
        key: _scaffoldkey,
        drawer: Drawer(
          backgroundColor:  Colors.white,

        ),

        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
          /// Provide NotchBottomBarController
          notchBottomBarController: _controller,
       //   color: redColor,
          color: logocolor,
          showLabel: false,
          shadowElevation:9,
          kBottomRadius: 28.0,
          notchColor: logocolor,
          /// restart app if you change removeMargins
          removeMargins: false,
          bottomBarWidth: 500,
          showShadow: false,
          durationInMilliSeconds: 300,
          elevation: 1,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 25,
              ),
              activeItem: Icon(
                Icons.shopping_cart,
                color: Cwhite,
                size: 25,
              ),
              itemLabel: 'Page 3',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: Colors.black,
                size: 25,
              ),
              activeItem: Icon(
                Icons.home,
                color: Cwhite,
                size: 25,
              ),
              itemLabel: 'Page 1',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.black,
                size: 25,
              ),
              activeItem: Icon(
                Icons.person,
                color: Cwhite,
                size: 25,
              ),
              itemLabel: 'Page 5',
            ),
          
          ],
          onTap: (index) {
            if(index==0 || index==1){

              if(index==0){

              }
            }else{
              _pageController.jumpToPage(1);
            }
          },
          kIconSize: 24.0,
        )
            : null,
      ),
    );
  }
}