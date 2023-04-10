import 'package:flutter/material.dart';

Widget buildProgressIndicator() {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    ),
  );
}
