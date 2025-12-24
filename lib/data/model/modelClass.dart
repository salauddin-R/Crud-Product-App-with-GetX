class ProductModel{
  String? id;
  String? ProductName;
  String? ProductCode;
  String? Img;
  String? UnitPrice;
  String? Qty;
  String? TotalPrice;
  String? CreatedDate;
  ProductModel({
    this.id,this.ProductName,this.ProductCode,this.Img,this.UnitPrice,this.Qty,this.TotalPrice,this.CreatedDate
});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id:json["_id"],
      ProductName:json["ProductName"],
      ProductCode:json["ProductCode"],
      Img:json["Img"],
      UnitPrice:json["UnitPrice"],
      Qty:json["Qty"],
      TotalPrice:json["TotalPrice"],
      CreatedDate:json["CreatedDate"],
    );
  }

  static List<ProductModel> fromJsonList(List data){
    return data.map((item)=>ProductModel.fromJson(item)).toList();
  }
}