import 'package:flutter/material.dart';
import 'board/chess_board_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Board',
      debugShowCheckedModeBanner: false,
      home: const ChessBoardScreen(),
    );
  }
}

