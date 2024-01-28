import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practies/widgets/convertDateto.dart';
abstract class TaskController extends GetxController{
  handleDataPicker(BuildContext context);
  changeTheCurrentTime(DateTime date);
}
class ImpTaskController extends TaskController {
  TextEditingController title = TextEditingController();
  TextEditingController dateTime = TextEditingController();
  DateTime currentTime = DateTime.now();
  @override
  handleDataPicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: currentTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: "Select Date",
    );
    if (date != null && date != currentTime) {
      changeTheCurrentTime(date);
    }
  }
  @override
  changeTheCurrentTime(DateTime date){
    currentTime=date;
    //if you want to use this one in UI you should first add GetBuilder , otherwise no need to add GetBuild ,
    //ex if we want to use it as parameter to one function and that function will not effect anything in UI ,we don't need to add
    //in this app we didnot need to use it to change the UI , we only use the dateTime
    dateTime.text =ConvertDate.convertTimeFromDateTimeToString(date);
    update();
  }
}
