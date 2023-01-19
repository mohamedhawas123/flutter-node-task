import 'package:flutter/material.dart';


var textFormDecor = InputDecoration(
  labelStyle: TextStyle(color: Colors.purple),
  labelText: 'السعر',
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10)
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow, width: 1),
    borderRadius: BorderRadius.circular(10),
  ),
);
