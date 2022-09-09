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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['type'] = this.type;
    data['is_available'] = this.isAvailable;
    data['materials'] = this.materials;
    return data;
  }
}

List<String> imageList = [
  'https://cdn.shopify.com/s/files/1/0017/2100/8243/products/SFX-1W_TITANIUMPLAID_eea26f49-544b-4808-9b6e-498d885b31e9_2000x.jpg?v=1589312141',
  'https://cdn2.static1-sima-land.com/items/4058903/0/700-nw.jpg',
  'http://3.bp.blogspot.com/-MxhpQ3INAOA/T2ig9jnC0sI/AAAAAAAACOI/vH0N-ESOjv4/s1600/Palazzo+Pants.jpg',
  'https://media.gettyimages.com/photos/cropped-hand-of-woman-holding-crop-top-against-white-background-picture-id1144097540?s=612x612'
];
