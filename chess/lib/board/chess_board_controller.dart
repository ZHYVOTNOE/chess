import 'package:flutter/material.dart';
import '../chess_engine/move_validator.dart';

class ChessBoardController extends ChangeNotifier {
  List<List<String?>> board;

  int? lastPawnDoubleMoveCol;
  int? lastPawnDoubleMoveRow;

  String currentTurn = 'white';

  ChessBoardController()
      : board = List.generate(8, (_) => List.filled(8, null)) {
    _initializeBoard();
  }

  void _initializeBoard() {
    board[0] = [
      'Chess_rdt45', 'Chess_ndt45', 'Chess_bdt45', 'Chess_qdt45',
      'Chess_kdt45', 'Chess_bdt45', 'Chess_ndt45', 'Chess_rdt45'
    ];
    board[1] = List.filled(8, 'Chess_pdt45');
    board[6] = List.filled(8, 'Chess_plt45');
    board[7] = [
      'Chess_rlt45', 'Chess_nlt45', 'Chess_blt45', 'Chess_qlt45',
      'Chess_klt45', 'Chess_blt45', 'Chess_nlt45', 'Chess_rlt45'
    ];
  }

  String? pieceAt(int row, int col) => board[row][col];

  void movePiece(int fromRow, int fromCol, int toRow, int toCol) {
    String? piece = board[fromRow][fromCol];
    if (piece == null) return;

    String color = piece.contains('lt') ? 'white' : 'black';

    if (color != currentTurn) return;

    bool isLegal = Movevalidator.isLegalMove(
      piece: piece,
      color: color,
      fromRow: fromRow,
      fromCol: fromCol,
      toRow: toRow,
      toCol: toCol,
      board: board,
      lastPawnDoubleMoveRow: lastPawnDoubleMoveRow,
      lastPawnDoubleMoveCol: lastPawnDoubleMoveCol,
    );

    if (isLegal) {
      if (piece.contains('p') && (fromRow - toRow).abs() == 2) {
        lastPawnDoubleMoveRow = toRow;
        lastPawnDoubleMoveCol = toCol;
      } else {
        lastPawnDoubleMoveRow = null;
        lastPawnDoubleMoveCol = null;
      }

      if (piece.contains('p') &&
          (toCol - fromCol).abs() == 1 &&
          board[toRow][toCol] == null) {
        int capturedPawnRow = color == 'white' ? toRow + 1 : toRow - 1;
        board[capturedPawnRow][toCol] = null;
      }

      board[toRow][toCol] = board[fromRow][fromCol];
      board[fromRow][fromCol] = null;

      currentTurn = (currentTurn == 'white') ? 'black' : 'white';

      notifyListeners();
    }
  }
}