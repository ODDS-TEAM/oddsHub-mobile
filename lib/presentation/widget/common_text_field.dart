import 'package:flutter/material.dart';

Widget commonTextField(Key key, String text, TextEditingController controller) {
  return Container(
    height: 55,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextField(
      key: key,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: text,
      ),
    ),
  );
}
