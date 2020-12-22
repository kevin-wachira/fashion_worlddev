import 'package:flutter/material.dart';
import 'package:fashion_world/models/categories.dart';
import 'package:fashion_world/services/product_repository.dart';
import 'dart:async';
class CategoriesPage extends StatefulWidget{
  CategoriesPage({Key key}): super(key:key);

  @override
  Categories_state createState()=> Categories_state();
}

class Categories_state extends State<CategoriesPage>{

  var brands_selected=[false,false,false,false,false,false];
  ProductRepository productRepository=new ProductRepository();
  Future<List<Categories>> fetchCategories;

  @override
  void initState() {
  fetchCategories=productRepository.getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [

          Padding(
          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close_outlined,color: Colors.white,size: 20,),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
          ),


          Padding(
            padding: EdgeInsets.only(
              top:30.0,
              left:20.0,
              right: 20.0,
              bottom: 2.0,
            ),

            child: Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,
            fontSize: 18,fontFamily: 'Open Sans',color: Colors.white),),
          ),

         Padding(
           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20.0),
           child:  Divider(color: Colors.white),
         ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
            child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *3/4,
                  child: // GridView.count(
           //         crossAxisCount: 2,
                   FutureBuilder(
                     future: this.productRepository.getCategories(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context,index){
                      List<Categories> userCategories=snapshot.data;
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                            child: ChoiceChip(label: Text(userCategories[index].name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                              fontFamily: 'Open Sans',color: brands_selected[0] ? Colors.white: Color.fromRGBO(214,24,195,1),),
                            ), selected: brands_selected[0],
                              avatar: brands_selected[0] ? Icon(Icons.check,color: Colors.white,) :null,
                              shape: StadiumBorder(side: BorderSide(color: Color.fromRGBO(214,24,195,0.3))),
                              elevation: 5,
                              onSelected: (bool selected){
                                setState((){
                                  brands_selected[0]=!brands_selected[0];
                                });
                              },backgroundColor:Colors.white,
                              selectedColor: Color.fromRGBO(214,24,195,1),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 5.0),
                            child:  ChoiceChip(label: Text(userCategories[index].name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,
                                fontFamily: 'Open Sans',color: brands_selected[1] ? Colors.white: Color.fromRGBO(214,24,195,1)),
                            ), selected: brands_selected[1],
                              avatar: brands_selected[1] ? Icon(Icons.check,color: Colors.white,) :null,
                              shape: StadiumBorder(side: BorderSide(color: Color.fromRGBO(214,24,195,0.3))),
                              elevation: 5,
                              onSelected: (bool selected){
                                setState((){
                                  brands_selected[1]=!brands_selected[1];
                                });
                              },backgroundColor:Colors.white,
                              selectedColor: Color.fromRGBO(214,24,195,1),),
                          ),
                        ],
                      );

                    },
                    );
                   }
                  else if(snapshot.hasError){
                    return Container(child: Text('Error'),);
                  }
                  else{
                    return Container(child: Text('No data'),);
    }
    },
    )
    ))]));
  }
}




