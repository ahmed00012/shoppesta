import 'package:shoppesta/components/cart_items.dart';


import 'package:sqflite/sqflite.dart';
import 'db_helper.dart';
class CartMethod{

  static Future<int> addUser(single_item item ) async{
    Database mydb= await DaataBaseHelper.getdb();
    Map<String,dynamic> itemMap= new Map()  ;
    itemMap["id"]=item.cart_prod_id;
    itemMap["product"]= item.cart_prod_name;
    itemMap["image"]= item.cart_prod_picture;
    itemMap["size"]=item.cart_prod_size;
    itemMap["quantity"]=item.cart_prod_qty;
    itemMap["price"]=item.cart_prod_price;
    mydb.insert("Cart", itemMap);


  }

  static Future<List> GetAllItems() async{
    Database mydatabase= await DaataBaseHelper.getdb();
    List Cart = await mydatabase.rawQuery("Select * FROM Cart");
    return Cart.toList();

  }


  static Future<int> Delete(int id) async{
    Database mydatabase =await DaataBaseHelper.getdb();
    int result=await mydatabase.delete("Cart", where : "id=${id}");
    return result;
  }






}