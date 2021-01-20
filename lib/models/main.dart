import 'dart:convert';
import 'dart:async';


import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:fashion_world/models//data.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        // This is the theme of your a pplication.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HttpHome(),
    );
  }
}

class HttpHome extends StatelessWidget{
  List UserOrder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:ListView.builder(
            itemCount:2,
            itemBuilder:   (BuildContext context, int index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child:ExpansionTile(
                    title: FutureBuilder<OrderSummary>(
                        future: getOrders(),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            final order =snapshot.data;
                            return Text("Bill no:    Gross Amount :  Service Charge :  \n ${order.bill_no}   ${order.gross_amount}                  ${order.service_charge}  ",style: TextStyle(fontWeight: FontWeight.bold));
                          }
                          else if(snapshot.hasError){
                            return Text(snapshot.error.toString());
                          }

                          return CircularProgressIndicator();
                        }


                    ),
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GFAvatar(
                                backgroundImage: NetworkImage(""),
                                shape: GFAvatarShape.standard,
                                backgroundColor: Colors.lightBlueAccent

                            ),
                            Padding(
                                padding: const EdgeInsets.all(10.0),

                                child: FutureBuilder(
                                    future: getOrders(),
                                    // ignore: missing_return
                                    builder: (context,snapshot) {
                                      if (snapshot.hasData) {
                                        final order = snapshot.data;
                                        return Text("Order No:                                    Quantity:    Amount :     Date \n ${order.name}              ${order
                                            .qty}                 ${order
                                            .amount}          ${order
                                            .added_date} ",textAlign: TextAlign.left,
                                        );
                                      }
                                      else if (snapshot.hasError) {
                                        return Text(snapshot.error.toString());
                                      }
                                    }
                                ) ),
                          ]


                      )
                    ],
                  ),

                ),
              );
            }

        )
    );
  }
}
Future<OrderSummary> getOrders() async{
  final url= "https://queensclassycollections.com/androidfashion/fetchorderhistory.php";
  final response = await http.get(url);

  if (response.statusCode== 200){
    final jsonOrder= jsonDecode(response.body);
    return OrderSummary.fromJson(jsonOrder);

  }
  else{
    throw Exception();
  }



}

