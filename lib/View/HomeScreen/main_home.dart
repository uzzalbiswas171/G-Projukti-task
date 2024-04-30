import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gprojukti/CustomWidget/CalosolSelalider/carosal_silaider.dart';
import 'package:gprojukti/CustomWidget/CustomNetworkImaget/custom_network_image.dart';
import 'package:gprojukti/CustomWidget/CustomText/custom_text.dart';
import 'package:gprojukti/CustomWidget/SelectionOptions/selection_option.dart';
import 'package:gprojukti/Statemanagement/product_provider.dart';
import 'package:gprojukti/View/CategoryScreen/all_category.dart';
import 'package:gprojukti/constant.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/SmallproductGridview/small_product_grid_view.dart';
import '../Product/product.dart';
import '../Product/single_products_details.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List carousal_list = [
    "asset/banar1.jpg",
    "asset/banar2.jpg",
  ];

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false)
        .getcategoryProviderFunction("baseurl", context);
    Provider.of<ProductProvider>(context, listen: false)
        .getGroupWiseCategoryProviderFunction("vr-gaming", context);
    // TODO: implement initState
    super.initState();
  }
int valu=0;
  List<dynamic> falselist=[];
  @override
  Widget build(BuildContext context) {
    final getDynamiccategoryData =
        Provider.of<ProductProvider>(context).getDynamiccategoryData;
    var  subCategory;
     final getGroupWiseCategorylist =
        Provider.of<ProductProvider>(context).getGroupWiseCategorylist;
     print("ccccccccccccccc ${getDynamiccategoryData}");
    subCategory="${getDynamiccategoryData}"=="[]"?falselist: getDynamiccategoryData[valu]["categories"];

print("AAAAAAAAAAAAAAAAAAAAAAAAAA ======== ${subCategory}");
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(children: [
                CalosolSelalider(
                  custom_height: 120,
                  carousal_list: carousal_list,
                ),
                const SizedBox(height: 15),

                ///View All Section
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AllCategoryScreen(

                        getDynamiccategoryData: getDynamiccategoryData,
                        allcategory: subCategory),));
                  },
                  child: SelectionOptionsScreen(
                    leftText: "Category",
                    rite_text: "View all",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: "$subCategory" == "null"
                      ? Center(child: CircularProgressIndicator())
                      :

                  Container(
                    height: 280,
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
                      itemCount: subCategory.length>9?8: subCategory.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Provider.of<ProductProvider>(context,listen: false).getCategorywiseproductProviderFunction("${subCategory[index]["slug"]}", context);
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
                                                image:"${subCategory[index]["logo"]}",
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
                                          child: CustomText(text: "${subCategory[index]["name"]}", fontSize: 12 , fontWeight: FontWeight.w600,maxLines: 1),
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

                ),


                Container(
                  child: Column(
                    children: [
                      ///View All Section
                      SelectionOptionsScreen(
                        leftText: "Search by Group Name",
                        rite_text: " ",
                      ),
                      "${getDynamiccategoryData}"=="null"?
                      Container():

                      Container(
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        height: 45,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(width: 1, color: Colors.red),
                        ),
                        child: DropdownButton(
                          enableFeedback: true,
                          autofocus: false,
                          isExpanded: true,
                          hint: InkWell(
                              onTap: () {}, child: Text('Select Category')),
                          // Not necessary for Option 1
                          value: groupid,
                          onChanged: (newValue) {
                            setState(() {
                              groupid = newValue.toString();
                              Provider.of<ProductProvider>(context, listen: false)
                                  .getGroupWiseCategoryProviderFunction("$groupid", context);

                            });
                          },
                          items: getDynamiccategoryData.map((location) {
                            return DropdownMenuItem(
                              child: Card(
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${location["name"]}"),
                                  )),
                              value: location["slug"],
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: "$getGroupWiseCategorylist" == "null"
                              ? Center(child: CircularProgressIndicator())
                              :

                           SmallProductGrigview(
                          img_height: 240,
                          crossAxisCount: 2, mainAxisExtent: 240, itemCount: getGroupWiseCategorylist.length,productlist:getGroupWiseCategorylist),


        )
                    ],
                  ),
                ),
              ]),
            )));
  }

  String? groupid;
  String? subgroupid;
  List? groupidlist = [
    "A",
    "b",
    "c",
  ];
}
