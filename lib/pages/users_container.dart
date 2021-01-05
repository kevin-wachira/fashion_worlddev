import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_world/pages/customtextstyle.dart';
import 'package:fashion_world/services/product_repository.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class UserContainer extends StatefulWidget {
  UserContainer({Key key}):super(key: key);
  @override

  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<UserContainer> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  int _payment_value=1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Checkout',style: TextStyle(color: Color.fromRGBO(214,24,195,1))),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color.fromRGBO(214,24,195,1)),

        ),
        body: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      standardDelivery(),
                      selectedAddressSection(),
                      checkoutItem(),
                      //priceSection()
                    ],
                  ),
                ),
                flex: 90,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: RaisedButton(
                    onPressed: () {
                      /*Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => OrderPlacePage()));*/
                      showThankYouBottomSheet(context);
                    },
                    child: Text(
                      "Order History",
                      style: CustomTextStyle.textFormFieldMedium.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.pink,
                    textColor: Colors.white,
                  ),
                ),
                flex: 10,
              )
            ],
          );
        }),
      ),
    );
  }

  showThankYouBottomSheet(BuildContext context) {
    return _scaffoldKey.currentState.showBottomSheet((context) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16), topLeft: Radius.circular(16))),
        child: Column(
          children: <Widget>[

            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: <Widget>[
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                            "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art designs clothings that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out.",
                            style: CustomTextStyle.textFormFieldMedium.copyWith(
                                fontSize: 14, color: Colors.grey.shade800),
                          )
                        ])),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(left: 48, right: 48),
                      child: Text(
                        "Track Order",
                        style: CustomTextStyle.textFormFieldMedium
                            .copyWith(color: Colors.white),
                      ),
                      color: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                    )
                  ],
                ),
              ),
              flex: 5,
            )
          ],
        ),
      );
    },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        backgroundColor: Colors.white,
        elevation: 2);
  }
  standardDelivery() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1/6,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(3.0,3.0),
                blurRadius: 5.0,
                spreadRadius: 3.0,
                color: Colors.black12
            )
          ]
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Text(
        "Order Details",
        style: CustomTextStyle.textFormFieldSemiBold
            .copyWith(fontSize: 14),
      ),



    IconButton(icon:Icon(Icons.close_outlined,color: Color.fromRGBO(214,24,195,1),
    size: 20,),
    onPressed: (){

    },
    )
    ],)

    ],
    ),

    );
  }
  //

  selectedAddressSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Shipping Details",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(fontSize: 14),
                  ),
                 FlatButton(
                     child: Container(
                         padding:
                         EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                         decoration: BoxDecoration(
                             shape: BoxShape.rectangle,
                             color: Colors.grey.shade300,
                             borderRadius: BorderRadius.all(Radius.circular(16))),
                         child: Text(
                           "Edit/change",
                           style: CustomTextStyle.textFormFieldBlack.copyWith(
                               color: Colors.black, fontSize: 8),
                         )
                     ),
                   onPressed: (){},

                  )
                ],
              ),
              createAddressText(
                  "431, Commerce House, Nagindas Master, Fort", 16),
              createAddressText("Nairobi - 80015", 6),
              createAddressText("Kasarani", 6),
              SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Mobile : ",
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(fontSize: 12, color: Colors.grey.shade800)),
                  TextSpan(
                      text: "0714556212",
                      style: CustomTextStyle.textFormFieldBold
                          .copyWith(color: Colors.black, fontSize: 12)),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
                width: double.infinity,
              ),

            ],
          ),
        ),
      ),
    );
  }

  createAddressText(String strAddress, double topMargin) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      child: Text(
        strAddress,
        style: CustomTextStyle.textFormFieldMedium
            .copyWith(fontSize: 12, color: Colors.grey.shade800),
      ),
    );
  }




  checkoutItem() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: ListView.builder(
            itemBuilder: (context, position) {
              return checkoutListItem();
            },
            itemCount: 1,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
/*  priceSection() {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.grey.shade200)),
          padding: EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 4,
              ),
              Text(
                "PAYMENTS",
                style: CustomTextStyle.textFormFieldMedium.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              *//*createPriceItem("Total MRP", getFormattedCurrency(5197),
                  Colors.grey.shade700),
              createPriceItem("Bag discount", getFormattedCurrency(3280),
                  Colors.teal.shade300),
              createPriceItem("Tax", getFormattedCurrency(96), Colors.grey.shade700),
              createPriceItem("Order Total", getFormattedCurrency(2013),
                  Colors.grey.shade700),
              createPriceItem(
                  "Delievery Charges", "FREE", Colors.teal.shade300),*//*
              SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                height: 0.5,
                margin: EdgeInsets.symmetric(vertical: 4),
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Total",
                    style: CustomTextStyle.textFormFieldSemiBold
                        .copyWith(color: Colors.black, fontSize: 12),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }*/
  checkoutListItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *3/5,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                offset: const Offset(3.0,3.0),
                blurRadius: 5.0,
                spreadRadius: 3.0,
                color: Colors.black12
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          child: Column(
            children: [
              Text('Payment Info',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,
                  color: Color.fromRGBO(0,0,0,1)),),
              Divider(color: Colors.black12,)
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
          child: Column(
            children: [
              DropdownButtonHideUnderline(child:
              DropdownButton(
                value: _payment_value,
                iconEnabledColor: Color.fromRGBO(0,0,0,1),
                items: [
                  DropdownMenuItem(child: Text('Select Mode Of Payment',
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(0,0,0,1)),),
                    value: 1,),

                  DropdownMenuItem(child: Text("MPESA",style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w700,color: Colors.green),),value: 3,),
                ],
                onChanged: (value){
                  setState((){
                    _payment_value=value;
                  });
                },
              ))
            ],
          ),
        ),

        _payment_value!=1 ?
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1/4,
            child: _payment_value==3 ? Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: Column(children: [
                    TextField(
                      style: TextStyle(fontSize: 14.0),
                      autofocus: false,
                      decoration: InputDecoration(hintText: 'Enter Mpesa phone number',
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        filled: true,
                        fillColor: Color.fromRGBO(220, 153, 89,0.1),
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
                  ],),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  child: Column(children: [
                    TextField(
                      style: TextStyle(fontSize: 14.0),
                      autofocus: false,
                      decoration: InputDecoration(hintText: 'Enter Amount due in Ksh',
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        filled: true,
                        fillColor: Color.fromRGBO(220, 153, 89,0.1),
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
                  ],),
                ),

                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 8/10,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Confirm Payment",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,
                            color: Colors.white),),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: (){},
                      ),
                    )
                )
              ],
            ):
            Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Text('Amount in cash to be paid:',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.green),)),
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Text('Ksh 1000',
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.green),)),
                Padding(padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Confirm and Continue",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,
                            color: Colors.white),),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onPressed: (){},
                      ),
                    )
                )
              ],
            )

        ) :
        Container()


        ],
      ),


    );
  }



  /* String getFormattedCurrency(double amount) {
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(amount: amount);
    fmf.symbol = "₹";
    fmf.thousandSeparator = ",";
    fmf.decimalSeparator = ".";
    fmf.spaceBetweenSymbolAndNumber = true;
    return fmf.formattedLeftSymbol;
  }*/

  createPriceItem(String key, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            key,
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: Colors.grey.shade700, fontSize: 12),
          ),
          Text(
            value,
            style: CustomTextStyle.textFormFieldMedium
                .copyWith(color: color, fontSize: 12),
          )
        ],
      ),
    );
  }
/*
class UserContainer extends StatefulWidget{
  UserContainer({Key key}): super(key: key);

  @override
  UserContainer_state createState()=> UserContainer_state();
}*/
/*

class UserContainer_state extends State<UserContainer>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductRepository productRepository=new ProductRepository();
    productRepository.getProducts();
  }
  int _payment_value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      elevation: 0,
       backgroundColor:Color.fromRGBO(220, 153, 89,0.1),
        title: Text('Checkout',style: TextStyle(color: Color.fromRGBO(214,24,195,1))),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(214,24,195,1)),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:Color.fromRGBO(220,153,89,0.1),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1/6,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3.0,3.0),
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      color: Colors.black12
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0,right: 10.0,left: 10.0,),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Order details',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,
                                color: Color.fromRGBO(214,24,195,1)),),
                              IconButton(icon:Icon(Icons.close_outlined,color: Color.fromRGBO(214,24,195,1),
                              size: 20,),
                              onPressed: (){

                              },
                              )
                          ],)
                        ],
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                        child: Icon(Icons.shopping_cart,color: Color.fromRGBO(214,24,195,1),size: 70,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right:0),
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
                            child: Text('000001',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                color:Colors.black54 ),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                            child: Text('10 items',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,
                                color:Colors.black45 ),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 0.0),
                            child: Text('21/12/2020',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w600,
                                color:Colors.black38 ),),),



                        ],),

                      ),
                        Padding(
                          padding:EdgeInsets.only(left: MediaQuery.of(context).size.width *2/5),

                          child: Text("Ksh 1000",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(214,24,195,1)),),
                        )
                    ],),



                   */
/*
                    ),*//*

                  ],
                ),
              ),


            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *3/5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(3.0,3.0),
                      blurRadius: 5.0,
                      spreadRadius: 3.0,
                      color: Colors.black12
                    )
                  ]
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                      child: Column(
                        children: [
                          Text('Payment Info',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,
                              color: Color.fromRGBO(214,24,195,1)),),
                          Divider(color: Colors.black12,)
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                      child: Column(
                        children: [
                          DropdownButtonHideUnderline(child:
                          DropdownButton(
                            value: _payment_value,
                            iconEnabledColor: Color.fromRGBO(214,24,195,1),
                            items: [
                              DropdownMenuItem(child: Text('Select Mode Of Payment',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,
                                    color: Color.fromRGBO(214,24,195,1)),),
                                value: 1,),
                              DropdownMenuItem(child: Text("Cash",style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w700,color: Colors.black54),),value: 2,),
                              DropdownMenuItem(child: Text("MPESA",style: TextStyle(fontSize: 14,
                                  fontWeight: FontWeight.w700,color: Colors.green),),value: 3,),
                            ],
                            onChanged: (value){
                              setState((){
                                _payment_value=value;
                              });
                            },
                          ))
                        ],
                      ),
                    ),

                    _payment_value!=1 ?
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1/4,
                      child: _payment_value==3 ? Column(
                        children: [
                          Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                            child: Column(children: [
                              TextField(
                                style: TextStyle(fontSize: 14.0),
                                autofocus: false,
                                decoration: InputDecoration(hintText: 'Enter Mpesa phone number',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(220, 153, 89,0.1),
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
                            ],),
                          ),

                          Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                            child: Column(children: [
                              TextField(
                                style: TextStyle(fontSize: 14.0),
                                autofocus: false,
                                decoration: InputDecoration(hintText: 'Enter Amount due in Ksh',
                                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                  filled: true,
                                  fillColor: Color.fromRGBO(220, 153, 89,0.1),
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
                            ],),
                          ),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 8/10,
                                height: 50,
                                child: RaisedButton(
                                  child: Text("Confirm Payment",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,
                                      color: Colors.white),),
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  onPressed: (){},
                                ),
                              )
                          )
                        ],
                      ):
                          Column(
                            children: [
                              Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                              child: Text('Amount in cash to be paid:',
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.green),)),
                              Padding(padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                                  child: Text('Ksh 1000',
                                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: Colors.green),)),
                              Padding(padding:EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: RaisedButton(
                                  child: Text("Confirm and Continue",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,
                                      color: Colors.white),),
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  onPressed: () async {



                                  },
                                ),
                              )
                              )
                            ],
                          )

                    ) :
                        Container()


                  ],
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
*/
}