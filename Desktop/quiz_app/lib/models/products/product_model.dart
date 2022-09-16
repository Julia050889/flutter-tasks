class ProductModel {
  String? productName;
  int? price;
  String? type;
  bool? isAvailable;
  List<String>? materials;

  ProductModel({
    this.productName,
    this.price,
    this.type,
    this.isAvailable,
    this.materials,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    type = json['type'];
    isAvailable = json['is_available'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['price'] = price;
    data['type'] = type;
    data['is_available'] = isAvailable;
    data['materials'] = materials;
    return data;
  }
}
