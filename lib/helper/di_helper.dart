import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final locator = GetIt.instance;
final appData = locator<GetStorage>();

void diSetup() {
  locator.registerSingleton<GetStorage>(GetStorage());
}
