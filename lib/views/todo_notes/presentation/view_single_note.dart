import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage_practice/helper/ui_helper.dart';

import '../../../controller/controllers/view_single_note_controller.dart';

class ViewSingleNote extends GetView<ViewSingleNoteController> {
  const ViewSingleNote({super.key});

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
                // Obx(() {
                //   return controller.title.isNotEmpty ||
                //           controller.description.isNotEmpty
                //       ? Align(
                //           alignment: Alignment.centerRight,
                //           child: InkWell(
                //             onTap: () {},
                //             child: Container(
                //               padding: EdgeInsets.symmetric(
                //                 horizontal: 20.w,
                //                 vertical: 10.h,
                //               ),
                //               decoration: BoxDecoration(
                //                 color: Colors.deepPurpleAccent,
                //                 borderRadius: BorderRadius.circular(10.r),
                //               ),
                //               child: Text(
                //                 "Save",
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         )
                //       : const SizedBox.shrink();
                // }),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      controller.setEditMode();
                    },
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
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                UIHelper.verticalSpace(10.h),
                Obx(() {
                  return TextFormField(
                    controller: controller.titleController,
                    enabled: controller.isEditMode.value,
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
                  );
                }),
                UIHelper.verticalSpace(10.h),

                ///Add Descripotion here
                Obx(() {
                  return TextFormField(
                    controller: controller.descriptionController,
                    enabled: controller.isEditMode.value,
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
                  );
                }),
                UIHelper.verticalSpace(10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
