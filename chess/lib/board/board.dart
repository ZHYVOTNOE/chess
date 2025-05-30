import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  final int boardSize;
  final double cellSize;

  const BoardScreen({super.key, required this.boardSize, required this.cellSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: boardSize,
        ),
        itemCount: boardSize * boardSize,
        itemBuilder: (context, index) {
          int row = index ~/ boardSize;
          int col = index % boardSize;
          bool isDark = (row + col) % 2 == 1;

          Color backgroundColor = isDark ? Colors.brown : Colors.tealAccent;
          Color textColor = isDark ? Colors.tealAccent : Colors.brown;

          String letter = '';
          String number = '';
          if (row == boardSize - 1) {
            letter = String.fromCharCode('a'.codeUnitAt(0) + col);
          }
          if (col == 0) {
            number = '${boardSize - row}';
          }

          return Stack(
            children: [
              Container(
                width: cellSize,
                height: cellSize,
                color: backgroundColor,
              ),
              if (number.isNotEmpty)
                Positioned(
                  top: 0,
                  left: 3,
                  child: Text(
                    number,
                    style: TextStyle(
                      fontSize: cellSize * 0.2,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (letter.isNotEmpty)
                Positioned(
                  bottom: 0,
                  right: 3,
                  child: Text(
                    letter,
                    style: TextStyle(
                      fontSize: cellSize * 0.25,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
