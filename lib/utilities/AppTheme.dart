import 'package:flutter/material.dart';

class AppTheme {

  static const TextStyle display1 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 38,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.1,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static const TextStyle display3 = TextStyle(
    fontFamily: 'WorkSans',
    color: Colors.black,
    fontSize: 25,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.2,
  );

  static const TextStyle display4 = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 14,
  );
  static const TextStyle display5 = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w600,
    color: Colors.blue,
    fontSize: 20,
  );
  static final TextStyle heading = TextStyle(
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w900,
    fontSize: 30,
    color: Colors.green.withOpacity(0.8),
    letterSpacing: 1.2,
  );


  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w800,
    fontSize: 24,
    color: Colors.brown,
  );
  static final TextStyle taphere = TextStyle(
    inherit: true,
    fontFamily: 'WorkSans',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    fontSize: 20,
    color: Colors.blue.withOpacity(0.8),
  );

}