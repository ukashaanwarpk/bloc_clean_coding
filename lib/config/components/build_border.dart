import 'package:flutter/material.dart';

class BuildBorder {
  static OutlineInputBorder border({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color),
    );
  }
}
