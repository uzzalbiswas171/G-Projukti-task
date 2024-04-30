
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gprojukti/CustomWidget/CalosolSelalider/carosal_silaider.dart';
import 'package:gprojukti/CustomWidget/CustomText/custom_text.dart';
import 'package:gprojukti/CustomWidget/SelectionOptions/selection_option.dart';
import 'package:gprojukti/Statemanagement/product_provider.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/SmallproductGridview/small_product_grid_view.dart';


class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List carousal_list=[
    "asset/banar1.jpg",
    "asset/banar2.jpg",
  ];
  @override
  void initState() {
    Provider.of<ProductProvider>(context,listen: false).getcategoryProviderFunction("baseurl", context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   final getDynamiccategoryData=  Provider.of<ProductProvider>(context).getDynamiccategoryData;
    return  Scaffold(
       body: Container(
         height: double.infinity,
         width: double.infinity,
         child: SingleChildScrollView(
           child: Column(
             children: [
               CalosolSelalider(custom_height: 120,
                 carousal_list: carousal_list,
               ),
               const SizedBox(height: 15),
               ///View All Section
               SelectionOptionsScreen(
                 leftText: "Group",
                 rite_text: "View all",
               ),
               const SizedBox(height: 15),

               Padding(
                 padding: const EdgeInsets.only(left: 10.0,right: 10),
                 child:"$getDynamiccategoryData"=="null"?Center(child: CircularProgressIndicator()): SmallProductGrigview(
                     img_height: 240,
                     crossAxisCount: 2, mainAxisExtent: 240,
                     itemCount: getDynamiccategoryData.length,
                   productlist: getDynamiccategoryData,
                 ),
               )
             ],
           ),
         ),
       ),
    );
  }
  String? gropname;
}
