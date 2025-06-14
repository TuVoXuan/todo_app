import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  hex = hex.replaceAll('#', '');
  if (hex.length == 6) {
    hex = 'FF$hex'; // add full opacity if not provided
  }
  return Color(int.parse(hex, radix: 16));
}
