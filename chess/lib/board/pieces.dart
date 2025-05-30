import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'chess_board_controller.dart';

class ChessPieces extends StatefulWidget {
  final int boardSize;
  final double cellSize;
  final ChessBoardController controller;

  const ChessPieces({
    super.key,
    required this.boardSize,
    required this.cellSize,
    required this.controller,
  });

  @override
  State<ChessPieces> createState() => _ChessPiecesState();
}

class _ChessPiecesState extends State<ChessPieces> {
  int? selectedRow;
  int? selectedCol;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.boardSize,
          ),
          itemCount: widget.boardSize * widget.boardSize,
          itemBuilder: (context, index) {
            int row = index ~/ widget.boardSize;
            int col = index % widget.boardSize;

            String? piece = widget.controller.pieceAt(row, col);

            bool isSelected = selectedRow == row && selectedCol == col;

            Widget? pieceWidget = piece != null
                ? Draggable<Map<String, int>>(
              data: {'fromRow': row, 'fromCol': col},
              feedback: SvgPicture.asset(
                'assets/pieces/$piece.svg',
                width: widget.cellSize * 0.8,
                height: widget.cellSize * 0.8,
              ),
              childWhenDragging: const SizedBox.shrink(),
              child: SvgPicture.asset(
                'assets/pieces/$piece.svg',
                width: widget.cellSize * 0.8,
                height: widget.cellSize * 0.8,
              ),
            )
                : const SizedBox.shrink();

            return DragTarget<Map<String, int>>(
              onAcceptWithDetails: (details) {
                final data = details.data;
                widget.controller.movePiece(
                  data['fromRow']!,
                  data['fromCol']!,
                  row,
                  col,
                );
                setState(() {
                  selectedRow = null;
                  selectedCol = null;
                });
              },
              builder: (context, candidateData, rejectedData) {
                return GestureDetector(
                  onTap: () {
                    if (piece != null) {
                      setState(() {
                        selectedRow = row;
                        selectedCol = col;
                      });
                    } else if (selectedRow != null && selectedCol != null) {
                      widget.controller.movePiece(
                        selectedRow!,
                        selectedCol!,
                        row,
                        col,
                      );
                      setState(() {
                        selectedRow = null;
                        selectedCol = null;
                      });
                    }
                  },
                  child: Container(
                    color: isSelected
                        ? Colors.red.withAlpha((0.4 * 255).toInt())
                        : Colors.transparent,
                    child: Center(child: pieceWidget),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}