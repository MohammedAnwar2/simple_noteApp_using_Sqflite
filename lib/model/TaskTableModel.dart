import 'package:practies/database/taskTable.dart';
class Task {
  int? id;
  String? title;
  String? time;
  Task({
    this.id,
    this.title,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      TaskTable.col_id: id,
      TaskTable.col_title: title,
      TaskTable.col_time: time,
    };
  }

  Task.fromMap(Map<String, dynamic> task) {
    id = task[TaskTable.col_id];
    title = task[TaskTable.col_title];
    time = task[TaskTable.col_time];
  }
}
