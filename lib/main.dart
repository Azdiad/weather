import 'package:flutter/material.dart';
import 'package:weatherapp/view/home/homepage.dart';

void main() {
  runApp(const weatherapp());
}

class weatherapp extends StatelessWidget {
  const weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
