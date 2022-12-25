import 'package:flutter/material.dart';
import 'package:dam_p/providers/calcul_provider.dart';
import 'package:provider/provider.dart';
class numberTextField extends StatefulWidget {
  late String labelText;
  late String hintText;

  late TextInputType keyboardType;
  late int num;
  var myController= new TextEditingController(); // my text input to use it do: myController.text

  numberTextField(this.labelText,this.hintText,this.myController,this.num,{super.key,});

  @override
  State<numberTextField> createState() => _numberTextFieldState();
}

class _numberTextFieldState extends State<numberTextField> {
  bool isVisible = false;


  @override
  Widget build(BuildContext context) {
    Calc counter = Provider.of<Calc>(context, listen: false);
    return TextField(

      keyboardType: TextInputType.number,
      onChanged: (value){
       if(value.isNotEmpty){
         counter.setMark(widget.num,double.parse(value));

       }else{
     counter.removeMark(widget.num);
       }
       print(value);
        print(counter.calc);

      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(fontSize: 12.4,color: Colors.black),
        hintText: widget.hintText,


      ),
      controller: widget.myController,

    );
  }
}
