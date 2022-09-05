class Product {
  String? productName;
  int? price;
  bool? isAvailable;
  List<String>? materials;

  Product({
    this.productName,
    this.price,
    this.isAvailable,
    this.materials,
  });

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['product_name'];
    price = json['price'];
    isAvailable = json['is_available'];
    materials = json['materials'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_name'] = productName;
    data['price'] = price;
    data['is_available'] = isAvailable;
    data['materials'] = materials;
    return data;
  }
}
