import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/data/models/works.dart';
import 'package:portafolio/app/modules/home/home_logic.dart';
import 'package:portafolio/utils/colors_utils.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width >= 1100;
    return Container(
      width: size.width,
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
                  'About Me',
                  style: TextStyle(color: ColorsUtils.white, fontSize: 20),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Text('Mira más de cerca quién soy.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: web ? 50 : 30,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: GetBuilder<HomeLogic>(builder: (_) {
              return Wrap(
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 40,
                                      height: 5,
                                      color: ColorsUtils.morado1),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: web ? 0 : 50),
                                    child: Text(
                                      'Quién soy',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: web ? 18 : 16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: web ? 0 : 50),
                                child: Text(
                                  'Soy Rodolfo Muñoz, tengo 23 años y soy de Perú. El desarrollo móvil'
                                  'ha sido mi interés durante muchos años, y trabajo casi con cualquier proyecto '
                                  'desde aplicaciones de trabajo, ocio y demás. Todas las habilidades y herramientas'
                                  'que utilizo son autodidactas durante años de práctica y ampliando mis horizontes.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: web ? 16 : 14),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      width: 40,
                                      height: 5,
                                      color: ColorsUtils.morado1),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: web ? 0 : 50),
                                    child: Text(
                                      'Habilidades y herramientas',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: web ? 18 : 16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: web ? 0 : 50),
                                child: Text(
                                  'Front-end: Flutter, Angular, Android JetPack',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: web ? 16 : 14),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: web ? 0 : 50),
                                child: Text(
                                  'Back-end: PHP, NodeJS, MySql, MongoDB, Firebase',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: web ? 16 : 14),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: ColorsUtils.morado1,
                                padding: EdgeInsets.all(20)),
                            child: Text(
                              'contact'.tr,
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () => _.scrollIndex(3),
                          ),
                        ],
                      )),
                  Container(
                    width: web ? size.width * 0.46 : size.width,
                    /* height: web? size.height : size.height * 0.5,*/
                    child: Center(
                      child: Image.asset(
                        'assets/images/developer.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
