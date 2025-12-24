import 'package:crud_product_app_getx/data/model/modelClass.dart';
import 'package:get/get.dart';
import '../../core/network/restClient.dart';
import '../../core/utils/style.dart';

class getxPage extends GetxController{
  RxList<ProductModel> Productlist = <ProductModel>[].obs;
  RxBool loading = false.obs;

  RxMap<String, String> fillitem = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "0",
    "TotalPrice": "",
    "UnitPrice": "",
  }.obs;

  formValueSubmit(data) async {
    if (fillitem["ProductName"]!.length == 0) {
      ErrorMessege("Proudct Name Required");
    } else if (fillitem["ProductCode"]!.length == 0) {
      ErrorMessege("Proudct Code Required");
    } else if (fillitem["Img"]!.length == 0) {
      ErrorMessege("Proudct Img Url Required");
    } else if (fillitem["Qty"]!.length == 0) {
      ErrorMessege("Proudct Qty Required");
    } else if (fillitem["UnitPrice"]!.length == 0) {
      ErrorMessege("Proudct UnitPrice Required");
    } else if (fillitem["TotalPrice"]!.length == 0) {
      ErrorMessege("Proudct Total Price Required");
    } else {
        loading.value = true;
        if(data!=null){
          print(data);
          await productUpdateRequest(fillitem,data.id);
          print(data);
        }
        else{
          await productCreateRequest(fillitem);
        }
        loading.value = false;
        Get.offNamed("/home");
        callData();
    }
  }


  void dataupload(key, Textvalue) {
      fillitem.update(key, (value) => Textvalue);
  }


  @override
  onInit() {
    super.onInit();
    callData();
  }

  callData() async {
    loading.value = true;
   List<ProductModel> data = await listProduct();
      Productlist.value = data;
      print(Productlist);
      loading.value = false;
  }
   deleteItem(id)async{
    bool data= await DeleteProductRequest(id);
    if(data==false){
      ErrorMessege("Delete item fail");
    }
  }
}

