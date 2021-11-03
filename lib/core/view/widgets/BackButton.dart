import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../palette.dart';

class BackButton extends StatelessWidget {
  final StatelessWidget screen;
  BackButton({required this.screen});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.off(screen);
      },
      child: Icon(Icons.arrow_back, color: kBlue),
    );
  }
}
