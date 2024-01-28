import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practies/core/controller/databaseController.dart';
import 'package:practies/core/controller/taskController.dart';
import 'package:practies/model/TaskTableModel.dart';
import 'package:practies/widgets/CustomButtonText.dart';
import 'package:practies/widgets/convertDateto.dart';
import 'package:practies/widgets/customTextFomeField.dart';
import 'package:practies/widgets/customTextTitle.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  ImpTaskDatabaseController taskDatabaseController = Get.find<
      ImpTaskDatabaseController>();
  ImpTaskController taskController = Get.find<ImpTaskController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CutomTextTitle(text: 'Add Task'),
                  const SizedBox(height: 20),
                  customTextFomeField(text: taskController.title,
                      label: 'Title',
                      validator: (value) =>
                      value!.trim().isEmpty
                          ? "Please Enter the title"
                          : null,
                      readOnly: false),
                  const SizedBox(height: 20),
                  customTextFomeField(text: taskController.dateTime,
                      label: 'Data',
                      validator: (value) =>
                      value!.trim().isEmpty
                          ? "Please Enter the date"
                          : null,
                      onTap: () {
                        taskController.handleDataPicker(context);
                      },
                      readOnly: true),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Task task = Task(title: title.text,time:currentTime.toIso8601String(),);//this one also currect
                  Task task = Task(title: taskController.title.text,
                      time: ConvertDate.convertTimeFromDateTimeToString(
                          taskController.currentTime));
                  taskDatabaseController.addTask(task: task);
                  Get.back();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: CustomButtonText(text: "Add Note",),
            )
          ],
        ),
      ),
    );
  }
}






