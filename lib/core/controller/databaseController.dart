import 'package:practies/database/taskTable.dart';
import 'package:practies/database/databaseConfigration.dart';
import'package:get/get.dart';
import 'package:practies/model/TaskTableModel.dart';


abstract class TaskDatabaseController extends GetxController {
  Future<void> fetchTasks();
  Future<void> addTask({required Task task});
  Future<void> updateTask({required Task task});
  Future<void> deleteTask({required int id});
}
class ImpTaskDatabaseController extends TaskDatabaseController {

  final RxList<Task> tasks = <Task>[].obs;
  SQLite sq = SQLite();

  Future<void> fetchTasks() async {
    final List<Map<String, dynamic>> taskMaps = await sq.readData(
        table: TaskTable.taskTableName);
        tasks.value=taskMaps.map((data) => Task.fromMap(data)).toList();
    // print("---------------fetchTasks-------------");
  }

  @override
  Future<void> addTask({required Task task}) async {
    var response = await sq.insertData(
        table: TaskTable.taskTableName,
        values: task.toMap());
    print("addTask done------------->$response");
    fetchTasks();
  }

  @override
  Future<void> updateTask({required Task task}) async {
    int response = await sq.updateData(
        table: TaskTable.taskTableName,
        values: task.toMap(),
        my_where:"`${TaskTable.col_id}`=${task.id} ");
    print("updateTask done------------->$response");
    fetchTasks(); //reset the tasks
  }

  @override
  Future<void> deleteTask({required int id}) async {
    int response = await sq.deleteData(
        table: TaskTable.taskTableName,
        my_where: "`${TaskTable.col_id}`=$id");
    print("deleteTask done------------->$response");
    fetchTasks(); //reset the tasks
  }
}
