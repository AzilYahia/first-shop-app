import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shop_appp/core/services/firestore_user.dart';
import 'package:shop_appp/core/view/Home_View.dart';
import 'package:shop_appp/model/user_model.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? email, password, name;
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  FacebookLogin _facebookLogin = FacebookLogin();
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleSignInMethod() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
      });
      Get.offAll(HomeView());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void facebookSigninMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken!.token;

    if (result.status == FacebookLoginStatus.loggedIn) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential).then(
        (user) async {
          saveUser(user);
          Get.offAll(
            () => HomeView(),
          );
        },
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar(
        'Error login Account',
        'there was an error.',
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar(
        'Error Sign Up Account',
        'there was an error.',
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void saveUser(UserCredential user) async {
    UserModel _userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email!,
        name: name == null ? user.user!.displayName! : this.name!,
        pic: ''
        //user.user!.photoURL == null
        //? 'default'
        //: user.user!.photoURL! + "?width=400",

        );
    await FireStoreUser().addUsertoFireStore(_userModel);
  }
}
