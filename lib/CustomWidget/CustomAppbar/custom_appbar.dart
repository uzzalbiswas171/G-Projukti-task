 import 'package:flutter/material.dart';
import 'package:gprojukti/CustomWidget/CustomTExtFormField/custom_text_formfield.dart';
import 'package:gprojukti/Statemanagement/add_to_card_proviser.dart';

import 'package:gprojukti/constant.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget {
   CustomAppbar({super.key , this.onTap});
  final GestureTapCallback? onTap;
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addToCart = Provider.of<AddToCartProvider>(context);
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: logocolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
        )
      ),
      child: AppBar(
        backgroundColor: logocolor,
        leading: InkWell(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.only(left: 15,bottom: 8,top: 8),
            height: 10,
            width: 10,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             image: DecorationImage(image: AssetImage("asset/gprojukti.png"))
           ),
          ),
        ),

        centerTitle: true,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(bottom: 5,),
          child: CustomTextFormFieldd(
            onChanged:(value) {

            },
            keyboardType: TextInputType.text,
              maxline: 1, height: 35,
              hintext: "Search product",
              controller: controller,
              obscureText: false,
              suffix: IconButton(onPressed: () {
              }, icon: Icon(Icons.search),),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {     },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,bottom: 8.0,right: 15.0,left: 20),
                  child: Icon(Icons.shopping_cart,color: Colors.white,size: 25,),
                ),

                Consumer<AddToCartProvider>(
                  builder: (context, value, child) {
                   return Positioned(
                      right: 6,
                      top: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 7,
                        child: Text("${value.cart.length}",style: TextStyle(fontSize: 10,color: Colors.white),
                        ),
                      ),
                    );
                  },

                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
                onTap: () {

                },
                child: Icon(Icons.more_vert,color: Colors.white,size: 25,)),
          ),
        ],
      ),
    );
  }

}
