import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/data/models/works.dart';
import 'package:portafolio/app/data/repositorys/data_repository.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeLogic extends GetxController {
  final _dataRepository = Get.find<DataRepository>();
  final itemHomeScrollController = ItemScrollController();
  final itemHomePositionsListener = ItemPositionsListener.create();

  WorksModel? _worksModel;
  Work? _work;

  WorksModel? get worksModel => _worksModel;

  Work? get work => _work;

  @override
  void onReady() {
    _getWorks();
    super.onReady();
  }

  void _getWorks() async {
    _worksModel = await _dataRepository.getWorks();
    update(['works']);
    if (worksModel != null) {
      if (worksModel!.works.length > 0) {
        _work = worksModel?.works[0];
        update(['work']);
      }
    }
  }

  void workSelect(Work value) {
    _work = value;
    update(['works', 'work']);
  }

  void scrollIndex(int index) {
    itemHomeScrollController.scrollTo(
        index: index,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }
}
