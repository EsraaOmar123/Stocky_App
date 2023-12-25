class ProductModel {
  String? image;
  String? title;
  String? size;
  String? subtitle;
  String? price;

  ProductModel({this.image, this.title, this.size, this.subtitle, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    size = json['size'];
    subtitle = json['subtitle'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['size'] = size;
    data['subtitle'] = subtitle;
    data['price'] = price;
    return data;
  }
}
