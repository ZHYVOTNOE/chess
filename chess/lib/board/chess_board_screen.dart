import 'package:flutter/material.dart';
import 'board.dart';
import 'pieces.dart';
import 'chess_board_controller.dart';

class ChessBoardScreen extends StatefulWidget {
  const ChessBoardScreen({super.key});

  @override
  State<ChessBoardScreen> createState() => _ChessBoardScreenState();
}

class _ChessBoardScreenState extends State<ChessBoardScreen> {
  final int boardSize = 8;
  final controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double size = constraints.maxWidth;
              double cellSize = (size - 4) / boardSize;

              return Stack(
                children: [
                  BoardScreen(boardSize: boardSize, cellSize: cellSize),
                  ChessPieces(
                    boardSize: boardSize,
                    cellSize: cellSize,
                    controller: controller,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
