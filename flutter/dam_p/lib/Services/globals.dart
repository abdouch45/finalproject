
import 'package:flutter/material.dart';

const String baseURL = "http://10.0.2.2:80/api"; //emulator localhost
const Map<String, String> header1 = {"Content-Type": "application/json",
'Accept': 'application/json'};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 4),
  ));
}
