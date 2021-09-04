import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/data/models/works.dart';
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
              itemCount: 2 + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    color: ColorsUtils.morado1.withOpacity(0.1),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Container(
                            width: web ? size.width * 0.46 : size.width,
                            height: web ? size.height : size.height * 0.5,
                            child: Column(
                              crossAxisAlignment: web
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: web ? 0 : 50),
                                  child: Text(
                                    'Hola, soy Rodolfo un programador front-end y back-end',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: web ? 50 : 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: web ? 0 : 50),
                                  child: Text(
                                    'Quedate para ver algunos de mis trabajos',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: web ? 20 : 14),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: ColorsUtils.morado1,
                                      padding: EdgeInsets.all(20)),
                                  child: Text(
                                    'Mira mi trabajo',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () => null,
                                ),
                                Container()
                              ],
                            )),
                        Container(
                          width: web ? size.width * 0.46 : size.width,
                          height: web ? size.height : size.height * 0.5,
                          child: Center(
                            child: Image.asset(
                              'assets/images/developer.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else if (index == 1) {
                  return Container(
                    width: size.width,
                    color: ColorsUtils.morado1.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Row(
                            children: [
                              Container(
                                  width: 80,
                                  height: 5,
                                  color: ColorsUtils.morado1),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Trabajos',
                                style: TextStyle(
                                    color: ColorsUtils.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: Text(
                              'Proyectos seleccionados a mano para que usted vea.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: web ? 50 : 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 50),
                          child: GetBuilder<HomeLogic>(
                              id: 'works',
                              builder: (_) {
                                final works = _.worksModel?.works;
                                return works != null
                                    ? works.length > 0
                                        ? DropdownButton(
                                            dropdownColor: ColorsUtils.morado2,
                                            hint: Text(
                                              'works'.tr,
                                              style: TextStyle(
                                                  color: ColorsUtils.white),
                                            ),
                                            isDense: true,
                                            isExpanded: false,
                                            underline: Container(
                                              height: 0,
                                              color: ColorsUtils.white,
                                            ),
                                            items: List.generate(
                                                works.length,
                                                (index) =>
                                                    DropdownMenuItem<Work>(
                                                      child: Text(
                                                        works[index].name,
                                                        style: TextStyle(
                                                            color: ColorsUtils
                                                                .white),
                                                      ),
                                                      value: works[index],
                                                    )),
                                            onChanged: (value) =>
                                                _.workSelect(value as Work),
                                            value: _.work,
                                          )
                                        : Text('no data')
                                    : CircularProgressIndicator();
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: GetBuilder<HomeLogic>(
                              id: 'work',
                              builder: (_) {
                                final work = _.work;
                                return work != null
                                    ? Wrap(
                                        alignment: WrapAlignment.center,
                                        runAlignment: WrapAlignment.center,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 10,
                                        runSpacing: 10,
                                        children: [
                                          Container(
                                              width: web
                                                  ? size.width * 0.46
                                                  : size.width,
                                              height: web
                                                  ? size.height
                                                  : size.height * 0.5,
                                              child: Column(
                                                crossAxisAlignment: web
                                                    ? CrossAxisAlignment.start
                                                    : CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                web ? 0 : 50),
                                                    child: Text(
                                                      work.name,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              web ? 50 : 30,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                web ? 0 : 50),
                                                    child: Text(
                                                      work.description,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              web ? 20 : 14),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: ColorsUtils
                                                                .morado1,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20)),
                                                    child: Text(
                                                      'Mira mi trabajo',
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                    onPressed: () => null,
                                                  ),
                                                  Container()
                                                ],
                                              )),
                                          Container(
                                            width: web
                                                ? size.width * 0.46
                                                : size.width,
                                            height: web
                                                ? size.height
                                                : size.height * 0.5,
                                            child: Center(
                                              child: Image.asset(
                                                'assets/images/developer.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Container();
                              }),
                        ),
                      ],
                    ),
                  );
                } else if (index == 2) {
                  return Text(
                    'About',
                    style: TextStyle(color: ColorsUtils.white),
                  );
                } else if (index == 3) {
                  return Text(
                    'Contact',
                    style: TextStyle(color: ColorsUtils.white),
                  );
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
