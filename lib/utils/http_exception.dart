import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHttpExeption implements Exception {
  final String message;
  MyHttpExeption(this.message);

  @override
  String toString() {
    return message;
  }
}
