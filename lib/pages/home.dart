import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}
class _Home extends State<StatefulWidget>{

  bool searchEnabled = false;


  void search(){
    setState(() {
      searchEnabled = !searchEnabled;
    });
  }
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        searchEnabled = !searchEnabled;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        child: Column(
          children: [
            GestureDetector(
              onTap: search,
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
              onTap: search,
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
        height: searchEnabled ? 180 : 80,
      ),
      margin: const EdgeInsets.all(20.0)
    );
  }

}