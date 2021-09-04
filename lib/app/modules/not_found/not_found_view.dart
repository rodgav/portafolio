import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'not_found_logic.dart';

class NotFoundPage extends StatelessWidget {
  final String name;

  NotFoundPage(this.name);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotFoundLogic>(
      builder: (_) {
        return Scaffold(
            body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton(onPressed: _.goSplash, child: Text('Regresar a inicio'))
          ],
        ));
      },
    );
  }
}
