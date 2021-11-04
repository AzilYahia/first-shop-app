import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_appp/core/view/RegisterPageEmail.dart';
import 'package:shop_appp/core/view/loginscreen.dart';
import 'palette.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shop_appp/core/viewmodel/auth_view_model.dart';

class FirstScreen extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xA6437EAA), kBlue])),
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          // ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Shop.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 53,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'discover your world',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 25),
              Text(
                'welcome to shop!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.facebookSignInMethod();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(left: 20, top: 25, bottom: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)))),
                  child: Row(
                    children: [
                      SvgPicture.asset('images/svg/facebook.svg'),
                      SizedBox(width: 18),
                      Text(
                        'Sign in with Facebook',
                        style: TextStyle(
                            color: kGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextButton(
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(left: 20, top: 25, bottom: 20)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)))),
                  child: Row(
                    children: [
                      SvgPicture.asset('images/svg/google.svg'),
                      SizedBox(width: 18),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(
                            color: kGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'or',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextButton(
                  onPressed: () => Get.to(RegisterPageEmail()),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(top: 25, bottom: 20)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                          side: BorderSide(color: Colors.white),
                        ),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('images/svg/user.svg'),
                      SizedBox(width: 18),
                      Text(
                        'Create a new account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'already have an account',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11),
              ),
              SizedBox(height: 12),
              GestureDetector(
                child: Text(
                  'Log in',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline),
                ),
                onTap: () => Get.to(LoginScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
