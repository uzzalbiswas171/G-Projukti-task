import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class CustomHttp{
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
  };
  ///Get All Goup
      List getDynamiccategoryData=[];
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

  ///Get Group Wise Category
      List getDynamicgropwisecategoryData=[];
  getGroupWiseCategoryHttpFunction(String GroupSlugname,BuildContext context)async{
    print("AAAAAAAAAAAAAAA $GroupSlugname");
    String url="$BaseUrl/api/v1.0/products/public/product-list?page_size=6&page=1&group__slug=${GroupSlugname}";
    try{
      Response response=await http.get(Uri.parse(url));
      var decodedata=jsonDecode(response.body);
      getDynamicgropwisecategoryData=decodedata["data"]["data"];
    }catch(e){
      print("GEt Group wise Category Catch error $e");
    }
    return getDynamicgropwisecategoryData;
  }
  ///Get Category wise product
      List getcategorywiseproductData=[];
  getCategorywiseproductHttpFunction(String GroupSlugname,BuildContext context)async{
    print("AAAAAAAAAAAAAAA $GroupSlugname");
    String url="$BaseUrl/api/v1.0/products/public/product-list?page_size=20&page=1&category__slug=${GroupSlugname}";
    try{
      Response response=await http.get(Uri.parse(url));
      var decodedata=jsonDecode(response.body);
      getcategorywiseproductData=decodedata["data"]["data"];
    }catch(e){
      print("GEt Group wise Category Catch error $e");
    }
    return getcategorywiseproductData;
  }

}