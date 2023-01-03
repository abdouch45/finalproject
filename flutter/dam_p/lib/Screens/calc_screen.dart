import 'package:flutter/material.dart';
import '../../numberTextField.dart';

class calcScreen extends StatefulWidget {
  const calcScreen({Key? key}) : super(key: key);

  @override
  State<calcScreen> createState() => _calcScreenState();
}

class _calcScreenState extends State<calcScreen> {
  @override
  var field1= new TextEditingController();
  var field2= new TextEditingController();
  var field3= new TextEditingController();
   var a;
  Widget build(BuildContext context) {


    finalMark(){ if(field2.text.isNotEmpty && field3.text.isNotEmpty &&field1.text.isNotEmpty){
      var fMark;
      fMark=double.parse(field1.text)*0.3+double.parse(field2.text)*0.3+double.parse(field3.text)*0.4;
      return fMark.toString();
    }
    else {

      return 'please entre all fields';
    }};
    return  Scaffold(
      appBar: AppBar(
        title: new Text('viva calculator'),
        centerTitle: true,
        backgroundColor: Colors.black,

      ),
      body: Column(
      children: [  numberTextField('final mark of a supervisor','[0-12]',field1)
      ,numberTextField('final mark of a president','[0-12]',field2)
        ,numberTextField('final mark of a examinator','[0-12]',field3)
        ,  SizedBox(child:a==null ? Text('Hello'):Text(a) ,),
     ]),
      floatingActionButton:  FloatingActionButton(
       onPressed:() {

        setState(() {
          a=finalMark();
        });

         }




       ,
      ),
    );

  }
}

