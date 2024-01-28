import 'package:get/get.dart';
import 'package:practies/core/controller/databaseController.dart';
import 'package:practies/core/settingServices.dart';
import 'package:practies/core/controller/taskController.dart';
class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingServices(), fenix: true);
    Get.lazyPut(() => ImpTaskDatabaseController(), fenix: true);
    Get.lazyPut(() => ImpTaskController(), fenix: true);//z
  }
}
