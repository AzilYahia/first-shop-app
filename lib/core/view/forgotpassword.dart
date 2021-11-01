import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/SubmitButton.dart';
import 'widgets/FieldText.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'images/svg/forgot-password-page.svg',
              ),
              SizedBox(height: 22),
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Enter email address and we will send',
                style: TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                ' you password reset link',
                style: TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 43),
              Fieldtext(obsec: false, hint: 'Email'),
              SizedBox(height: 22),
              SubmitButton(
                  // TODO: onPress
                  onPress: () {},
                  lefty: 100,
                  righty: 100,
                  topy: 25,
                  bottomy: 25),
            ],
          ),
        ),
      ),
    );
  }
}
