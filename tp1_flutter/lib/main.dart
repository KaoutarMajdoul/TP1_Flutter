import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: MyCard(),
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TP1 Flutter"),
      ),
      //elevation: 8.0,
        body: Container(
          alignment: Alignment.center,
            child: Stack(
              clipBehavior: Clip.none,

                children: <Widget>[
                  Container(

                    padding: const EdgeInsets.all(0.0),
                    width: 300,
                    height: 200,
                    decoration: new BoxDecoration(
                        color: Colors.pink,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0),
                          bottomLeft: const Radius.circular(20.0),
                          bottomRight: const Radius.circular(20.0),
                        )
                    )
                ),

                  const Positioned(
                    top: -20,
                      left: 100,

                      child: const CircleAvatar(
                          radius: 45,
                          backgroundColor: Color(0xFFFFFFFF),

                          child: CircleAvatar(
                            //radius: 95,
                            radius: 43,
                            backgroundImage: NetworkImage("https://i.pinimg.com/originals/89/3c/48/893c48d2342c5e0336fdefe231c40d48.png"),
                            backgroundColor: Colors.grey,
                          )
                      ),

                  ),
        const Positioned(
          top: 120,
            left: 30,
            child: const Text(

              "MAJDOUL Kaoutar  \n"
                  "kaoutar.majdoul@etu.umontpellier.fr \n"
                  "twitter : xxxx",

              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
              textAlign: TextAlign.center,
            )
        )
                ]

    )
            )
        );

  }
}