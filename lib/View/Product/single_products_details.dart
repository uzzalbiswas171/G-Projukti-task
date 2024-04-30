import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../CustomWidget/CustomAppbar/custom_individual_appbar.dart';
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

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final addToCart = Provider.of<AddToCartProvider>(context, listen: true);

    b=  (widget.data!["color"].split(','));
    si=  (widget.data!["variant"].split(','));
    var colorlist = widget.data!["images"];

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
    child: Column(
    children: [
      Hero(
        tag: widget.hero!,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 350,
                color: defaultBackgroundColor,
                width: w,
                child: InteractiveViewer(
                  child:imagee==null?
                  Image.network("$BaseUrl/${widget.data!["image"]}",fit: BoxFit.fill,):
                  Image.network("$BaseUrl/${imagee}",fit: BoxFit.fill,),
                ),
              ),
            ),
            Container(
              color: Colors.red,
              width: 100,height:350,
            )
          ],
        ),
      ),
    ],
    ),
      )
    );
  }
  var b;
  var si;
  String ? imagee;
  int ? image_index;
}
