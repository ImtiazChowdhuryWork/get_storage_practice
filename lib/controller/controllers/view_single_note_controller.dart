import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ViewSingleNoteController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // RxString title = "".obs;
  // RxString description = "".obs;

  // @override
  // void onInit() {
  //   super.onInit();

  //   titleController.addListener(() {
  //     title.value = titleController.text;
  //   });

  //   descriptionController.addListener(() {
  //     description.value = descriptionController.text;
  //   });
  // }

  RxBool isEditMode = true.obs;
  void setEditMode() {
    isEditMode.value = !isEditMode.value;
  }
}
