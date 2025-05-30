import 'package:chess/chess_engine/bishop_moves.dart';
import 'package:chess/chess_engine/queen_moves.dart';
import 'package:chess/chess_engine/rook_moves.dart';

import 'king_moves.dart';
import 'pawn_moves.dart';
import 'knight_moves.dart';

class Movevalidator {
  static bool isLegalMove({
    required String? piece,
    required String color,
    required int fromRow,
    required int fromCol,
    required int toRow,
    required int toCol,
    required List<List<String?>> board,
    required int? lastPawnDoubleMoveRow,
    required int? lastPawnDoubleMoveCol,
  }) {
    // Общие проверки
    if (fromRow == toRow && fromCol == toCol) {
      return false;
    }

    // Проверка для пешек
    if (piece!.contains('p')) {
      return PawnMoves.isLegal(
        color: color,
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
        lastPawnDoubleMoveRow: lastPawnDoubleMoveRow,
        lastPawnDoubleMoveCol: lastPawnDoubleMoveCol,
      );
    }

    // Проверка для коней
    if (piece.contains('n')){
      return KnightMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    //Проверка слонов
    if (piece.contains('b')){
      return BishopMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    //Проверка ладей
    if (piece.contains('r')){
      return RookMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    //Проверка ферзей
    if (piece.contains('q')){
      return QueenMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    //Проверка королей
    if (piece.contains('k')){
      return KingMoves.isLegal(
        fromRow: fromRow,
        fromCol: fromCol,
        toRow: toRow,
        toCol: toCol,
        board: board,
      );
    }

    return true;
  }
}