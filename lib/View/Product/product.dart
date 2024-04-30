import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import '../../CustomWidget/SmallproductGridview/small_product_grid_view.dart';
import '../../Statemanagement/product_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final getcategoryWiseCategorylist =
        Provider.of<ProductProvider>(context).getCategorywiseproductlist;

    return Scaffold(
       appBar: PreferredSize(
      preferredSize: const Size(double.infinity, 60),
        child: CustomIndividualAppbar(onPress: () {
          Navigator.pop(context);
        }, title: "All Products")
    ),
    body: Container(
    height: double.infinity,
    width: double.infinity,
    child: SingleChildScrollView(
      child:Column(
      children: [
    Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: "$getcategoryWiseCategorylist" == "null"
    ? Center(child: CircularProgressIndicator())
        :

    SmallProductGrigview(
    img_height: 240,
    crossAxisCount: 2, mainAxisExtent: 240, itemCount: getcategoryWiseCategorylist.length,productlist:getcategoryWiseCategorylist),


    )
      ],
      ),
    ),
    ),
    );
  }
}
