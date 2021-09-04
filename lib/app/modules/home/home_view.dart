import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/modules/home/widgets_home/about.dart';
import 'package:portafolio/app/modules/home/widgets_home/conect.dart';
import 'package:portafolio/app/modules/home/widgets_home/presentation.dart';
import 'package:portafolio/app/modules/home/widgets_home/work.dart';
import 'package:portafolio/utils/colors_utils.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width >= 1100;
    return GetBuilder<HomeLogic>(builder: (_) {
      return Scaffold(
        backgroundColor: ColorsUtils.morado2,
        body: Column(
          children: [
            web
                ? Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    decoration: BoxDecoration(
                        color: ColorsUtils.morado2,
                        boxShadow: [
                          BoxShadow(color: Colors.white, offset: Offset(0, -1))
                        ]),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () => null,
                            icon: Icon(
                              Icons.category,
                              color: Colors.white,
                              size: 30,
                            )),
                        Expanded(child: Container()),
                        MouseRegion(
                          child: GestureDetector(
                            child: Text('work',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            onTap: () => _.scrollIndex(1),
                          ),
                          cursor: SystemMouseCursors.click,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        MouseRegion(
                          child: GestureDetector(
                            child: Text('about',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            onTap: () => _.scrollIndex(2),
                          ),
                          cursor: SystemMouseCursors.click,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        MouseRegion(
                          child: GestureDetector(
                            child: Text('connect',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            onTap: () => _.scrollIndex(3),
                          ),
                          cursor: SystemMouseCursors.click,
                        ),
                      ],
                    ),
                  )
                : AppBar(
                    backgroundColor: ColorsUtils.morado2,
                    leading: IconButton(
                        onPressed: () => null,
                        icon: Icon(Icons.menu, color: Colors.white)),
                    title: IconButton(
                        onPressed: () => null,
                        icon: Icon(Icons.category, color: Colors.white)),
                    centerTitle: true,
                  ),
            Expanded(
                child: ScrollablePositionedList.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Presentation();
                } else if (index == 1) {
                  return WorkWid();
                } else if (index == 2) {
                  return About();
                } else if (index == 3) {
                  return Conect();
                } else {
                  return Text(
                    'others',
                    style: TextStyle(color: ColorsUtils.white),
                  );
                }
              },
              itemScrollController: _.itemHomeScrollController,
              itemPositionsListener: _.itemHomePositionsListener,
            )),
          ],
        ),
      );
    });
  }
}




