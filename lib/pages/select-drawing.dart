import 'package:flutter/material.dart';

class SelectDrawing extends StatefulWidget{
  const SelectDrawing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectDrawing();
}
class _SelectDrawing extends State<StatefulWidget>{

  // late Future<List<String>> drawings;
  // Future<List<String>> fetchDrawings() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Album.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   drawings = fetchDrawings();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Project'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }

}