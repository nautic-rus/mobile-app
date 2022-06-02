import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SelectDrawing extends StatefulWidget{
  const SelectDrawing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectDrawing();
}
class _SelectDrawing extends State<StatefulWidget>{

  int _index = 0;

  late List<String> drawings;

  List<String> projects = List<String>.empty(growable: true);
  List<String> groups = List<String>.empty(growable: true);
  List<String> numbers = List<String>.empty(growable: true);

  String selectedProject = "";
  String selectedGroup = "";
  String selectedNumber = "";

  void refresh(){

  }

  void selectProject(String input){
    setState(() {
      selectedProject = input;
      RegExp search = RegExp('^' + selectedProject);
      RegExp groupMatch = RegExp('(?<=^\\d{6}-)\\d{3}');
      groups.clear();
      drawings.where((element) => search.hasMatch(element)).toList().forEach((element) {
        RegExpMatch? groupValue = groupMatch.firstMatch(element);
        if (groupValue != null && !groups.contains(groupValue[0])){
          groups.add(groupValue[0].toString());
        }
      });
      groups.sort();
      _index += 1;
    });
  }

  void selectGroup(String input){
    setState(() {
      selectedGroup = input;
      RegExp search = RegExp('^' + selectedProject + '-' + selectedGroup);
      RegExp numberMatch = RegExp('(?<=^\\d{6}-\\d{3}-).+');
      numbers.clear();
      drawings.where((element) => search.hasMatch(element)).toList().forEach((element) {
        RegExpMatch? numberValue = numberMatch.firstMatch(element);
        if (numberValue != null && !numbers.contains(numberValue[0])){
          numbers.add(numberValue[0].toString());
        }
      });
      numbers.sort();
      _index += 1;
    });
  }

  Future<List<String>> fetchDrawings() async {
    final response = await http.get(Uri.parse('https://deep-sea.ru/rest/mobileDrawings'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return (jsonDecode(response.body) as List<dynamic>).cast<String>();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load drawings');
    }
  }


  @override
  void initState() {
    super.initState();
    RegExp projectExtract = RegExp("^\\d{6}");
    fetchDrawings().then((value) => {
      setState(() {
        drawings = value;
        drawings.forEach((element) {
          RegExpMatch? match = projectExtract.firstMatch(element);
          if (match != null && !projects.contains(match[0])){
            projects.add(match[0]!);
          }
        });
      })
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Drawing'),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          currentStep: _index,
          controlsBuilder: (context, _) => Container(),
          onStepTapped: (step) {
            setState(() {
              _index = _index > step ? step : _index;
            });
          },
          steps: <Step>[
            Step(
                title: const Text('SELECT PROJECT'),
                content: projects.isEmpty ? const CircularProgressIndicator() :
                    Scrollbar(
                  child: Container(
                    height: 20,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const
                        SliverGridDelegateWithFixedCrossAxisCount
                          (crossAxisCount: 5),
                        itemCount: projects.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () => { selectProject(projects[index])},
                            child: Container(
                              child: Text(projects[index]),
                            ),
                          );
                        }),
                  ),
                )
            ),
            Step(
                title: const Text('SELECT GROUP'),
                content: Scrollbar(
                  child: Container(
                    height: 350,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const
                        SliverGridDelegateWithFixedCrossAxisCount
                          (crossAxisCount: 5),
                        itemCount: groups.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () => { selectGroup(groups[index])},
                            child: Container(
                              child: Text(groups[index]),
                            ),
                          );
                        }),
                  ),
                )
            ),
            Step(
                title: const Text('SELECT NUMBER'),
                content: Scrollbar(
                  child: Container(
                    height: 350,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const
                        SliverGridDelegateWithFixedCrossAxisCount
                          (crossAxisCount: 3),
                        itemCount: numbers.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () => { setState(() => { _index += 1 }) },
                            child: Container(
                              child: Text(numbers[index]),
                            ),
                          );
                        }),
                  ),
                )
            ),
          ],
        ),
      )
    );
  }

}
