import 'package:flutter/material.dart';

Widget commonTextField(Key key, String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        key: key,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
