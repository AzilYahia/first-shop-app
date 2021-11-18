import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_appp/core/services/firestore_user.dart';
import 'package:shop_appp/helper/local_storage_data.dart';
import 'package:shop_appp/model/user_model.dart';

class ProfileViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  // final LocalStorageData localStorageData = Get.put(LocalStorageData());

  UserModel? get currentUser => _currentUser;
  UserModel? _currentUser;

  String? name, email, password, picUrl;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  void getCurrentUser() async {
    _loading.value = true;
    _currentUser = await LocalStorageUser.getUser();
    _loading.value = false;
    update();
  }

  updateCurrentUser() async {
    try {
      UserModel _userModel = UserModel(
        userId: _currentUser!.userId,
        email: email!,
        name: name!,
        pic: picUrl == null ? _currentUser!.pic : picUrl!,
      );
      await FirebaseAuth.instance.currentUser!.updateEmail(email!);
      await FirebaseAuth.instance.currentUser!.updatePassword(password!);
      FireStoreUser().addUserToFireStore(_userModel);
      await LocalStorageUser.setUser(_userModel);
      getCurrentUser();
      Get.back();
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to update..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

// void singOut() async {
//   GoogleSignIn().signOut();
//   FirebaseAuth.instance.signOut();
//   LocalStorageData.deleteUser();
// }
}
