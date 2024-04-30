
import 'package:flutter/cupertino.dart';
import 'package:gprojukti/CustomHttp/custom_http.dart';

class ProductProvider with ChangeNotifier{

  /// Get slider
  dynamic getDynamiccategoryData;
  getcategoryProviderFunction(String baseurl,BuildContext context)async{
    getDynamiccategoryData=await CustomHttp().getCategoryHttpFunction(baseurl, context);
    notifyListeners();
  }


}