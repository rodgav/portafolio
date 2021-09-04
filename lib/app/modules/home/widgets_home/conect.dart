import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio/app/data/models/works.dart';
import 'package:portafolio/app/modules/home/home_logic.dart';
import 'package:portafolio/utils/colors_utils.dart';

class Conect extends StatelessWidget {
  const Conect({Key? key}) : super(key: key);

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
                  'Conectar',
                  style: TextStyle(color: ColorsUtils.white, fontSize: 20),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Text('Interesado en trabajar conmigo o tal vez solo hablar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: web ? 50 : 30,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: web ? 0 : 50),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Comuníquese conmigo en las redes sociales o envieme un correo electrónico a ',
                          style: TextStyle(
                              color: Colors.white, fontSize: web ? 20 : 14)),
                      TextSpan(
                          text: 'negocios@cedtodo.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: web ? 20 : 14),
                          mouseCursor: SystemMouseCursors.click,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => null),
                    ],
                  ),
                )),
          ),
          SizedBox(height: 40,),
          Container(
            width: size.width,
            child: Wrap(
                alignment: WrapAlignment.spaceAround,
                runAlignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  IconButton(onPressed: () => null, icon: Icon(Icons.clear),iconSize: 50,color: ColorsUtils.white,),
                  IconButton(onPressed: () => null, icon: Icon(Icons.clear),iconSize: 50,color: ColorsUtils.white,),
                  IconButton(onPressed: () => null, icon: Icon(Icons.clear),iconSize: 50,color: ColorsUtils.white,),
                ]),
          ),  SizedBox(height: 40,),
        ],
      ),
    );
  }
}
