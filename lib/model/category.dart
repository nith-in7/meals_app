import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id,
      required this.title,
      this.color = const Color.fromARGB(255, 226, 140, 28)});
  final String title;
  final String id;
  final Color color;
}
