import 'package:get/get.dart';
import 'package:shop_appp/core/viewmodel/auth_view_model.dart';
import 'package:shop_appp/core/viewmodel/cart_view_model.dart';
import 'package:shop_appp/core/viewmodel/checkout_view_model.dart';
import 'package:shop_appp/core/viewmodel/control_view_model.dart';
import 'package:shop_appp/core/viewmodel/home_view_model.dart';
import 'package:shop_appp/core/viewmodel/profile_view_model.dart';
import 'package:shop_appp/helper/local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageUser());
    Get.lazyPut(() => CheckoutViewModel());
    Get.lazyPut(() => ProfileViewModel());
  }
}
