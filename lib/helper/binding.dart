import 'package:get/get.dart';
import 'package:shop_appp/core/viewmodel/auth_view_model.dart';
import 'package:shop_appp/core/viewmodel/control_view_model.dart';
import 'package:shop_appp/core/viewmodel/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
