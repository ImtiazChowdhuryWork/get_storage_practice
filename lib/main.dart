import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage_practice/controller/controllers_binding/controllers_binding.dart';
import 'package:get_storage_practice/helper/di_helper.dart';
import 'package:get_storage_practice/views/todo_notes/presentation/offline_notes_home_screen.dart';

void main() async {
  ///This ensures that flutter engine is ready for "bindings intializations"
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: ControllersBindings(),
          home: OfflineNotesHomeScreen(),
        );
      },
    );
  }
}
