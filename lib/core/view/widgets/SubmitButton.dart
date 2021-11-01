import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../palette.dart';

class SubmitButton extends StatelessWidget {
  final Function onPress;
  final double lefty, righty, topy, bottomy;
  final String texty;
  SubmitButton(
      {required this.onPress,
      this.lefty = 100,
      this.righty = 100,
      this.topy = 25,
      this.bottomy = 25,
      this.texty = 'Submit'});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress(),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.only(
            left: lefty, right: righty, top: topy, bottom: bottomy)),
        backgroundColor: MaterialStateProperty.all(kBlue),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))),
      ),
      child: Text(
        texty,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
