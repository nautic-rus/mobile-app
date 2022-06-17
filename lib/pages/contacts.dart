import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Contacts extends StatefulWidget{
  const Contacts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Contacts();
}
class _Contacts extends State<StatefulWidget>{

  launchMailto() async {
    final mailtoLink = Mailto(
      to: ['office@nautic-rus.ru'],
      subject: 'Message From Nautic Rus Mobile App',
      body: '',
    );
    await launchUrlString('$mailtoLink');
  }
  launchPhoneCallTech() async {
    await launchUrlString("tel:+79216118165");
  }
  launchPhoneCall() async {
    await launchUrlString("tel:+78122426235");
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Контакты',
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Телефоны',
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600
              ) ,
            ),
          ),
          GestureDetector(
            onTap: launchPhoneCall,
            child: Row(
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/images/phone.png'),
                    width: 26,
                    height: 26,
                  ),
                  margin: const EdgeInsets.all(10),
                ),
                Column(
                  children: const [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '+7 (812) 242-62-35',
                        style: TextStyle(
                          fontFamily: 'MontserratAlternates',
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ) ,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Наутик Рус',
                        style: TextStyle(
                          fontFamily: 'MontserratAlternates',
                          fontSize: 12,
                          color: Color(0xFF737373),
                        ) ,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: launchPhoneCallTech,
            child: Row(
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/images/mobile.png'),
                    width: 26,
                    height: 26,
                  ),
                  margin: const EdgeInsets.all(10),
                ),
                Column(
                  children: const [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '+7 (921) 611-81-65',
                        style: TextStyle(
                          fontFamily: 'MontserratAlternates',
                          fontSize: 16,
                          color: Color(0xFF000000),
                        ) ,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Тех поддержка',
                        style: TextStyle(
                          fontFamily: 'MontserratAlternates',
                          fontSize: 12,
                          color: Color(0xFF737373),
                        ) ,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Электронная почта',
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600
              ) ,
            ),
          ),
          GestureDetector(
            onTap: launchMailto,
            child: Row(
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/images/mail.png'),
                    width: 26,
                    height: 26,
                  ),
                  margin: const EdgeInsets.all(10),
                ),
                const Text(
                  'office@nautic-rus.ru',
                  style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontSize: 16,
                    color: Color(0xFF000000),
                  ) ,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Адрес',
              style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 16,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w600
              ) ,
            ),
          ),
          Row(
            children: [
              Container(
                child: const Image(
                  image: AssetImage('assets/images/building.png'),
                  width: 28,
                  height: 30,
                ),
                margin: const EdgeInsets.all(10),
              ),
              const Expanded(
                child: Text(
                  'г. СПб, ул. Кронштадтская, дом 9, корпус 4, стр 1, офис 303',
                  style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontSize: 16,
                    color: Color(0xFF000000),
                  ) ,
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              child: WebView(
                initialUrl: Uri.dataFromString('<!DOCTYPE '
                    'html><html><head><meta name="viewport" '
                    'content="width=device-width, initial-scale=1'
                    '.0"></head><body style="margin: 0; padding: 0; height: '
                    '320px; width: 100%"><iframe src="https://yandex'
                    '.ru/map-widget/v1/?um=constructor'
                    '%3A2816aef1e623755eb81590303af6247d7df5b597b11cc036a637d894cef09cf0&amp;source=constructor" width="100%" height="320" frameborder="0"></iframe></body>', mimeType:
                'text/html').toString(),
                javascriptMode: JavascriptMode.unrestricted,
                zoomEnabled: false,
              ),
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            )
          ),
        ],
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,
    );
  }

}