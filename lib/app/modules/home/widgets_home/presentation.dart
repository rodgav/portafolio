import 'package:flutter/material.dart';
import 'package:portafolio/utils/colors_utils.dart';

class Presentation extends StatelessWidget {
  const Presentation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool web = size.width >= 1100;
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
                crossAxisAlignment:
                web ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: web ? 0 : 50),
                    child: Text(
                      'Hola, soy Rodolfo un programador front-end y back-end',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: web ? 50 : 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: web ? 0 : 50),
                    child: Text(
                      'Quedate para ver algunos de mis trabajos',
                      style: TextStyle(
                          color: Colors.white, fontSize: web ? 20 : 14),
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
            //height: web ? size.height : size.height * 0.5,
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
  }
}