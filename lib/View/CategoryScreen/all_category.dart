import 'package:flutter/material.dart';
import 'package:gprojukti/CustomWidget/CustomAppbar/custom_appbar.dart';
import 'package:gprojukti/CustomWidget/CustomAppbar/custom_individual_appbar.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomNetworkImaget/custom_network_image.dart';
import '../../CustomWidget/CustomText/custom_text.dart';
import '../../CustomWidget/SelectionOptions/selection_option.dart';
import '../../Statemanagement/product_provider.dart';
import '../Product/product.dart';

class AllCategoryScreen extends StatefulWidget {
    AllCategoryScreen({Key? key, required this.allcategory,required this.getDynamiccategoryData}) : super(key: key);
  List allcategory=[];
  List getDynamiccategoryData=[];
  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: CustomIndividualAppbar(onPress: () {
            Navigator.pop(context);
          }, title: "All Category")
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(left: 10,right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 20,),
              // ///View All Section
              // SelectionOptionsScreen(
              //   leftText: "Search Category by Group Name",
              //   rite_text: " ",
              // ),
              //
              //
              // Container(
              //   margin: EdgeInsets.only(
              //       left: 15, right: 15, top: 10, ),
              //   height: 45,
              //   width: double.infinity,
              //   padding: EdgeInsets.only(left: 15, right: 15),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(11),
              //     border: Border.all(width: 1, color: Colors.red),
              //   ),
              //   child: DropdownButton(
              //     enableFeedback: true,
              //     autofocus: false,
              //     isExpanded: true,
              //     hint: InkWell(
              //         onTap: () {}, child: Text('Select Category')),
              //     // Not necessary for Option 1
              //     value: groupid,
              //     onChanged: (newValue) {
              //       setState(() {
              //         groupid = newValue.toString();
              //         // Provider.of<ProductProvider>(context, listen: false)
              //         //     .getGroupWiseCategoryProviderFunction("$groupid", context);
              //
              //       });
              //     },
              //     items: widget.getDynamiccategoryData.map((location) {
              //       return DropdownMenuItem(
              //         child: Card(
              //             child: Container(
              //               width: double.infinity,
              //               padding: const EdgeInsets.all(8.0),
              //               child: Text("${location["name"]}"),
              //             )),
              //         value: location["slug"],
              //       );
              //     }).toList(),
              //   ),
              // ),
              // SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(
                    top:10
                ),
                width: double.infinity,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      mainAxisExtent: 120
                  ),
                  itemCount: widget.allcategory.length     ,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<ProductProvider>(context,listen: false).getCategorywiseproductProviderFunction("${widget.allcategory[index]["slug"]}", context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(

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
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(50),
                                          ),
                                          // child:Image.network("${productlist[index]["images"]}",fit: BoxFit.fill,height:img_height))
                                          child:CustomNetworkImage(
                                            height: 80,
                                            image:"${widget.allcategory[index]["logo"]}",
                                          ))
                                      ,
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
                                      child: CustomText(text: "${widget.allcategory[index]["name"]}", fontSize: 12 , fontWeight: FontWeight.w600,maxLines: 1),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  String? groupid;
  String? subgroupid;
}
