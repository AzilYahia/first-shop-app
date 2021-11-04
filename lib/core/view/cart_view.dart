import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  List<String> names = <String>['yahia', 'yahia', 'yahia', 'yahia', 'yahia'];

  List<String> images = <String>[
    'images/svg/cart.svg',
    'images/svg/cart.svg',
    'images/svg/cart.svg',
    'images/svg/cart.svg',
    'images/svg/cart.svg',
  ];

  List<int> prices = <int>[100, 200, 300, 400, 500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: Center(child: Text(index.toString())),
            );
          },
          itemCount: names.length,
        ),
      ),
    );
  }
}
