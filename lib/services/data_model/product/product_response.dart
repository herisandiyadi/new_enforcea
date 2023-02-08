class ProductResponse {
  ProductResponse({
    required this.success,
    required this.data,
  });

  bool success;
  List<Product> data;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        success: json["success"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.productId,
    required this.productCategory,
    required this.productName,
    required this.productDesc,
    required this.productContent,
    required this.productPrice,
    required this.productDiscountPrice,
    required this.productImages,
    required this.productThumb,
    required this.productTag,
    required this.status,
  });

  int productId;
  int productCategory;
  String productName;
  String productDesc;
  String productContent;
  String productPrice;
  String productDiscountPrice;
  String productImages;
  String productThumb;
  String productTag;
  String status;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productCategory: json["product_category"],
        productName: json["product_name"],
        productDesc: json["product_desc"],
        productContent: json["product_content"],
        productPrice: json["product_price"],
        productDiscountPrice: json["product_discount_price"],
        productImages: json["product_images"],
        productThumb: json["product_thumb"],
        productTag: json["product_tag"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_category": productCategory,
        "product_name": productName,
        "product_desc": productDesc,
        "product_content": productContent,
        "product_price": productPrice,
        "product_discount_price": productDiscountPrice,
        "product_images": productImages,
        "product_thumb": productThumb,
        "product_tag": productTag,
        "status": status,
      };
}
