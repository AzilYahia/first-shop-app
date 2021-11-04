import 'package:flutter/material.dart';
import 'package:shop_appp/helper/extension.dart';

class ProductModel {
  String name = '', image = '', description = '', size = '', price = '';

  late Color color;

  ProductModel(
      {this.name = '',
      this.image = '',
      this.description = '',
      required this.color,
      this.size = '',
      this.price = ''});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
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
