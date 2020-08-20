import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  final Color mainColor;

  const MovieTitle({this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Text(
        'Top Rated',
        style: TextStyle(
          fontSize: 40.0,
          color: mainColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
