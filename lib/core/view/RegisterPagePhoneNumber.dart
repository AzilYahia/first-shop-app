import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/FieldText.dart';
import 'widgets/SubmitButton.dart';
import 'palette.dart';
import 'package:get/get.dart';
import 'RegisterPageEmail.dart';

final IconButton hide = IconButton(
  icon: Icon(Icons.visibility_off, color: kTextFieldHintTextColor),
  // TODO: onPress
  onPressed: () {},
);

class RegisterPagePhone extends StatelessWidget {
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
                  'With phone number',
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
              ),
              SizedBox(height: 20),
              // TODO: flags w gae
              Fieldtext(obsec: false, hint: 'Email'),
              SizedBox(height: 20),
              Fieldtext(
                obsec: true,
                hint: 'Password',
                inp: hide,
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
                        'use email address',
                        style: TextStyle(
                          color: kBlue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => Get.to(RegisterPageEmail()),
              ),
              SizedBox(height: 43),
              //
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubmitButton(
                      // TODO: onPress
                      onPress: () {},
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
    );
  }
}
