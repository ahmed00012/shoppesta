
import 'package:flutter/material.dart';
import'package:shoppesta/components/cart_items.dart';
class cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _cart();
  }

}

class _cart extends State<cart>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text("cart"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),

        ],
      ),


      body: new cart_items(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child:ListTile(
              title: new Text("total"),
              subtitle: new Text("\$240"),
            )
            ),
            Expanded(
              child: new MaterialButton(onPressed: (){},
              child: new Text("check out",style: TextStyle(color: Colors.white),),
              color: Colors.red,),

            )
          ],
        ),
      ),

    );
  }

}