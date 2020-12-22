import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fashion_world/models/products.dart';
import 'package:fashion_world/models/domain_server.dart';
import 'package:fashion_world/models/categories.dart';

class ProductRepository {

  final String url = "${DomainServer.name}androidecom/productfetch.php";
  final String url_categories = "${DomainServer.name}androidecom/fetch_brands.php";

     ProductRepository(){

     }
  Future<List<Product>>getProducts() async{
       final http.Response response=await http.get(
            url,
           headers: {
             "Accept":"application/json"
           });

       var products=jsonDecode(response.body);
       var list_products=products["products"] as List;
       List<Product> user_products=list_products.map<Product>((json) => Product.fromJson(json)).toList();
       return user_products;

  }

  Future<List<Categories>>getCategories() async{
    final http.Response response=await http.get(
        url_categories,
        headers: {
          "Accept":"application/json"
        });

    var categories=jsonDecode(response.body);
    var list_categories=categories["brands"] as List;
    List<Categories> user_categories=list_categories.map<Categories>((json) => Categories.fromJson(json)).toList();
    print('The product is ${user_categories[0].name}');

    return user_categories;

  }
}
