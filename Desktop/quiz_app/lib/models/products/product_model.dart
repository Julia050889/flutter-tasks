class ProductModel {
  ProductModel({
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.isAvailable,
    required this.description,
    required this.materials,
  });

  String productName;
  int price;
  String imageUrl;
  bool isAvailable;
  String description;
  List<String> materials;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productName: json["product_name"],
        price: json["price"],
        imageUrl: json["image_url"],
        isAvailable: json["is_available"],
        description: json["description"],
        materials: List<String>.from(json["materials"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "price": price,
        "image_url": imageUrl,
        "is_available": isAvailable,
        "description": description,
        "materials": List<dynamic>.from(materials.map((x) => x)),
      };
}
