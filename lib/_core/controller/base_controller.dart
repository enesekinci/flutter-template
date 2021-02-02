import 'package:get/get.dart';

import '../cache/storage_manager.dart';

abstract class BaseController extends GetxController {
  StorageManager box = StorageManager.instance;
}
