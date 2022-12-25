import 'package:flutter/material.dart';
import '../../numberTextField.dart';
class firtsScreen extends StatefulWidget {
  const firtsScreen({Key? key}) : super(key: key);

  @override
  State<firtsScreen> createState() => _firtsScreenState();
}

class _firtsScreenState extends State<firtsScreen> {
  @override
  var field1= new TextEditingController();
  double a=0;
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: new Text('viva Evaluation'),
        centerTitle: true,
        backgroundColor: Colors.black,

      ),
      body: Column(
      children: [  numberTextField('Organisation du mémoire','[0-0.5]',field1,1)
      ,]),
      floatingActionButton:  FloatingActionButton(
       onPressed:() {
         print('this is me $a');
       },
      ),
    );

  }
}

