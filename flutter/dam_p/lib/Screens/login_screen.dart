import 'dart:convert';


import 'package:dam_p/local_storage.dart';
import 'package:flutter/material.dart';
import '/Services/auth_services.dart';
import '/Services/globals.dart';
import '/rounded_button.dart';
import 'package:http/http.dart' as http;



import 'teacher_Space/thome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password).timeout(const Duration(seconds: 5), onTimeout: () {

        print('test');
        errorSnackBar(context, "please check your network",);
        return http.Response('ERROR', 408);});
      String jsonsDataString = response.body.toString();
      Map responseMap = jsonDecode(jsonsDataString);
      if (response.statusCode == 200) {


        await tokenStorage.setToken(responseMap['token']);

        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const teacherHome(),
            ));
      } else  {

          errorSnackBar(context,responseMap.values.first);


        }

    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    tokenStorage.getToken().then((value) => {
      print(value)


    });
    //


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Login',
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
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;

                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedButton(
                btnText: 'LOG IN',
                onBtnPressed: () => loginPressed(),
              )
            ],
          ),
        ));
  }
}
