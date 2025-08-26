import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage_practice/helper/ui_helper.dart';

import '../../../controller/controllers/add_new_notes_controller.dart';

class AddNewNote extends GetView<AddNewNotesController> {
  const AddNewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      body: Padding(
        padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Save Button
                ///
                Obx(() {
                  return controller.title.isNotEmpty ||
                          controller.description.isNotEmpty
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                }),

                UIHelper.verticalSpace(10.h),
                TextFormField(
                  controller: controller.titleController,
                  maxLines: 1,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                  decoration: InputDecoration(
                    hintText: "Title : ...",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10.h),

                ///Add Descripotion here
                TextFormField(
                  controller: controller.descriptionController,
                  minLines: 5,
                  maxLines: null,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                  decoration: InputDecoration(
                    hintText: "Description : ...",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
