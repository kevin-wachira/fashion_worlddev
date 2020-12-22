
class Cart{
  int cart_items_id;
  String cart_items_order_no,p_cart_items_id,p_cart_items_name,cart_items_price,cart_items_qty,
      cart_items_discount,cart_items_color,cart_items_size,cart_items_sub_t,
      cart_items_store,cart_items_route,cart_items_town,cart_items_r_price,cart_items_exchange;
  int cart_items_paid,cart_items_collected,cart_items_packed,
      cart_items_cancel_items,cart_items_add_items;
  String cart_timestamp,cart_items_add_date;
  String ip_add,cart_price,cart_sizes,cart_shop_loc;
  int cart_id,p_cart_id,cart_discount,cart_user_id,cart_qty;

  Cart(){
    cart_items_order_no="";p_cart_items_id="";p_cart_items_name="";cart_items_price="";cart_items_qty="";
    cart_items_discount="";cart_items_color="";cart_items_size="";cart_items_sub_t="";
    cart_items_store="";cart_items_route="";cart_items_town="";cart_items_r_price="";
    cart_items_exchange="";
    this.cart_items_paid=0;this.cart_items_collected=0;
    this.cart_items_packed=0;
    this.cart_items_cancel_items=0;
    this.cart_items_add_items=0;
    this.cart_timestamp="";
  }

  Cart.main({
   this.cart_id,this.p_cart_id,this.cart_price,this.cart_discount,this.ip_add,this.cart_user_id,
    this.cart_qty,this.cart_sizes,this.cart_shop_loc
});

  Cart.items({
    this.cart_items_id,this.cart_items_order_no,this.p_cart_items_id,this.p_cart_items_name,this.cart_items_price,
    this.cart_items_qty,this.cart_items_discount,this.cart_items_color,this.cart_items_size,
    this.cart_items_sub_t,this.cart_items_store,this.cart_items_route,this.cart_items_town,
    this.cart_items_r_price,this.cart_items_paid,this.cart_items_exchange,this.cart_items_collected,
    this.cart_items_packed,this.cart_items_add_date,this.cart_items_cancel_items,this.cart_items_add_items
});

  Map<String,dynamic> cart_main_toJson()=>{
    'id':this.cart_id,
    'p_id':this.p_cart_id,
    'price':this.cart_price,
    'discount':this.cart_discount,
    'ip_add':this.ip_add,
    'user_id':this.cart_user_id,
    'qty':this.cart_qty,
    'sizes':this.cart_sizes,
    'shop_loc':this.cart_shop_loc
  };

 Map<String,dynamic> cart_items_toJson()=>{
   'id':this.cart_items_id,
   'order_no':this.cart_items_order_no,
   'p_id':this.p_cart_items_id,
   'p_name':this.p_cart_items_name,
   'price':this.cart_items_price,
   'qty':this.cart_items_qty,
   'discount':this.cart_items_discount,
   'color':this.cart_items_color,
   'size':this.cart_items_size,
   'sub_t':this.cart_items_sub_t,
   'store':this.cart_items_store,
   'route':this.cart_items_route,
   'town':this.cart_items_town,
   'r_price':this.cart_items_r_price,
   'paid':this.cart_items_paid,
   'exchange':this.cart_items_exchange,
   'collected':this.cart_items_collected,
   'packed':this.cart_items_packed,
   'add_date':this.cart_items_add_date,
   'cancel_items':this.cart_items_cancel_items,
   'add_items':this.cart_items_add_items
 };

 factory Cart.mainFromJson(Map<String,dynamic> parsedJson){
   return Cart.main(
      cart_id: parsedJson['id'],
      p_cart_id: parsedJson['p_id'],
      cart_price: parsedJson['price'],
      cart_discount: parsedJson['discount'],
      ip_add: parsedJson['ip_add'],
      cart_user_id:parsedJson['user_id'],
      cart_qty: parsedJson['qty'],
      cart_sizes: parsedJson['sizes'],
      cart_shop_loc: parsedJson['shop_loc']
   );
 }

 factory Cart.itemsFromJson(Map<String,dynamic> parsedJson){
   return Cart.items(
     cart_items_id:parsedJson['id'],
     cart_items_order_no:parsedJson['order_no'],
     p_cart_items_id:parsedJson['p_id'],
     p_cart_items_name:parsedJson['p_name'],
     cart_items_price:parsedJson['price'],
     cart_items_qty:parsedJson['qty'],
     cart_items_discount:parsedJson['discount'],
     cart_items_color:parsedJson['color'],
     cart_items_size:parsedJson['size'],
     cart_items_sub_t:parsedJson['sub_t'],
     cart_items_store:parsedJson['store'],
     cart_items_route:parsedJson['route'],
     cart_items_town:parsedJson['town'],
     cart_items_r_price:parsedJson['r_price'],
     cart_items_paid:parsedJson['paid'],
     cart_items_exchange:parsedJson['exchange'],
     cart_items_collected:parsedJson['collected'],
     cart_items_packed:parsedJson['packed'],
     cart_items_add_date:parsedJson['add_date'],
     cart_items_cancel_items:parsedJson['cancel_items'],
     cart_items_add_items:parsedJson['add_items']
   );
 }


}