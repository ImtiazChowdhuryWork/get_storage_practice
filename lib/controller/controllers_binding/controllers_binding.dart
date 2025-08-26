import 'package:get/get.dart';
import 'package:get_storage_practice/controller/controllers/home_page_controller.dart';

import '../controllers/add_new_notes_controller.dart';
import '../controllers/view_single_note_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<AddNewNotesController>(() => AddNewNotesController());
    Get.lazyPut<ViewSingleNoteController>(() => ViewSingleNoteController());
  }
}
