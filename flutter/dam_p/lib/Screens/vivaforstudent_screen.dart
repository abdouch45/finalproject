import 'dart:convert';

import 'package:flutter/material.dart';
import '/Services/auth_services.dart';
import '/Services/globals.dart';
import '/rounded_button.dart';
import 'package:http/http.dart' as http;

class VivaForStudent extends StatefulWidget {
  const VivaForStudent({Key? key}) : super(key: key);

  @override
  _VivaForStudentState createState() => _VivaForStudentState();
}

class _VivaForStudentState extends State<VivaForStudent> {

  String _vivaCode = '';
  void _showMaterialDialog(data) {

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(

            title: Text('VIVA INFO'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('project name: ${data["pname"]}'),
                Text('project yaer: ${data["year"]}'),
                Text('president name: ${data["prname"]}'),
                Text('president mark: ${data["prmark"]}'),
                Text('supervisor name: ${data["sname"]}'),
                Text('supervisor mark: ${data["smark"]}'),
                Text('examiner name: ${data["ename"]}'),
                Text('examiner mark: ${data["emark"]}'),
                Text('students name: '),
                Text(' - ${data["s1name"]}'),
                if(data["s3name"]!=null)Text(' - ${data["s3name"]}') ,
                if (data["s2name"]!=null) Text(' - ${data["s2name"]}'),
                Text('final mark: ${data["fmark"]}'),







              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close')),

            ],
          );
        });
  }
  showViva() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_vivaCode.isNotEmpty) {
      http.Response response = await Viva.getViva(_vivaCode).timeout(const Duration(seconds: 5), onTimeout: () {

        print('test');
        errorSnackBar(context, "please check your network",);
        return http.Response('ERROR', 408);});
      String jsonsDataString = response.body.toString();
      Map responseMap = jsonDecode(jsonsDataString);

      if (response.statusCode == 200) {

        _showMaterialDialog(responseMap);
      } else  {

        errorSnackBar(context,responseMap.values.first);


      }

    } else {
      errorSnackBar(context, 'enter viva code');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: false,
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
                obscureText: false,
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
                onBtnPressed: () => showViva(),
              )
            ],
          ),
        ));
  }
}
