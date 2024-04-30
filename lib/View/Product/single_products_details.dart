import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gprojukti/CustomWidget/CustomNetworkImaget/custom_network_image.dart';
import 'package:gprojukti/CustomWidget/CustomText/custom_text.dart';
import 'package:gprojukti/View/HomeScreen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import '../../Model/add_to_cart.dart';
import '../../Statemanagement/add_to_card_proviser.dart';
import '../../constant.dart';
class DetailsPage extends StatefulWidget {
  final Map? data;
  final String? hero;
  const DetailsPage({super.key, required this.data, required this.hero});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int sizeSelected = 0;
  int sizeSelected2 = 0;
  bool like = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
print("dddddddddddddddddddddddddddddddd ===== >${widget.data}");
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final addToCart = Provider.of<AddToCartProvider>(context, listen: true);


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: CustomIndividualAppbar(onPress: () {
          Navigator.pop(context);
        }, title: "PRODUCT DETAILS")
      ),
      body:   Container(
    height: double.infinity,
    width: double.infinity,
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.hero!,
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [

                        Container(
                          height: 350,
                          color: defaultBackgroundColor,
                          width: w,
                          child: CustomNetworkImage(image: "${widget.data!["images"]}", height: 350),
                        ),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: CircleAvatar(
                          radius: 45,
                          backgroundColor:widget.data!["stock_available"]==true? Colors.greenAccent : Colors.red,
                              child: Text(widget.data!["stock_available"]==true?"In Stock" :"Out of Stock"),
                         ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            CustomText(text: "${widget.data!["name"]}", fontSize: 20, fontWeight: FontWeight.w700,maxLines: 2,),

            SizedBox(height: 10,),
            CustomText(text: "${widget.data!["slug"]}", fontSize: 18, fontWeight: FontWeight.w700,maxLines: 2,),
            SizedBox(height: 10,),
            Row(
              children: [
                Text(
                  "QUANTITY :",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(onPressed: () {
                  setState(() {
                    qty--;
                  });
                }, icon: Icon(Icons.remove_circle)),
                Text(
                  "$qty",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(onPressed: () {
                  setState(() {
                    qty++;
                  });
                }, icon: Icon(Icons.add_circle_rounded)),
              ],
            ),

            const SizedBox(height: 10),
            Text(
              "DESCRIPTION :",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              maxLines: 10,
              Bidi.stripHtmlIfNeeded("${widget.data!["meta"]["description"] ?? ""}"),
              style:  GoogleFonts.poppins(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 120,)
          ],
          ),
        ),
        Positioned(
          bottom: 15,
          child: Container(
            width: w * 0.95,
            height: 80,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(36),
              ),
            ),
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GetStorage().read("status")=="Seller" ?
                          "Seller Price" : "Price",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                           "${double.parse("${widget.data!["selling_price"]}")*qty} BDT",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${widget.data!["image"]}");
                    setState(() {
                      addToCart.addProduct(
                        AddToCartModel(
                          id: int.parse("${widget.data!["id"]}"),
                          productName: "${widget.data!["name"]}",
                          image: "${widget.data!["images"]}",
                          mainPrice:  double.parse("${widget.data!["selling_price"]}") ,
                          salePrice:  double.parse("${widget.data!["selling_price"]}") ,
                          purchaseRate: "${widget.data!["delivery_charge"]}",
                          cashBackAmount: "${widget.data!["estimat_time"]}",
                          cashBackPercent: "10%",
                          colorId: "${widget.data!["color"]}",
                          sizeId: "${widget.data!["image"]}",
                          quantity: qty,
                          slug: "${widget.data!["slug"]}",
                          description: "${widget.data!["description"]}",
                          entimate_time: "${widget.data!["estimat_time"]}",
                          flash_sell:"${widget.data!["flash_sell"]}" ,
                        ),
                      );
                      Flushbar(
                        backgroundColor:custombuttoncollor ,
                        flushbarPosition: FlushbarPosition.TOP,
                        title:  "Product Adding",
                        message:  "Please wait ...",
                        duration:  Duration(seconds: 3),
                      )..show(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    });
                  },
                  child: Container(
                    width: 160,
                    height: 65,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: customColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                    child: const Text(
                      "ADD TO CART",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    ),
      )
    );
  }
  int ? image_index;
  int qty=1;
}
