import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createAlbum(String title) async {
  final http.Response response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to create album.');
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

class PostAlbum extends StatefulWidget {
  const PostAlbum({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _PostAlbumState createState() {
    return _PostAlbumState();
  }
}

class _PostAlbumState extends State<PostAlbum> {
  final TextEditingController _controller = TextEditingController();
  Future<Album>? _futureAlbum;

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
        // ignore: unnecessary_null_comparison
        child: (_futureAlbum == null)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter Title'),
                  ),
                  ElevatedButton(
                    child: const Text('Create Data'),
                    onPressed: () {
                      setState(() {
                        _futureAlbum = createAlbum(_controller.text);
                      });
                    },
                  ),

                  // RaisedButton is deprecated and shouldn't be used. Use ElevatedButton.

                  // RaisedButton(
                  // child: Text('Create Data'),
                  // onPressed: () {
                  //	 setState(() {
                  //	 _futureAlbum = createAlbum(_controller.text);
                  //	 });
                  // },
                  // ),
                ],
              )
            : FutureBuilder<Album>(
                future: _futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return const CircularProgressIndicator();
                },
              ),
      ),
    );
  }
}
