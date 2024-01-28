import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practies/widgets/CustomButtonText.dart';
import 'package:practies/widgets/convertDateto.dart';
import 'package:practies/widgets/customTextFomeField.dart';
import 'package:practies/widgets/customTextTitle.dart';
import 'package:practies/core/controller/databaseController.dart';
import 'package:practies/core/controller/taskController.dart';
import 'package:practies/model/TaskTableModel.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});
  @override
  State<EditTask> createState() => _EditTaskState();
}
class _EditTaskState extends State<EditTask> {
  ImpTaskDatabaseController taskDatabaseController = Get.find<ImpTaskDatabaseController>();
  ImpTaskController taskController = Get.find<ImpTaskController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Task task_t = Task();
@override
  void initState() {
    task_t = Get.arguments;
    taskController.title.text = task_t.title!;
    taskController.dateTime.text = task_t.time!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  CutomTextTitle(text: 'Edit Task'),
                    const SizedBox(height: 20),
                    customTextFomeField(text: taskController.title, label: 'Title', validator: (value) => value!.trim().isEmpty?"Please Enter the title":null,readOnly: false),
                    const SizedBox(height: 20),
                    customTextFomeField(text: taskController.dateTime, label: 'Data', validator: (value) => value!.trim().isEmpty?"Please Enter the date":null,onTap: () {
                      taskController.handleDataPicker(context);
                    },readOnly: true),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate())
                  {
                    // Task task = Task(title: title.text,time:currentTime.toIso8601String(),);//this one also currect
                    Task task = Task(id: task_t.id,title: taskController.title.text,time:ConvertDate.convertTimeFromDateTimeToString(taskController.currentTime));
                    taskDatabaseController.updateTask(task:task);
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child:  const CustomButtonText(text:"Edit Task",),
              ),
              ElevatedButton(
                onPressed: () {
                  if(formKey.currentState!.validate())
                  {
                    // Task task = Task(title: title.text,time:currentTime.toIso8601String(),);//this one also currect
                    Task task = Task(id: task_t.id,title: taskController.title.text,time:ConvertDate.convertTimeFromDateTimeToString(taskController.currentTime));
                    taskDatabaseController.deleteTask(id:task.id!);
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child:  const CustomButtonText(text:"Delete Task",),
              )
            ],
          ),
        ),
      ),
    );
  }
}

