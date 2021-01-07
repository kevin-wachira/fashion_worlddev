
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class capture extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),

                child: TextField(
                  style: TextStyle(fontSize: 14.0),
                  autofocus: false,
                  decoration: InputDecoration(hintText: 'Enter your Names',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      filled: true,
                      fillColor: Color.fromRGBO(220, 153, 89,0.1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1)),
                          borderRadius: BorderRadius.circular(20.0)
                      )

                  ),
                ),
              ),

,
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                child: Column(children: [
                  TextField(
                    style: TextStyle(fontSize: 14.0),
                    autofocus: false,
                    decoration: InputDecoration(hintText: 'Enter your Mpesa Number',
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      filled: true,
                      fillColor: Color.fromRGBO(220, 153, 89,0.1),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1)),
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.0)
                      ),


                    ),

                  ),
                ],),

              ),


              Column (

                children: [
                  FlatButton(
                    color: Colors.grey,
                    textColor: Colors.black,
                    onPressed: (){},
                    child: Text('SAVE'),
                  )

                ],

              ),


            ],
          ),

        ),

      ),
    );
  }
}