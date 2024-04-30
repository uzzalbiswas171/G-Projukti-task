


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gprojukti/CustomWidget/CustomNetworkImaget/custom_network_image.dart';

class CalosolSelalider extends StatelessWidget {
    CalosolSelalider({super.key,required this.custom_height,required this.carousal_list});
  double custom_height;
  List carousal_list;

  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
        height:  custom_height,
        viewportFraction:1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: carousal_list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                    height: custom_height,
                 "${i}"),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
