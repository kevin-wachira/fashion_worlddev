import 'package:fashion_world/services/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:strcolor/strcolor.dart';
import 'package:fashion_world/models/products.dart';

class ProductDashBoardItem extends StatefulWidget{
  ProductDashBoardItem({Key key}) :super(key:key);

  @override
  ProductDashBoardItem_state createState()=> ProductDashBoardItem_state();
}

class ProductDashBoardItem_state extends State<ProductDashBoardItem>{
  var sizes_selected=[false,false,false,false,false];
  String selected_color="";
  ProductRepository productRepository=new ProductRepository();
  Future<List<Product>> fetchAllProducts;
  @override
   void initState() {
    fetchAllProducts=productRepository.getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context){


      return  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *4/5,
          child:  Padding(
            padding:EdgeInsets.only(top: 5.0,bottom:5.0,left: 20.0),
            child: FutureBuilder(
              future: this.fetchAllProducts,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data.length-2,
                    itemBuilder: (context,index){
                      List<Product> userproducts=snapshot.data;
                      return  Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              localSheet(userproducts[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:0,right: 20,top:20,bottom:5
                              ),

                              child: Container(
                                width: MediaQuery.of(context).size.width * 2/5,
                                height: 330,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(3.0,3.0),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                        color: Colors.black12
                                    ),


                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(userproducts[index].image),
                                    fit: BoxFit.cover
                                  )
                                ),

                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.bottomCenter ,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:EdgeInsets.symmetric(
                                                      vertical: 0.0,horizontal: 0.0
                                                  ),
                                                  child:  Wrap(
                                                    children: [
                                                      Text(userproducts[index].name,style: TextStyle(color:Color.fromRGBO(214,24,195,1),
                                                          fontWeight: FontWeight.bold,fontSize: 14),),
                                                    ],
                                                  ),),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 2.0,horizontal: 0.0,

                                                  ),

                                                  child: Text("Ksh ${userproducts[index].price}",style: TextStyle(color: Color.fromRGBO(214,24,195,1),
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700),),
                                                ),

                                                RaisedButton.icon(
                                                  color:Color.fromRGBO(214,24,195,1),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:BorderRadius.circular(18.0),
                                                      side: BorderSide(color: Color.fromRGBO(214,24,195,1))
                                                  ),
                                                  onPressed: (){},

                                                  icon:Icon(Icons.add_shopping_cart_outlined,
                                                      color:Colors.white
                                                  ),
                                                  textColor: Colors.white,
                                                  elevation: 10,
                                                  label: Text('Add to cart',style: TextStyle(fontSize: 14,
                                                      fontWeight: FontWeight.w400,color: Colors.white),),


                                                )],
                                            ),
                                          ),
                                        ),


                                  ],
                                ),
                              ),
                            ),
                          ),
                           index<=snapshot.data.length-2 &&  userproducts[index+1]!=null ?
                          GestureDetector(
                            onTap: (){
                              localSheet(userproducts[index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:0,right: 20,top:20,bottom:5
                              ),

                              child: Container(
                                width: MediaQuery.of(context).size.width * 2/5,
                                height: 330,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),

                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(3.0,3.0),
                                        blurRadius: 3.0,
                                        spreadRadius: 2.0,
                                        color: Colors.black12
                                    ),

                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(userproducts[index+1].image),
                                    fit: BoxFit.cover
                                  )
                                ),

                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [

                                            Padding(
                                              padding:EdgeInsets.symmetric(
                                                  vertical: 10.0,horizontal: 0.0
                                              ),
                                              child:  Wrap(
                                                children: [
                                                  Text(userproducts[index+1].name,style: TextStyle(color:Color.fromRGBO(214,24,195,1),
                                                      fontWeight: FontWeight.bold,fontSize: 14),),
                                                ],
                                              ),),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2.0,horizontal: 0.0,

                                              ),

                                              child: Text("Ksh ${userproducts[index+1].price}",style: TextStyle(color: Color.fromRGBO(214,24,195,1),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),),
                                            ),

                                            RaisedButton.icon(
                                              color:Color.fromRGBO(214,24,195,1),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:BorderRadius.circular(18.0),
                                                  side: BorderSide(color: Color.fromRGBO(214,24,195,1))
                                              ),
                                              onPressed: (){},

                                              icon:Icon(Icons.add_shopping_cart_outlined,
                                                  color:Colors.white
                                              ),
                                              textColor: Colors.white,
                                              elevation: 10,
                                              label: Text('Add to cart',style: TextStyle(fontSize: 14,
                                                  fontWeight: FontWeight.w400,color: Colors.white),),


                                            )],
                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          ) : Container(),

                        ],
                      );
                    },

                  );
                }

                else if(snapshot.hasError){
                  return Container();
                }
                else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          )
      );

  }

  void localSheet(Product userProduct){
    showModalBottomSheet(context: context,
        builder: (BuildContext context)=>
            StatefulBuilder(builder: (BuildContext context,setState) =>
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:  FutureBuilder(
                    builder: (context,snapshot){
                      if(userProduct.colors!=null){
                        return Container(
                          //            color: Colors.grey[900],
                          height: MediaQuery.of(context).size.height,
                          color: Colors.transparent,
                          child: Container(
                              decoration: BoxDecoration(
                                color:Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(3.0,3.0)
                                  )
                                ],
                                //    borderRadius: BorderRadius.circular(20.0)
                              ),

                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                                child: Column(

                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                      child: Align(
                                        alignment: FractionalOffset.centerLeft,
                                        child: Text("Available colors",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,
                                            color: Colors.black54),),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height * 1/5,
                                          child: GridView.builder(
                                            gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                childAspectRatio: 3 / 2,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10
                                            ),
                                            itemBuilder: (ctx,index){
                                              return Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                                                    child: Container(
                                                      width: 30,height: 30,
                                                      child: RaisedButton(shape: CircleBorder(side: BorderSide.none),
                                                        color: userProduct.color.color(),onPressed: (){
                                                          setState((){
                                                            selected_color="red";
                                                            print('User product:${userProduct.color}');
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                 /* Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                      child: Container(
                                                        width: 30,height: 30,
                                                        child: RaisedButton(shape: CircleBorder(side: BorderSide.none),
                                                          color: Colors.blue,onPressed: (){
                                                            setState((){
                                                              selected_color="blue";
                                                            });
                                                          },
                                                        ),
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                    child: Container(
                                                      width: 30.0,height: 30.0,
                                                      child: RaisedButton(shape: CircleBorder(side: BorderSide.none),
                                                        color: Colors.green,onPressed: (){
                                                          setState((){
                                                            selected_color="green";
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                    child: RaisedButton(shape: CircleBorder(side: BorderSide.none),
                                                      color: Colors.black,onPressed: (){
                                                        setState((){
                                                          selected_color="black";
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                    child: Container(
                                                      width: 30.0,height: 30.0,
                                                      child: RaisedButton(shape: CircleBorder(side: BorderSide.none),
                                                        color: Colors.orange,onPressed: (){
                                                          setState((){
                                                            selected_color="orange";
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  )*/
                                                ],
                                              );
                                            }
                                          ),
                                        )
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),
                                      child: Align(
                                        alignment: FractionalOffset.centerLeft,
                                        child: Text("Size",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,
                                            color: Colors.black54),),
                                      ),
                                    ),

                                    selected_color != "" ?
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 0.0),
                                      child: Align(
                                          alignment: FractionalOffset.centerLeft,
                                          child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: MediaQuery.of(context).size.height * 1/6,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                                                    child:  Text("Select the preferred size from the menu below",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black45,
                                                        fontSize: 12),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
                                                    child: Row(
                                                      children: [
                                                        Text("Color Selected:",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black45,
                                                            fontSize: 12),),
                                                        Container(
                                                          width: 40,height: 20,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(5.0),
                                                              color: selected_color.color()
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    height: MediaQuery.of(context).size.height * 1/10,
                                                    child:  ListView(
                                                      scrollDirection: Axis.horizontal,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                          child: ChoiceChip(label: Text('XS ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                              fontFamily: 'Open Sans',color: sizes_selected[0] ? Colors.white: selected_color.color()),
                                                          ), selected: sizes_selected[0],
                                                              avatar: sizes_selected[0] ? Icon(Icons.check,color: Colors.white,) :null,
                                                              shape: StadiumBorder(side: BorderSide(color: selected_color.color())),
                                                              elevation: 5,
                                                              onSelected: (bool selected){
                                                                //     selectSize(0);
                                                                setState((){
                                                                  sizes_selected[0]=!sizes_selected[0];
                                                                });
                                                              },backgroundColor:Colors.white,
                                                              selectedColor: selected_color.color()),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                          child: ChoiceChip(label: Text('S',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                              fontFamily: 'Open Sans',color: sizes_selected[1] ? Colors.white: selected_color.color()),
                                                          ), selected: sizes_selected[1],
                                                              avatar: sizes_selected[1] ? Icon(Icons.check,color: Colors.white,) :null,
                                                              shape: StadiumBorder(side: BorderSide(color: selected_color.color())),
                                                              elevation: 5,
                                                              onSelected: (bool selected){
                                                                //   selectSize(1);
                                                                setState((){
                                                                  sizes_selected[1]=!sizes_selected[1];
                                                                });
                                                              },backgroundColor:Colors.white,
                                                              selectedColor: selected_color.color()),
                                                        ),

                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                          child: ChoiceChip(label: Text('M',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                              fontFamily: 'Open Sans',color: sizes_selected[2] ? Colors.white: selected_color.color()),
                                                          ), selected: sizes_selected[2],
                                                              avatar: sizes_selected[2] ? Icon(Icons.check,color: Colors.white,) :null,
                                                              shape: StadiumBorder(side: BorderSide(color: selected_color.color())),
                                                              elevation: 5,
                                                              onSelected: (bool selected){
                                                                //       selectSize(2);
                                                                setState((){
                                                                  sizes_selected[2]=!sizes_selected[2];
                                                                });
                                                              },backgroundColor:Colors.white,
                                                              selectedColor: selected_color.color()),
                                                        ),

                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                          child:  ChoiceChip(label: Text('L',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                              fontFamily: 'Open Sans',color: sizes_selected[3] ? Colors.white: selected_color.color()),
                                                          ), selected: sizes_selected[3],
                                                              avatar: sizes_selected[3] ? Icon(Icons.check,color: Colors.white,) :null,
                                                              shape: StadiumBorder(side: BorderSide(color: selected_color.color())),
                                                              elevation: 5,
                                                              onSelected: (bool selected){
                                                                setState((){
                                                                  sizes_selected[3]=!sizes_selected[3];
                                                                });
                                                                //     selectSize(3);
                                                              },backgroundColor:Colors.white,
                                                              selectedColor: selected_color.color()),),

                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                                                          child: ChoiceChip(label: Text('XL',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                                              fontFamily: 'Open Sans',color: sizes_selected[4] ? Colors.white: selected_color.color()),
                                                          ), selected: sizes_selected[4],
                                                              avatar: sizes_selected[4] ? Icon(Icons.check,color: Colors.white,) :null,
                                                              shape: StadiumBorder(side: BorderSide(color: selected_color.color())),
                                                              elevation: 5,
                                                              onSelected: (bool selected){
                                                                setState((){
                                                                  sizes_selected[4]=!sizes_selected[4];

                                                                });
                                                                //  selectSize(4);
                                                              },backgroundColor:Colors.white,
                                                              selectedColor: selected_color.color()),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              )
                                          )
                                      ),
                                    ) :
                                    Container()
                                  ],
                                ),
                              )
                          ),
                        );
                      }

                      else{
                        return Center();
                      }
                    },
                  )
                )
            )

    );
  }

  Future<Null> selectSize(int i) async{
   setState((){
     sizes_selected[i]=!sizes_selected[i];
   });
  }

  int increment_counter(int index){
    int init_index=index;
    init_index++;
    return init_index;
  }

}