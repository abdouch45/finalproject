import 'dart:convert';

import 'package:flutter/material.dart';
import '/Services/auth_services.dart';
import '/Services/globals.dart';
import '/rounded_button.dart';
import 'package:http/http.dart' as http;

import 'home_screen.dart';

class VivaForStudent extends StatefulWidget {
  const VivaForStudent({Key? key}) : super(key: key);

  @override
  _VivaForStudentState createState() => _VivaForStudentState();
}

class _VivaForStudentState extends State<VivaForStudent> {

  String _vivaCode = '';

  showViva() async {
    if (_vivaCode.isNotEmpty) {

    }else print('me');
  }

  @override
  Widget build(BuildContext context) {showViva();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Graduate's Viva",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your Viva code',
                ),
                onChanged: (value) {
                  _vivaCode = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                btnText: 'Search for your viva',
                onBtnPressed: () => showViva,
              )
            ],
          ),
        ));
  }
}
