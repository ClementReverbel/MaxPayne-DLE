import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Shape{
  final int id;
  final String path_shape;
  final String path_full_image;
  final String character;

  const Shape({required this.id, required this.path_shape, required this.path_full_image, required this.character});
}