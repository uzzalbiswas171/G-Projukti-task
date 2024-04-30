import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class CustomHttp{
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
  };
  ///Get Banner
   dynamic getDynamiccategoryData;
  getCategoryHttpFunction(String baseurl,BuildContext context)async{
    String url="$BaseUrl/api/v1.0/catalog/public/product-groups?page_size=0";

    try{
      Response response=await http.get(Uri.parse(url));
      var decodedata=jsonDecode(response.body);
      getDynamiccategoryData=decodedata["data"];
    }catch(e){
      print("GEt Category Catch error $e");
    }
    return getDynamiccategoryData;
  }

}