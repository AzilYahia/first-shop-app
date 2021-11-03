import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/view/control_view.dart';
import 'package:get/get.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      initialBinding: Binding(),
      home: ControlView(),
      theme: ThemeData(
        fontFamily: 'OpenSans-SemiBold',
      ),
    ),
  );
}
