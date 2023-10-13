import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class Attraction {
  final int id;
  final String objectName;
  final String location;
  final String content;

  const Attraction({
    required this.id,
    required this.objectName,
    required this.location,
    required this.content,

  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'],
      objectName: json['object_name'],
      location: json['location'],
      content: json['content']
    );
  }
}
Future<Attraction> fetchAttraction() async {
  var url = Uri.parse('http://10.0.2.2:8000/get_guide/');
  Map data = {
    'query': 'Big Ben'
  };
  var body = json.encode(data);
  var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  // final response = await http
  //     .get(Uri.parse('http://10.0.2.2:8000/get_guide/'));

  if (response.statusCode == 200) {
    return Attraction.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load attraction guide');
  }
}

class AiGuide extends StatelessWidget {
  const AiGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AU Guide Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String _attraction = '';
  bool apiCall = false;
  // Future<Attraction>? futureAttr;

  // @override
  // void initState() {
  //     super.initState();
  //     futureAttr = fetchAttraction();
  //   }

  // @override
  // void _getAttraction() {
  //     setState(() {
  //       futureAttr = fetchAttraction();
  //       apiCall=true;
  //     });
  //   }

  @override
  void _getAttraction() {

      var attr = fetchAttraction();
      attr.then((attraction){
          setState(() {
            _attraction = attraction.objectName;
          });
        },onError: (error) {
        setState(() {_attraction = error.toString();});
      //   });
      });
      apiCall=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter attraction you want to find',
              ),
            ),
            const Text(
              'You have received at this moment:',
            ),
            // getProperWidget(),

            Text(
              _attraction,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            //
          // FutureBuilder<Attraction>(
          //   future: futureAttr,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(
          //         snapshot.data!.object_name,
          //         style: Theme.of(context).textTheme.headlineMedium,
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //
          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          //   ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _getAttraction,
        // onPressed: (){
        //   print('PRESSED');
        // }
        //   setState((){
        //     apiCall=true; // Set state like this
        //   });
        //   _getAttraction
      //     _callWeatherApi();
      //   },
      //   // child: new Text("Get Weather"),
      // ),

        // tooltip: 'Hello',
        child: const Icon(Icons.search),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Widget getProperWidget(){
  //   if(apiCall) {
  //     print('$_attraction ********');
  //       (context, snapshot) {
  //     return Text(
  //       '$_attraction',
  //       style: Theme.of(context).textTheme.displayMedium,
  //     );
  //     // return new CircularProgressIndicator();
  //   }
  //   else {
  //     print('$_attraction NOT!!!!');
  //     return new Text(
  //       '$_attraction',
  //       style: Theme.of(context).textTheme.displayMedium,
  //     );
  //   }
  // }

}
