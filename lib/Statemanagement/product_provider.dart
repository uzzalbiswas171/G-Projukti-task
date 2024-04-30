
import 'package:flutter/cupertino.dart';
import 'package:gprojukti/CustomHttp/custom_http.dart';

class ProductProvider with ChangeNotifier{

  /// Get Group List
  List getDynamiccategoryData=[];
  getcategoryProviderFunction(String baseurl,BuildContext context)async{
    getDynamiccategoryData=await CustomHttp().getCategoryHttpFunction(baseurl, context);
    notifyListeners();
  }

  /// Get Group Wisde Category list
  List getGroupWiseCategorylist=[];
  getGroupWiseCategoryProviderFunction(String groupslug,BuildContext context)async{
    getGroupWiseCategorylist=await CustomHttp().getGroupWiseCategoryHttpFunction("${groupslug}", context);
    notifyListeners();
  }

  /// Get Group Wisde Category list
  List getCategorywiseproductlist=[];
  getCategorywiseproductProviderFunction(String groupslug,BuildContext context)async{
    getCategorywiseproductlist=await CustomHttp().getCategorywiseproductHttpFunction("${groupslug}", context);
    notifyListeners();
  }


}