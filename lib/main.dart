import 'package:crud_product_app_getx/presentation/screen/createProduct.dart';
import 'package:crud_product_app_getx/presentation/screen/productList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute: "/home",
      getPages: [
        GetPage(name:"/home", page:()=>productListView()),
       GetPage(name:"/Createproduct", page:()=>Createproduct())
      ],
    );
  }
}

