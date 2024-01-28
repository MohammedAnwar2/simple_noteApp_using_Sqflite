import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practies/widgets/customTextTitle.dart';
import 'package:practies/core/controller/databaseController.dart';
import 'package:practies/model/TaskTableModel.dart';
import 'package:practies/routes/appRoute.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImpTaskDatabaseController controller = Get.find<ImpTaskDatabaseController>();
  @override
  void initState() {
    controller.fetchTasks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.AddTask);
      },child: Icon(Icons.add)),
        appBar: AppBar(
          title: const CutomTextTitle(text: 'Home Page'),
        ),
        body:   Obx(() {
          return controller.tasks.isNotEmpty?ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              Task task = controller.tasks[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      task.title.toString(),
                    ),
                    subtitle: Text(
                      task.time!,),
                    trailing: Text(task.id.toString()),
                    onTap: () {
                     Get.toNamed(AppRoute.EditTask, arguments: task);
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              );
            },
          ):Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            child: const Center(child: Text("There is no tasks"),),
          );
        })
    );
  }
}

