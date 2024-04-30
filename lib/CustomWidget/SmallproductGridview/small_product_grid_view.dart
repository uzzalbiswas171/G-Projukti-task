import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gprojukti/CustomWidget/CustomText/custom_text.dart';
import 'package:provider/provider.dart';

import '../../Statemanagement/add_to_card_proviser.dart';
import '../../View/Product/single_products_details.dart';
import '../../constant.dart';

class SmallProductGrigview extends StatelessWidget {
   SmallProductGrigview({super.key,
     required this.crossAxisCount,
     required this.mainAxisExtent,
     required this.itemCount,
     required this.productlist,
     required this.img_height,

   });
  int crossAxisCount;
  int itemCount;
  double mainAxisExtent;
  double img_height;
  List productlist;
   int qty=1;
  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCartProvider>(context, listen: true);
    return Container(
      width: double.infinity,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:crossAxisCount,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: mainAxisExtent
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(
                  data:   {
                    "id": productlist[index]["id"],
                    "name": productlist[index]["name"],
                    "slug": productlist[index]["slug"],
                    "code": productlist[index]["code"],
                    "stock":productlist[index]["stock"],
                    "selling_price": productlist[index]["selling_price"],
                    "discount_price": productlist[index]["discount_price"],
                    "category_id": productlist[index]["category_id"],
                    "sub_category_id": productlist[index]["sub_category_id"],
                    "delivery_charge":productlist[index]["delivery_charge"],
                    "product_point": productlist[index]["product_point"],
                    "estimat_time": productlist[index]["estimat_time"],
                    "description": productlist[index]["description"],
                    "policy": productlist[index]["policy"],
                    "image": "${productlist[index]["image"]}",
                    "url": productlist[index]["url"],
                    "status": productlist[index]["status"],
                    "user_id":productlist[index]["user_id"],
                    "seller_price":productlist[index]["seller_price"],
                    "flash_sell":productlist[index]["flash_sell"],
                    "new_arival": productlist[index]["new_arival"],
                    "color": productlist[index]["color"]??"None,",
                    "images" : productlist[index]["images"],
                    "variant": productlist[index]["variant"]??"None"
                  }, hero: "hero"
              ),));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 6,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: defaultBackgroundColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            child:Image.asset("asset/banar2.jpg",fit: BoxFit.fill,height:img_height))
                        ,
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {

                                        Flushbar(
                                          backgroundColor:custombuttoncollor ,
                                          flushbarPosition: FlushbarPosition.TOP,
                                          title:  "Product Adding",
                                          message:  "Please wait ...",
                                          duration:  Duration(seconds: 3),
                                        )..show(context);
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 20,
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color:   Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4
                      ),
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 4),
                            child: CustomText(text: "${productlist[index]["name"]}", fontSize:crossAxisCount==3 || mainAxisExtent==180? 12 :14, fontWeight: FontWeight.w600,maxLines: 1),
                          ),
                          GetStorage().read("Api_token")==null ?Container(): Padding(
                            padding:
                            const EdgeInsets.only(left: 4),
                            child:GetStorage().read("status")=="Seller"?
                            CustomText(text: "Seller Price : ${productlist[index]["seller_price"]}", fontSize:crossAxisCount==3 || mainAxisExtent==180? 12 :14, fontWeight: FontWeight.w600,maxLines: 1)
                            :
                            CustomText(text: "Points : ${productlist[index]["product_point"]} p.", fontSize:crossAxisCount==3 || mainAxisExtent==180? 12 :14, fontWeight: FontWeight.w600,maxLines: 1),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 4),
                            child: Row(
                              children: [
                                CustomText(text: "Price :${productlist[index]["discount_price"]}",
                                  fontSize:crossAxisCount==3 || mainAxisExtent==180?9 :14, fontWeight: FontWeight.w600,maxLines: 1,),
                                Text(" ${productlist[index]["selling_price"]}", style: GoogleFonts.poppins(
                                    fontSize:crossAxisCount==3 || mainAxisExtent==180? 8 :13,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.red,
                                )
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
