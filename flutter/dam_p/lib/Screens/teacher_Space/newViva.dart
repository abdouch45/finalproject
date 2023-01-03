import 'package:flutter/material.dart';
import 'dart:convert';



import '/Services/auth_services.dart';
import '/Services/globals.dart';

import 'package:http/http.dart' as http;
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
    Map<String,String> data={};
    var field1= new TextEditingController();
    var field2= new TextEditingController();
    var field3= new TextEditingController();
    var field4= new TextEditingController();
    var field5= new TextEditingController();
    var field6= new TextEditingController();
    var field7= new TextEditingController();
    var field8= new TextEditingController();
    var field9= new TextEditingController();
    var field10= new TextEditingController();
    var field11= new TextEditingController();

    //custom dialogue
    void _showMaterialDialog(code) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('VIVA CODE'),
              content: Text('here is your viva code $code'),
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

  createNewViva() async {
    Map data={};
   if(field1.text.isNotEmpty && field2.text.isNotEmpty &&field3.text.isNotEmpty &&field4.text.isNotEmpty &&field5.text.isNotEmpty &&field6.text.isNotEmpty &&field7.text.isNotEmpty && field8.text.isNotEmpty && field9.text.isNotEmpty ){
    print('this is me ');
    if(field10.text.isEmpty && field11.text.isNotEmpty) {
      errorSnackBar(context, 'specifie 2nd student');
     return ;}
    data={"pname":field1.text,"year":field2.text,"prname":field3.text,
      "prmark":field4.text,"sname":field5.text,"smark":field6.text,
      "ename":field1.text,"emark":field8.text,"s1name":field9.text};
    if(field10.text.isNotEmpty){
      data['s2name']=field10.text;
    }
    if(field11.text.isNotEmpty){
      data['s3name']=field11.text;
    }

     http.Response response = await Viva.create(data).timeout(const Duration(seconds: 5), onTimeout: () {

       print('test');
       errorSnackBar(context, "please check your network",);
       return http.Response('ERROR', 408);});
     Map responseMap = jsonDecode(response.body.toString());
     if (response.statusCode == 200) {
       print(responseMap.values.first);
       _showMaterialDialog(responseMap.values.first);


     } else  {

       errorSnackBar(context,responseMap.values.first);



     }
    }else{
     errorSnackBar(context, 'please entre all required fields');



    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('VIVA MARK'),
      ),
      body: SingleChildScrollView(
        physics:  BouncingScrollPhysics(),


          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // The first text field is focused on as soon as the app starts.
                Text('Enter project name'),
                 TextField(
                  controller: field1,
                  decoration: InputDecoration(
                    hintText: 'project name',
                    border: OutlineInputBorder(),
                  ),

                ),

                Text('Enter year'),
                TextField(
                  controller: field2,
                  decoration: InputDecoration(
                      hintText: ' year', border: OutlineInputBorder()),

                ),
                Text('Enter President full name'),
                TextField(
                  controller: field3,
                  decoration: InputDecoration(
                      hintText: 'President full name', border: OutlineInputBorder()),

                ),
                Text('Enter President mark'),
                TextField(
                  controller: field4,
                  decoration: InputDecoration(
                      hintText: 'President mark', border: OutlineInputBorder()),

                ),
                Text('Enter Supervisor full name'),
                TextField(
                  controller: field5,
                  decoration: InputDecoration(
                      hintText: 'Supervisor full name', border: OutlineInputBorder()),

                ),
                Text('Enter Supervisor mark'),
                TextField(
                  controller: field6,
                  decoration: InputDecoration(
                      hintText: 'Supervisor mark', border: OutlineInputBorder()),

                ),
                Text('Enter Examiner full name'),
                TextField(
                  controller: field7,
                  decoration: InputDecoration(
                      hintText: 'Examiner full name', border: OutlineInputBorder()),

                ),
                Text('Enter Examiner mark'),
                TextField(
                  controller: field8,
                  decoration: InputDecoration(
                      hintText: 'Examiner mark', border: OutlineInputBorder()),

                ),
                Text('Enter first student full name  '),
                TextField(
                  controller: field9,
                  decoration: InputDecoration(
                      hintText: 'first student full name ', border: OutlineInputBorder()),

                ),
                Text('Enter second student full name'),
                TextField(
                  controller: field10,
                  decoration: InputDecoration(
                      hintText: 'second student full name ', border: OutlineInputBorder()),

                ),
                Text('Enter third student full name '),
                TextField(
                  controller: field11,
                  decoration: InputDecoration(
                      hintText: 'third student full name ', border: OutlineInputBorder()),

                ),
                ElevatedButton(onPressed: () => createNewViva(), child: Text('New Viva',))

              ],
            ),
          ),
      ),
    );
  }
}
