import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage_practice/constants/app_user_constants.dart';
import 'package:get_storage_practice/helper/di_helper.dart';

class HomePageController extends GetxController {
  ///TextEditing Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///Password ObSecured
  RxBool isPassObsecured = true.obs;

  void setPasswordObSecured() {
    isPassObsecured.value = !isPassObsecured.value;
    log("Obsecure value : ${isPassObsecured.value}");
  }

  ///Save Data in GetStorage
  void saveData(String email, String password) {
    ///Email Section
    appData.write(kEmail, email);
    log(appData.read(kEmail));

    ///Password Section
    appData.write(kPassword, password);
    log(appData.read(kEmail));
  }
}
