class ProductModel {
  String name = '',
      image = '',
      description = '',
      color = '',
      size = '',
      price = '';

  ProductModel(
      {this.name = '',
      this.image = '',
      this.description = '',
      this.color = '',
      this.size = '',
      this.price = ''});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = map['color'];
    size = map['size'];
    price = map['price'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
    };
  }
}
