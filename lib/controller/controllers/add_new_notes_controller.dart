import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewNotesController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxString title = "".obs;
  RxString description = "".obs;

  @override
  void onInit() {
    super.onInit();

    titleController.addListener(() {
      title.value = titleController.text;
    });

    descriptionController.addListener(() {
      description.value = descriptionController.text;
    });
  }
}
