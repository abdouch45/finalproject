import 'package:flutter/material.dart';
import '../../numberTextField.dart';
import 'package:dam_p/providers/calcul_provider.dart';
import 'package:provider/provider.dart';
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
    Calc cal = Provider.of<Calc>(context, listen: false);

    finalMark(){ if(field2.text.isNotEmpty && field3.text.isNotEmpty &&field1.text.isNotEmpty){
      var fMark;
      fMark=cal.calc[0]*0.3+cal.calc[1]*0.3+cal.calc[2]*0.4;
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
      children: [  numberTextField('final mark of a supervisor','[0-12]',field1,0)
      ,numberTextField('final mark of a president','[0-12]',field2,1)
        ,numberTextField('final mark of a examinator','[0-12]',field3,2)
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

