import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nautic_mobile_app/pages/select-drawing.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}
class _Home extends State<StatefulWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder:
                  (context) => const SelectDrawing())),
              child: Container(
                child: Text("ПОИСК"),
                height: 40,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  boxShadow: const [
                    BoxShadow(color: Colors.green, spreadRadius: 3),
                  ]
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                child: Text("СКАНИРОВАТЬ"),
                height: 40,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(color: Colors.green, spreadRadius: 3),
                  ],
                ),
              )
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        duration: const Duration(milliseconds: 200),
      ),
      margin: const EdgeInsets.all(20.0)
    );
  }

}