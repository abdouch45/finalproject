import 'package:dam_p/Screens/calc_screen.dart';
import 'package:dam_p/Screens/login_screen.dart';
import 'package:dam_p/Screens/vivaEval/first_screen.dart';
import 'package:flutter/material.dart';

import '../rounded_button.dart';
import 'vivaforstudent_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 appBar: AppBar(
   backgroundColor: Colors.black,
   centerTitle:true,
   title:new Text('my app'),
 ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [

            RoundedButton(
              btnText: 'Teacher Space',
              onBtnPressed: () =>{
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (BuildContext context) => const LoginScreen(),
              ))
              } ,
            ),


            RoundedButton(
              btnText: 'Viva Evaluation',
              onBtnPressed: () =>{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const firtsScreen(),
                    ))
              } ,
            ),
            RoundedButton(
              btnText: 'Viva Calculator',
              onBtnPressed: () =>{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const calcScreen(),
                    ))
              } ,
            ),

            RoundedButton(
              btnText: "Graduate's Viva",
              onBtnPressed: () =>{ Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const VivaForStudent(),
                  ))} ,
            ),
          ],
        ),

      )

    );
  }
}
