import 'package:get/get.dart';
import 'package:get_storage_practice/controller/controllers/home_page_controller.dart';

class ControllersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
