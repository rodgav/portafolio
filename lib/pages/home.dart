import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Container(
        margin:
            EdgeInsets.symmetric(vertical: 10, horizontal: kIsWeb ? 50 : 20),
        child: Column(
          children: [
            kIsWeb
                ? Row(
                    children: [
                      IconButton(
                          onPressed: () => null,
                          icon: Icon(
                            Icons.category,
                            color: Colors.white,
                            size: 30,
                          )),
                      Expanded(child: Container()),
                      Text('work',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('about',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        width: 10,
                      ),
                      Text('connect',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  )
                : AppBar(
                    leading: IconButton(
                        onPressed: () => null,
                        icon: Icon(Icons.menu, color: Colors.white)),
                    title: IconButton(
                        onPressed: () => null,
                        icon: Icon(Icons.category, color: Colors.white)),
                    centerTitle: true,
                  ),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (__, index) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Container(
                          width: size.width * 0.45,
                          height: size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Hola, soy Rodolfo un programador front-end y back-end',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Quedate para ver algunos de mis trabajos',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
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
                        width: size.width * 0.45,
                        height: size.height,
                        child: Center(
                          child: Image.asset(
                            'assets/images/developer.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: 4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
