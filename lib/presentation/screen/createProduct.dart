import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/utils/style.dart';
import '../getx/getxPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Createproduct extends StatelessWidget {
   Createproduct({super.key});
   final data=Get.arguments;
   final getxPage gp= Get.find<getxPage>();

   final Img=TextEditingController();
   final ProductCode=TextEditingController();
   final ProductName=TextEditingController();
   final Qty=TextEditingController();
   final TotalPrice=TextEditingController();
   final UnitPrice=TextEditingController();


  @override
  Widget build(BuildContext context) {
    if (data != null) {
      Img.text = data.Img ?? "";
      ProductCode.text = data.ProductCode ?? "";
      ProductName.text = data.ProductName ?? "";
      Qty.text = data.Qty ?? "0";
      TotalPrice.text = data.TotalPrice ?? "";
      UnitPrice.text = data.UnitPrice ?? "";

      gp.fillitem.value = {
        "Img": Img.text,
        "ProductCode": ProductCode.text,
        "ProductName": ProductName.text,
        "Qty": Qty.text,
        "TotalPrice": TotalPrice.text,
        "UnitPrice": UnitPrice.text,
      };
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(data==null?
          "Create Product":"Edite Product",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/horin.svg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child:Obx(()=> gp.loading.value
                ? Center(child: (CircularProgressIndicator()))
                : Column(
              children: [
                TextField(
                  controller:ProductName,
                  decoration: inputDecoration("Product Name"),
                  onChanged: (value) {
                    gp.dataupload("ProductName", value);
                  },
                ),
                SizedBox(height: 5),
                TextField(
                  controller:ProductCode,
                  decoration: inputDecoration("Product Code"),
                  onChanged: (value) {
                    gp.dataupload("ProductCode", value);
                  },
                ),
                SizedBox(height: 5),
                TextField(
                  controller: Img,
                  decoration: inputDecoration("Product Image Url"),
                  onChanged: (value) {
                    gp.dataupload("Img", value);
                  },
                ),
                SizedBox(height: 5),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value:gp.fillitem["Qty"]??0,
                    items: [
                      DropdownMenuItem(
                        child: Text(" Select Qty"),
                        value: "0",
                      ),
                      DropdownMenuItem(
                        child: Text(" 1 Pcs"),
                        value: "1 Pcs",
                      ),
                      DropdownMenuItem(
                        child: Text(" 2 Pcs"),
                        value: "2 Pcs",
                      ),
                      DropdownMenuItem(
                        child: Text(" 3 Pcs"),
                        value: "3 Pcs",
                      ),
                      DropdownMenuItem(
                        child: Text(" 4 Pcs"),
                        value: "4 Pcs",
                      ),
                      DropdownMenuItem(
                        child: Text(" 5 Pcs"),
                        value: "5 Pcs",
                      ),
                    ],
                    onChanged: (value) {
                      gp.dataupload("Qty", value);
                    },
                    isExpanded: true,
                    underline: Container(),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller:UnitPrice,
                  decoration: inputDecoration("Unit Price"),
                  onChanged: (value) {
                    gp.dataupload("UnitPrice", value);
                  },
                ),
                SizedBox(height: 5),
                TextField(
                  controller:TotalPrice,
                  decoration: inputDecoration("Total Price"),
                  onChanged: (value) {
                    gp.dataupload("TotalPrice", value);
                  },
                ),
                SizedBox(height: 5),

                Container(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      gp.formValueSubmit(data);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),)
          ),
        ],
      ),
    );
  }
}

