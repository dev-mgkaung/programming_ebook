import 'package:flutter/material.dart';
import 'package:programmingebook/screens/home/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Programming Ebook App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.tealAccent,
      ),
      home: HomeScreen(),
    );
  }
}
