class Product {
  String? id;
  String? title;
  String? desc;
  String? img;
  List<String>? categories;
  int? size;
  String? color;
  num? price;

  Product({
    this.title,
    this.desc,
    this.img,
    this.categories,
    this.size,
    this.color,
    this.price,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      img: json['img'],
      price: json['price'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "title": title,
      "desc": desc,
      "img": img,
      "categories": categories,
      "size": size,
      "color": color,
      "price": price,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
