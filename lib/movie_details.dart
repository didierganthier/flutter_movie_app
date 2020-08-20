import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MovieDetails extends StatelessWidget {
  final movie;
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  MovieDetails(this.movie);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              image_url + movie['poster_path'],
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        width: 400.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: NetworkImage(image_url + movie['poster_path']),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: Offset(0.0, 10.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            movie['title'],
                            style: TextStyle(color: Colors.white, fontSize: 30.0),
                          )),
                          Text(
                            '${movie['vote_average']}/10',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                    Text(
                      movie['overview'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 150.0,
                            height: 60.0,
                            alignment: Alignment.center,
                            child: Text(
                              'Rate Movie',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xaa3C3261),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xaa3C3261),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
