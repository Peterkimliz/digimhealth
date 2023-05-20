

import 'package:flutter/material.dart';

InputDecoration inputDecoration({required text}){
  return InputDecoration(
    hintText: text,
    hintStyle: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w400),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.3),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
            width: 1, color: Colors.transparent)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
            width: 1, color: Colors.transparent)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: BorderSide(
            width: 1, color: Colors.transparent)),
  );
}