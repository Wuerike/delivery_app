import 'package:flutter/material.dart';

extension StringExtensions on String {
  String ellipsisOverflowFix() {
    return Characters(this).replaceAll(Characters(' '), Characters('\u{000A0}')).toString();
  }
}
