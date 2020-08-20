import 'package:flutter/material.dart';
import 'package:flutter_movie_app/constants.dart';
import 'package:flutter_movie_app/movie_cell.dart';
import 'package:flutter_movie_app/movie_details.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_movie_app/movie_title.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  Color mainColor = const Color(0xff3C3261);

  var movies;

  Future<Map> getJson() async {
    var url = 'http://api.themoviedb.org/3/discover/movie?api_key=$apiKey';
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  void getData() async {
    var data = await getJson();

    setState(() {
      movies = data['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: mainColor,
        ),
        title: Text(
          'Movies',
          style: TextStyle(
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.menu,
            color: mainColor,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieTitle(
              mainColor: mainColor,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies == null ? 0 : movies.length,
                itemBuilder: (context, i) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(movies[i])));
                    },
                    child: MovieCell(
                      movies: movies,
                      i: i,
                    ),
                    padding: EdgeInsets.all(0.0),
                    color: Colors.white,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
