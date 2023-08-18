import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Loading album failed!');
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

  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update the album!');
  }
}

// the album class
class Album {
  final int? id;
  final String? title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

class SocketConnectionExample extends StatefulWidget {
  const SocketConnectionExample({Key? key}) : super(key: key);

  @override
  _SocketConnectionExampleState createState() {
    return _SocketConnectionExampleState();
  }
}

class _SocketConnectionExampleState extends State<SocketConnectionExample> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  void initState() {
    super.initState();
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
                    Text(snapshot.data!.title!),
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
                    ),
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
