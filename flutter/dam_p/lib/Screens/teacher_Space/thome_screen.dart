import 'dart:convert';

import 'package:dam_p/Screens/home_screen.dart';
import 'package:dam_p/Screens/teacher_Space/newViva.dart';
import 'package:dam_p/local_storage.dart';
import 'package:flutter/material.dart';
import '/Services/auth_services.dart';
import '/Services/globals.dart';

import 'package:http/http.dart' as http;

class teacherHome extends StatefulWidget {
  const teacherHome({super.key});

  @override
  State<teacherHome> createState() => _teacherHomeState();
}



class _teacherHomeState extends State<teacherHome> {
  logOut() async {
  
    http.Response response = await AuthServices.logout().timeout(const Duration(seconds: 5), onTimeout: () {

      print('test');
      errorSnackBar(context, "please check your network",);
      return http.Response('ERROR', 408);});
    Map responseMap = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print('logout');
       tokenStorage.delteToken();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } else  {

        errorSnackBar(context, responseMap.values.first);

    }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>logOut(),
             

              child: Text('log out'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,MaterialPageRoute(
                      builder: (BuildContext context) => const MyCustomForm(),
                    ));
              },


              child: Text('New viva'),
            )
          ],
        ),
      ),
    );
  }
}
