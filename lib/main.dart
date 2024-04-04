// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import, prefer_const_literals_to_create_immutables, duplicate_import

import "package:flutter/material.dart";
import "package:money_share_project/views/input_money_ui.dart";
import "package:money_share_project/views/splash_screen_ui.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUI(),
    ),
  );
}
