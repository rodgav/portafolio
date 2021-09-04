import 'package:get/get.dart';
import 'package:portafolio/app/data/models/works.dart';
import 'package:portafolio/app/data/providers/data_provider.dart';

class DataRepository {
  final _dataProvider = Get.find<DataProvider>();

  Future<WorksModel> getWorks() => _dataProvider.getWorks();
}
