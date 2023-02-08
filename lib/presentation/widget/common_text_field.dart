import 'package:flutter/material.dart';

Widget commonTextField(String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: text,
        ),
      ),
    );
  }
