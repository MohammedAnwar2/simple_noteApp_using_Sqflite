import'package:get/get.dart';
import 'package:practies/routes/appRoute.dart';
import 'package:practies/screens/addTask.dart';
import 'package:practies/screens/editTask.dart';
import 'package:practies/screens/homePage.dart';

List<GetPage<dynamic>> route = [
  GetPage(
      name: AppRoute.HomePage,
      page: () => HomePage(),
      transition: Transition.fade),
  GetPage(
      name: AppRoute.AddTask,
      page: () => const AddTask(),
      transition: Transition.fade),
   GetPage(
       name: AppRoute.EditTask,
       page: () => const EditTask(),
       transition: Transition.fade),
];
