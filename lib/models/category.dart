import 'package:flutter/material.dart';

class Category {
 const Category({this.categoryColor=Colors.orange,required this.categoryId,required this.categoryTitle});

  final String categoryTitle;
  final String categoryId;
  final Color categoryColor;
}
