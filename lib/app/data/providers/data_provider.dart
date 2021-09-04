import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portafolio/app/data/models/works.dart';

class DataProvider {
  Future<WorksModel> getWorks() async {
    String works = await rootBundle.loadString('assets/jsons/works.json');
    return WorksModel.fromJson(jsonDecode(works));
  }
}
