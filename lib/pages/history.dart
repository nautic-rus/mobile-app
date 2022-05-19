import 'package:flutter/material.dart';
import 'package:nautic_mobile_app/pages/select-drawing.dart';

class History extends StatefulWidget{
  const History({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _History();
}
class _History extends State<StatefulWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Flex(
          children: const [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'История',
                style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 16,
                  color: Color(0xFFffffff),
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  child: Image(
                    image: AssetImage('assets/images/his.png'),
                    width: 128,
                    height: 128,
                  ),
                  widthFactor: 0.6,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Здесь будет отображаться история выбранных вами чертежей',
                style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontSize: 18,
                    color: Color(0xFFffffff),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
          direction: Axis.vertical,
        ),
        margin: const EdgeInsets.all(20.0)
    );
  }

}