import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_appp/core/viewmodel/auth_view_model.dart';
import 'widgets/FieldText.dart';
import 'widgets/SubmitButton.dart';
import 'palette.dart';
import 'package:get/get.dart';
import 'RegisterPagePhoneNumber.dart';

final IconButton hide = IconButton(
  icon: Icon(Icons.visibility_off, color: kTextFieldHintTextColor),
  // TODO: onPress
  onPressed: () {},
);

class RegisterPageEmail extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.off(RegisterPageEmail());
          },
          child: Icon(Icons.arrow_back, color: kBlue),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Text(
                    'Let\'s create your profile',
                    style: TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50,
                    right: 50,
                  ),
                  child: Text(
                    'With email address',
                    style: TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 19,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Fieldtext(
                  obsec: false,
                  hint: 'Name',
                  onSave: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                Fieldtext(
                  obsec: true,
                  hint: 'Password',
                  inp: hide,
                  onSave: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('ERROR');
                    }
                  },
                ),
                SizedBox(height: 20),
                Fieldtext(
                  obsec: true,
                  hint: 'Confirm Password',
                  inp: hide,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                        ),
                        child: Text(
                          'use phone number',
                          style: TextStyle(
                            color: kBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.to(RegisterPagePhone()),
                ),
                SizedBox(height: 43),
                //
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SubmitButton(
                        // TODO: onPress
                        onPress: () {
                          _formKey.currentState!.save();
                          // if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                          // }
                        },
                        lefty: 50,
                        righty: 50,
                        topy: 15,
                        bottomy: 15),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
