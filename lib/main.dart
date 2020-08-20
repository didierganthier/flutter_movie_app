import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movie_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movie List Demo',
      home: MovieList(),
    );
  }
}
