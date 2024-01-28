import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practies/database/databaseConfigration.dart';
SQLite sq = SQLite();
class SettingServices extends GetxService {
  static SettingServices instance = Get.find<SettingServices>();
  late GetStorage _box;

  Future<SettingServices> init() async {
    _box = GetStorage();
   //sq.deleteMyDatabase(); // if you want to delete your database , only remove this comment
    return this;
  }
  T read<T>(String key) {
    return _box.read(key);
  }
  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
