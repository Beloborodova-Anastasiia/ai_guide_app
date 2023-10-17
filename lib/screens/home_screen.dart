import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:ai_guide/models/attraction.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


Future<Attraction> fetchAttraction(String attrName) async {
  var url = Uri.parse('http://10.0.2.2:8000/get_guide/');
  Map data = {'query': attrName};
  var body = json.encode(data);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);
  // final response = await http
  //     .get(Uri.parse('http://10.0.2.2:8000/get_guide/'));

  if (response.statusCode == 200) {
    return Attraction.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load attraction guide');
  }
}

class _HomePageState extends State<HomePage> {
  String _attraction = '';
  String _content = '';
  String _audioPath = '';
  String toFind = '';
  bool apiCall = false;
  final myController = TextEditingController();
  final player = AudioPlayer();
  // final cache = AudioCache();
  final serverPath = 'http://10.0.2.2:8000';

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _getAttraction() {
    toFind = myController.text;
    var attr = fetchAttraction(toFind);
    attr.then((attraction) {
      setState(() {
      _attraction = attraction.objectName;
      _content = attraction.content;
      // _audioPath = serverPath + attraction.audioPath;
      _audioPath = serverPath + '/get_audio/' + attraction.id.toString() + '/';
      });
    }, onError: (error) {
      setState(() {
      _attraction = error.toString();
      _content = error.toString();
      _audioPath = error.toString();
      });
    });
    apiCall = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter attraction you want to find',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: _getAttraction,
                      tooltip: 'Find attraction',
                      child: const Icon(Icons.search),
                    ),
                  ),

                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              child: Text(
                _attraction,
                style: Theme.of(context).textTheme.displaySmall,

              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 20, bottom: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  FloatingActionButton(
                    onPressed: () {
                      player.setUrl(_audioPath);
                      player.play();
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      player.pause();
                    },
                    child: const Icon(Icons.stop),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              child: Text(
                _content,
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
