
import 'package:flutter/material.dart';

class Appwidget {
  static TextStyle boldTextFeildStyle() {
    return const TextStyle(
        color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);
  }

  static TextStyle lightTextFeildStyle() {
    return const TextStyle(
        color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w500);
  }

  static TextStyle SemiBoldTextFeildStyleBlack() {
    return const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  }

  static TextStyle SemiBoldTextFeildStyleOrange() {
    return const TextStyle(
        color: Color(0xFFfd6f3e), fontSize: 18, fontWeight: FontWeight.bold);
  }

  static TextStyle BoldTextFeildStyleOrange() {
    return const TextStyle(
        color: Color(0xFFfd6f3e), fontSize: 23, fontWeight: FontWeight.bold);
  }
}