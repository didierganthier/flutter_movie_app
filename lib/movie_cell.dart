import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  Color mainColor = Color(0xff3C3261);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieCell({this.movies, this.i});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Container(
                  width: 70.0,
                  height: 70.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(image_url + movies[i]['poster_path']),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: mainColor,
                        blurRadius: 5.0,
                        offset: Offset(2.0, 5.0))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    Text(
                      movies[i]['title'],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(2.0)),
                    Text(
                      movies[i]['overview'],
                      maxLines: 3,
                      style: TextStyle(color: Color(0xff8785A4)),
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ],
        ),
        Container(
          width: 300,
          height: 0.5,
          color: Color(0xD2D2E1ff),
          margin: EdgeInsets.all(20.0),
        )
      ],
    );
  }
}
