import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  );

  static final textFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
