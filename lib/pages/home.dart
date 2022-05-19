import 'package:flutter/material.dart';
import 'package:nautic_mobile_app/pages/info.dart';
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
      alignment: Alignment.center,
      child: Flex(
        children: [
          const Expanded(
            child: Center(
              child: FractionallySizedBox(
                child: Image(
                  image: AssetImage('assets/images/logo1.png'),
                ),
                widthFactor: 0.6,
              ),
            ),
          ),

          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child : GestureDetector(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: const Image(
                                image: AssetImage('assets/images/qr.png'),
                                width: 30,
                                height: 30,
                              ),
                              margin: const EdgeInsets.all(10),
                            ),
                            Container(
                              child: const Text(
                                'QR-код',
                                style: TextStyle(
                                  fontFamily: 'MontserratAlternates',
                                  fontSize: 20,
                                  color: Color(0xFFffffff),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              margin: const EdgeInsets.all(10),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        height: 52,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 0.38)),
                            left: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 0.38)),
                            right: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 0.38)),
                            bottom: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 0.38)),
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), bottomLeft: Radius.circular(50.0)),
                          color: Color.fromRGBO(255,250,250, 0.17),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Info())),
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                child: const Text(
                                  'Поиск',
                                  style: TextStyle(
                                    fontFamily: 'MontserratAlternates',
                                    fontSize: 20,
                                    color: Color(0xFF4893b7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                margin: const EdgeInsets.all(10),
                              ),
                              Container(
                                child: const Image(
                                  image: AssetImage('assets/images/zoom.png'),
                                  width: 20,
                                  height: 20,
                                ),
                                margin: const EdgeInsets.all(10),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          height: 52,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 1)),
                              left: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 1)),
                              right: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 1)),
                              bottom: BorderSide(width: 1.0, color: Color.fromRGBO(255,250,250, 1)),
                            ),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0)),
                            color: Colors.white,
                          ),
                        )
                    ),
                  )
                ],
              ),
              alignment: Alignment.topCenter,
            ),
          )
        ],
        direction: Axis.vertical,
      ),
      margin: const EdgeInsets.all(20.0)
    );
  }

}