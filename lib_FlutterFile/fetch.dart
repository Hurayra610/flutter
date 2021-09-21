import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://flutter-express.herokuapp.com/'));
  if (response.statusCode  == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final String name;
  final String phone;
  final String location;
  final String price;
  final String rating;

  Album({
    required this.name,
    required this.phone,
    required this.location,
    required this.price,
    required this.rating,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'],
      phone: json['phone'],
      location: json['location'],
      price: json['price'],
      rating: json['rating'],
    );
  }
}

void main() => runApp(const MyFetchApp());

class MyFetchApp extends StatefulWidget {
  const MyFetchApp({Key? key}) : super(key: key);

  @override
  _MyFetchAppState createState() => _MyFetchAppState();
}

class _MyFetchAppState extends State<MyFetchApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyFetchApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MyFetchApp'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}