import 'package:flutter/material.dart';
import 'package:fashion_world/pages/product_details.dart';
import 'package:fashion_world/widgets/product_dashboard_items.dart';
import 'package:fashion_world/pages/categories.dart';

class ProductDashBoard extends StatefulWidget{
  ProductDashBoard({Key key}):super(key:key);

  @override
  ProductDashboard_State createState()=> ProductDashboard_State();
}

class ProductDashboard_State extends State<ProductDashBoard>{

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(220, 153, 89,0.1),
    //   color: Color.fromRGBO(66, 7, 91,0.1),
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child:SingleChildScrollView(
        child:  Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           /* Padding(
              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height * 1/15,
                child: TextField(
                  style: TextStyle(fontSize: 14.0),
                  autofocus: false,
                  decoration: InputDecoration(hintText: 'Search',

                      suffixIcon:  Padding(
                        padding: EdgeInsetsDirectional.only(start: 0.0),
                        child: Icon(Icons.search,color: Color.fromRGBO(214,24,195,1),),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(214,24,195,1)),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.0)
                      ),


                  ),

                ),
              ),
            ),*/

            Padding(
              padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: ProductDashBoardItem(),
            )



          ],
        ),
      )
    );
  }
}