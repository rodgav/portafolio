import 'package:get/get.dart';
import 'package:portafolio/app/data/providers/data_provider.dart';
import 'package:portafolio/app/data/repositorys/data_repository.dart';

class DependencyInjection {
  static void init() {
    Get.put<DataProvider>(DataProvider());
    Get.put<DataRepository>(DataRepository());
  }
}
