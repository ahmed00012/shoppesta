import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoppesta/db/CartMethod.dart';
import 'package:shoppesta/db/Users.dart';
import 'package:shoppesta/db/product.dart';

class cart_items extends StatefulWidget {
  @override
  _cart_itemsState createState() => _cart_itemsState();
}

class _cart_itemsState extends State<cart_items> {


  List Carts = new List();
  void refresh() {
    CartMethod.GetAllItems().then((vals) {
      setState(() {
        Carts= vals;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();
  }

@override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount:Carts.length,

      itemBuilder: (context, index) {

        return single_item(
          cart_prod_id: index,
          cart_prod_name: Carts[index]['product'],
          cart_prod_picture: Carts[index]['image'],
          cart_prod_price: Carts[index]['price'],
          cart_prod_qty:Carts[index]['quantity'] ,
          cart_prod_size: Carts[index]['size'],

        );
      },
    );
  }
}

  class single_item extends StatefulWidget {
  final cart_prod_id;
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_qty;
  single_item({
    this.cart_prod_id,
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_qty,
  });

  @override
  _single_itemState createState() => _single_itemState();
}

class _single_itemState extends State<single_item> {

  List Carts = new List();
  void refresh() {
    CartMethod.GetAllItems().then((vals) {
      setState(() {
        Carts= vals;
        print(Carts.first.toString());
      });

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refresh();

  }

  @override
  Widget build(BuildContext context) {
    return
       Row(
         children: <Widget>[
           Image.network(widget.cart_prod_picture,width: 120, height:  90,),
            Container(
              height: 100,
              width:MediaQuery.of(context).size.width * 0.65,
              child: Card(
                child: ListTile(

                  //  leading:
                  title: new Text(widget.cart_prod_name),

                  subtitle: new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text("size:",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                widget.cart_prod_size,
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 8, 8,8),
                              child: Text("quantity:",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                widget.cart_prod_qty,
                                style: TextStyle(color: Colors.red , fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        new Container(
//              padding: EdgeInsets.all(6),
                          alignment: Alignment.topLeft,
                          child: new Text(
                            "\$${widget.cart_prod_price.toString()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.red
                            ),
                          ),
                        ),

                      ],
                    ),

                    IconButton(onPressed: (){
                      CartMethod.Delete(widget.cart_prod_id);
                      refresh();
                    },
                      icon: Icon(Icons.delete,size: 20,color: Colors.red,),)
                  ],)

//      trailing: FittedBox(fit: BoxFit.fill,
//      child: Column(
//        children: <Widget>[
//          IconButton(icon: Icon(Icons.arrow_drop_up), alignment: Alignment.topCenter,iconSize: 40,onPressed: null),
//          Text(widget.cart_prod_qty.toString(),style: TextStyle(fontSize: 16),),
//          IconButton(icon: Icon(Icons.arrow_drop_down),alignment: Alignment.bottomCenter,iconSize: 40, onPressed: null),
//        ],
//      ),)


                ),

              ),
            )
         ],
       );



  }
}
