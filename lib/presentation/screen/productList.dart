import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../getx/getxPage.dart';

class productListView extends StatelessWidget {
   productListView({super.key});
   final getxPage gp=Get.put(getxPage());

   showDialog(id){
     Get.defaultDialog(
       title: "Do You want to delete?",
       content:Text("If you delete once, Never get back"),
       textCancel: "Cancel",
       textConfirm: "Conform",
       onConfirm: ()async{
        await gp.deleteItem(id);
        Get.back();
        gp.callData();

       }
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "View Product list",
          style: TextStyle(color: Colors.white, fontSize: 25),
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
                : gp.Productlist.isEmpty?Center(child: Text("There is no data",style:
            TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),):
            RefreshIndicator(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisExtent: 250,
                ),
                itemCount: gp.Productlist.length,
                itemBuilder: (context, index) {
                 final product= gp.Productlist[index]  ;
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            product.Img!=null && product.Img!.isNotEmpty?
                            product.Img!:"https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                          child: Column(
                            children: [
                              Text("Total Price: ${product.ProductName!}",),
                              Text("Unit Price: ${product.UnitPrice!}BDT",),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      Get.toNamed("/Createproduct",arguments:product);
                                    },
                                    child: Icon(
                                      CupertinoIcons
                                          .ellipsis_vertical_circle,
                                      size: 25,
                                      color: const Color.fromARGB(255, 93, 173, 2,),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      showDialog(product.id!);
                                    },
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      size: 25,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              onRefresh: () async {
                await gp.callData();
              },
            ),)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/Createproduct");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

