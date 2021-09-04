import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/data/models/works.dart';
import 'package:portafolio/app/modules/home/home_logic.dart';
import 'package:portafolio/utils/colors_utils.dart';

class WorkWid extends StatelessWidget {
  const WorkWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width >= 1100;
    return Container(
      width: size.width,
      color: ColorsUtils.morado1.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Row(
              children: [
                Container(width: 80, height: 5, color: ColorsUtils.morado1),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Trabajos',
                  style: TextStyle(color: ColorsUtils.white, fontSize: 20),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Text('Proyectos seleccionados a mano para que usted vea.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: web ? 50 : 30,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
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
                                style: TextStyle(color: ColorsUtils.white),
                              ),
                              isDense: true,
                              isExpanded: false,
                              underline: Container(
                                height: 0,
                                color: ColorsUtils.white,
                              ),
                              items: List.generate(
                                  works.length,
                                  (index) => DropdownMenuItem<Work>(
                                        child: Text(
                                          works[index].name,
                                          style: TextStyle(
                                              color: ColorsUtils.white),
                                        ),
                                        value: works[index],
                                      )),
                              onChanged: (value) => _.workSelect(value as Work),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: web ? 0 : 50),
                                          child: Text(
                                            work.name,
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
                                            '${work.accomplished} - ${work.state}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: web ? 14 : 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: web ? 0 : 50),
                                      child: Text(
                                        work.description,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: web ? 20 : 14),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: web ? 0 : 50),
                                          child: Text(
                                            'backend'.tr,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: web ? 18 : 16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: web ? 0 : 50),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                work.backend.length,
                                                (index) => Text(
                                                      '* ${work.backend[index]}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              web ? 16 : 12),
                                                    )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: ColorsUtils.morado1,
                                          padding: EdgeInsets.all(20)),
                                      child: Text(
                                        'visit'.tr,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      onPressed: () => null,
                                    ),
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: web ? 0 : 50),
                              width: web ? size.width * 0.46 : size.width,
                              /* height: web? size.height: size.height * 0.5,*/
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
  }
}
