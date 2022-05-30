class Product {
  String? title;
  String? desc;
  String? img;
  List<String>? categories;
  int? size;
  String? color;
  double? price;

  Product({
    this.title,
    this.desc,
    this.img,
    this.categories,
    this.size,
    this.color,
    this.price,
  });

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
