import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

// Dispatch action depending upon
//the server response
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );
// parsing JSOn or throwing an exception
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class HttpSample extends StatefulWidget {
  const HttpSample({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HttpSampleState createState() {
    return _HttpSampleState();
  }
}

class _HttpSampleState extends State<HttpSample> {
  final TextEditingController _controller = TextEditingController();
  late Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GeeksForGeeks'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data!.title),
                    TextField(
                      controller: _controller,
                      decoration:
                          const InputDecoration(hintText: 'Enter Title'),
                    ),
                    ElevatedButton(
                      child: const Text('Update Data'),
                      onPressed: () {
                        setState(() {
                          _futureAlbum = updateAlbum(_controller.text);
                        });
                      },
                    )

                    // RaisedButton is deprecated and should not be used.
                    // Use ElevatedButton instead.

                    // RaisedButton(
                    //	 child: const Text('Update Data'),
                    //	 onPressed: () {
                    //	 setState(() {
                    //		 _futureAlbum = updateAlbum(_controller.text);
                    //	 });
                    //	 },
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
