import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_appp/core/view/widgets/SubmitButton.dart';
import 'package:shop_appp/core/viewmodel/auth_view_model.dart';
import 'palette.dart';
import 'forgotpassword.dart';
import 'package:get/get.dart';
import 'widgets/FieldText.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                SvgPicture.asset(
                  'images/svg/login-page.svg',
                ),
                SizedBox(height: 16),
                Text(
                  'LOGIN',
                  style: TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 31,
                  ),
                ),
                Text(
                  'Login to continue',
                  style: TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 34),
                Fieldtext(
                  obsec: false,
                  hint: 'Email',
                  onSave: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(height: 11),
                Fieldtext(
                  obsec: true,
                  hint: 'Password',
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('Error');
                    }
                  },
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: GestureDetector(
                        // TODO: onPress
                        onTap: () => Get.to(ForgotPasswordScreen()),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 215),
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: kTextFieldHintTextColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                SubmitButton(
                    // TODO: onPress
                    onPress: () {
                      // {
                      _formKey.currentState!.save();
                      // if (_formKey.currentState!.validate()) {
                      controller.signInWithEmailAndPassword();
                      // }
                    },
                    // },
                    texty: 'Log in',
                    lefty: 70,
                    righty: 70,
                    topy: 18,
                    bottomy: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
