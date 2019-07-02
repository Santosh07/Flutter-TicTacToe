import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.black
    ),
    title: 'Tic Tac Toe',
    home: HomeScreen()
  )
);