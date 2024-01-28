import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practies/core/binding.dart';
import 'package:practies/core/settingServices.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practies/routes/appRoute.dart';
import 'package:practies/routes/route.dart';
import 'package:practies/screens/homePage.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Get.putAsync(() async => SettingServices().init());
  AppBinding().dependencies();
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: HomePage(),
      initialRoute: AppRoute.HomePage,
      getPages: route,
    );
  }
}




