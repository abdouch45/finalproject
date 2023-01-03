import 'package:flutter/material.dart';
class numberTextField extends StatefulWidget {
  late String labelText;
  late String hintText;
  late TextInputType keyboardType;
  var myController= new TextEditingController(); // my text input to use it do: myController.text

  numberTextField(this.labelText,this.hintText,this.myController,{super.key,});

  @override
  State<numberTextField> createState() => _numberTextFieldState();
}

class _numberTextFieldState extends State<numberTextField> {
  bool isVisible = false;


  @override
  Widget build(BuildContext context) {

    return TextField(

      keyboardType: TextInputType.number,

      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 12.4,color: Colors.black),
        hintText: widget.hintText,


      ),
      controller: widget.myController,

    );
  }
}
