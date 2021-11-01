import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/view/Firstpage.dart';
import 'core/view/loginscreen.dart';
import 'package:get/get.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    initialBinding: Binding(),
    home: FirstScreen(),
    theme: ThemeData(
      fontFamily: 'OpenSans-SemiBold',
    ),
    getPages: [
      GetPage(name: '/HomeScreen', page: () => LoginScreen()),
    ],
  ));
}
