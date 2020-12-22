import 'package:fashion_world/pages/categories_dashboard.dart';
import 'package:fashion_world/pages/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fashion_world/pages/product_dashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fashion_world/pages/cart_details.dart';
import 'package:fashion_world/pages/users_container.dart';
import 'package:fashion_world/pages/categories.dart';
import 'package:fashion_world/services/product_repository.dart';

import 'pages/cart_details.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      //  primarySwatch: Colors.yellow[50],

        iconTheme: IconThemeData(color: Color.fromRGBO(214,24,195,1)),

      ),
      home: MyHomePage(title: 'Fashion World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottom_navigation_page=0;
  GlobalKey _bottomNavigationKey=GlobalKey();
  int value=0;




  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       elevation: 0,
     /*  backgroundColor: Colors.white,*/
        backgroundColor: Color.fromRGBO(220, 153, 89,0.1),
        title:
        TextField(
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
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(214,24,195,1)),
      ),
      endDrawer:Theme(
        data:Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(66, 7, 91,0.4)
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Drawer(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 0.0),
              child: CategoriesPage(),
            )
          ),
        )
        ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,

        index: 0,
        items: <Widget>[
          IconButton(
            icon:Icon(Icons.home_outlined,color: bottom_navigation_page==0 ? Colors.white : Colors.black45,
                 size: bottom_navigation_page==0 ? 35:30,),
            tooltip: 'Home',

          ),
          IconButton(
            icon:Icon(Icons.add_shopping_cart_outlined,color: bottom_navigation_page==1 ? Colors.white : Colors.black45,
              size: bottom_navigation_page==1 ? 35:30,),
            tooltip: 'Orders',
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Cartdetails()));
              }
          ),
          IconButton(
              icon:Icon(Icons.inventory,color: bottom_navigation_page==2 ? Colors.white : Colors.black45,
                size: bottom_navigation_page==2 ? 35:30,),
              tooltip: 'Cart Summary',
            onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>UserContainer()));
            },

          ),

        ],
        color: Colors.white,
        buttonBackgroundColor: Color.fromRGBO(214,24,195,1),
        backgroundColor: Color.fromRGBO(220, 153, 89,0.1),
        animationCurve: Curves.easeInOut,
     //   height: value==1 ? 0 : 100,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index){
          setState(() {
            bottom_navigation_page=index;
            print('index is ' + bottom_navigation_page.toString());
          });
        },
      ),
      body: ProductDashBoard()

    );
  }
}


//#dc9959