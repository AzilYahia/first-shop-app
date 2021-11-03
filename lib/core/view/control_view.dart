import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_appp/core/view/Firstpage.dart';
import 'package:shop_appp/core/view/palette.dart';
import 'package:shop_appp/core/viewmodel/auth_view_model.dart';
import 'package:shop_appp/core/viewmodel/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<AuthViewModel>().user == null
          ? FirstScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16, color: kBlue),
            ),
            label: '',
            icon: SvgPicture.asset(
              'images/svg/home.svg',
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'cart',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16, color: kBlue),
            ),
            label: '',
            icon: SvgPicture.asset(
              'images/svg/cart.svg',
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16, color: kBlue),
            ),
            label: '',
            icon: SvgPicture.asset(
              'images/svg/profile.svg',
              fit: BoxFit.contain,
              width: 20,
            ),
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue.shade600,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
      ),
    );
  }
}
