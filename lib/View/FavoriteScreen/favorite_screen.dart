
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gprojukti/CustomWidget/CustomText/custom_text.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomButton/custom_button.dart';
import '../../Statemanagement/add_to_card_proviser.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  double h1TextSize = 11.0;
  double totalPrice = 0;
  double shippingFee = 60;
  double h2TextSize = 14.0;

  @override
  void initState() {     // TODO: implement initState
    super.initState();

  }

  int qtn = 0;

  @override
  Widget build(BuildContext context) {
    final addtocarprovider = Provider.of<AddToCartProvider>(context, listen: true);
    final addToCartProviderList =
        Provider.of<AddToCartProvider>(context, listen: true).cart;



    return Scaffold(

      body: WillPopScope(child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: addToCartProviderList.isEmpty
            ?   Center(
          child: Text(
            "No items available",
            style: GoogleFonts.poppins(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )
            : Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Cart Items"),
                TextButton(
                    onPressed: () {
                      // addtocarprovider.clearCart();
                      // Provider.of<AddtoCartProvider>(context,
                      //     listen: false)
                      //     .clear();
                      setState(() {
                        addtocarprovider.clearCart();
                      });
                    },
                    child: const Text(
                      "Remove All",
                      style: TextStyle(color: Colors.red),
                    ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Consumer<AddToCartProvider>(
                    builder: (context, value, child) {
                      print('xxxxxxxxxxxxxxxxxxxx ${value.cart[index].image}');
                      return Stack(
                        children: [
                          Card(
                            child: ListTile(
                              onTap: () {
                                //  Navigator.push(context, MaterialPageRoute(builder: (context) => One_Product_Details(slug: addToCartProviderList[index].slug!),));
                              },
                              leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Container(
                                    height: 50,
                                    width: 100,

                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(image: NetworkImage("${value.cart[index].image}"),fit: BoxFit.fill)
                                    ),
                                  )
                              ),
                              title: Text("${value.cart[index].productName}"),
                              subtitle: Text("${value.cart[index].mainPrice}"),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.add_circle),
                                      onPressed: () {
                                        value.updateProduct(
                                            value.cart[index],
                                            value.cart[index].quantity! +
                                                1);
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                    Text(
                                      "${value.cart[index].quantity}",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle),
                                      onPressed: () {
                                        print('fasfjkjaskf ${value.cart[index].quantity}');
                                        if(value.cart[index].quantity!>0){
                                          value.updateProduct(
                                            value.cart[index],
                                            value.cart[index].quantity! - 1,
                                          );
                                        }else{

                                        }
                                        // model.removeProduct(model.cart[index]);
                                      },
                                    ),
                                  ]),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 8,
                            child: GestureDetector(
                              onTap: () {
                                value.removeProduct(value.cart[index]);
                              },
                              child: const Icon(
                                Icons.close,
                                size: 20,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: addToCartProviderList.length,
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(children: [
                  Container(
                    child: Text(
                      "Total: ৳${Provider.of<AddToCartProvider>(context, listen: true)
                          .totalCartValue}",
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: CustomButton(onTap: () {
                        showDialog(context: context, builder: (context) => AlertDialog(title: CustomText(text: "Its will be after join", fontSize: 20, fontWeight: FontWeight.w600),),);
                    }, text: "Check Out", button_text_fontSize: 16, button_height: 40),
                  )
                ],)),
            SizedBox(height: 60,)

          ],
        ),
      ), onWillPop: onWillPop),
      // bottomSheet: addToCartProviderList.isEmpty
      //     ? const Center(
      //   child: Text(
      //     "No items available",
      //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //   ),
      // ):
      // Container(
      //   color: Colors.white,
      //   margin: EdgeInsets.all(15),
      //   child: CustomButton(onTap: () {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutScreen(),));
      //   }, text: "Check Out", button_text_fontSize: 16, button_height: 40),
      // )
    );
  }
  late DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Exit"),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }
  int count = 0;
}
