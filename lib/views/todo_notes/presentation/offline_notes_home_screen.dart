import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage_practice/controller/controllers/add_new_notes_controller.dart';
import 'package:get_storage_practice/controller/controllers/view_single_note_controller.dart';
import 'package:get_storage_practice/helper/ui_helper.dart';
import 'package:get_storage_practice/views/todo_notes/presentation/add_new_note.dart';
import 'package:get_storage_practice/views/todo_notes/presentation/view_single_note.dart';
import 'package:intl/intl.dart';

class OfflineNotesHomeScreen extends StatelessWidget {
  const OfflineNotesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(
            () => AddNewNote(),
            binding: BindingsBuilder(() {
              Get.put(AddNewNotesController());
            }),
          );
        },
        label: Text("Add New Note"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("List of ToDo's!"),
                UIHelper.verticalSpace(10.h),

                ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      UIHelper.verticalSpace(10.h),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(UIHelper.kDefaulutPadding()),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          ///Title
                          ///Description
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///Title
                              Text(
                                "Title",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              UIHelper.verticalSpace(10.h),

                              ///Description
                              Text(
                                "Description",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          ///Edit Icon
                          ///Time Date
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ///Edit Icon
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    () => ViewSingleNote(),
                                    binding: BindingsBuilder(() {
                                      Get.put(ViewSingleNoteController());
                                    }),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),

                              ///TimeDate
                              Text(
                                DateFormat('MM/dd/yyyy').format(DateTime.now()),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
