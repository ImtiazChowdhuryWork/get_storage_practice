import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage_practice/constants/app_user_constants.dart';
import 'package:get_storage_practice/helper/di_helper.dart';
import 'package:get_storage_practice/helper/ui_helper.dart';

import '../controller/controllers/home_page_controller.dart';

class HomeScreen extends GetView<HomePageController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Sign Up"),
                SizedBox(height: 50),

                ///Email
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email here",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                ///Password
                Obx(() {
                  return TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isPassObsecured.value,
                    decoration: InputDecoration(
                      hintText: "Enter your password here",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.setPasswordObSecured();
                          log("Button Taped");
                        },
                        icon: Icon(
                          controller.isPassObsecured.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple, width: 2),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepOrange,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                }),
                SizedBox(height: 10),

                ///SignIn Button
                ElevatedButton(
                  onPressed: () {
                    controller.saveData(
                      controller.emailController.text.toString(),
                      controller.passwordController.text.toString(),
                    );
                  },
                  child: Text("Sign In"),
                ),
                SizedBox(height: 20),

                Text(
                  "Read Data From GetStorage",
                  style: TextStyle(fontSize: 25.sp, color: Colors.green),
                ),
                UIHelper.verticalSpace(10.h),

                ///Email Value from GetStorage
                ///
                appData.read(kEmail) != null
                    ? Text(
                        "Email : ${appData.read(kEmail)}",
                        style: TextStyle(fontSize: 25.sp, color: Colors.purple),
                      )
                    : SizedBox.shrink(),
                UIHelper.verticalSpace(10.h),

                ///Password Value from GetStorage
                appData.read(kPassword) != null
                    ? Text(
                        "Password : ${appData.read(kPassword)}",
                        style: TextStyle(fontSize: 25.sp, color: Colors.purple),
                      )
                    : SizedBox.shrink(),
                UIHelper.verticalSpace(10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
