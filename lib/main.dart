import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home.dart';

void main() => runApp(
  MaterialApp(
    title: 'Tic Tac Toe',
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe'
        ),
      ),
      body: HomeScreen(),
    ),
  )
);