import 'package:flutter/material.dart';

import 'page/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter 2048',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const GamePage(),
    );
  }
}
