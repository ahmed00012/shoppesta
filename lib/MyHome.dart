import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:shoppesta/pages/shoping_cart.dart';

import 'components/horizontal_list.dart';
import 'components/products.dart';
import 'db/product.dart';

class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHome();
  }
}

class _MyHome extends State<MyHome> {


  List<DocumentSnapshot> product_list = <DocumentSnapshot>[];
  List<String> images =  List<String>();

  ProductService _productService = ProductService();

  @override
  initState() {
    _getProducts();

  }
  _getProducts() async {
    List<DocumentSnapshot> data = await _productService.getProducts();
    List<String> images1 =await List<String>();
    for(int i =0 ; i<data.length ; i++){


      images1.add(data[i].data['images'][0].toString());

    }

    setState(() {
      product_list = data;
      images=images1;

    });
    print(data.length);




  }

// _getImages(){
//
//   setState(() {
//
//   });
//    print(images.length);
//
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text("Shopesta"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: null),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> new cart()));
              }
              )
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> new cart()));
              },
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.category),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Favorits"),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About"),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[

         Container(
          height: 200,


          child: new Carousel(
            boxFit: BoxFit.fitWidth,

images:
[    Image.network( images.last),
  Image.network(images[0]),
//  Image.network(images[6]),
//  Image.network(images[9]),
//  Image.network(images[12]),
],



            autoplay: true,

            animationCurve: Curves.fastOutSlowIn,
            animationDuration: Duration(microseconds: 1000),
            dotSize: 3,
            indicatorBgPadding: 5,
          ),

        ),
          new Padding(padding:const EdgeInsets.all(8.0),
          child:  Text("category", style: new TextStyle(fontSize: 18),),),
          Horizontal(),
          new Padding(padding:const EdgeInsets.all(8.0),
            child:  Text("recent products", style: new TextStyle(fontSize: 18),),),
          new Container(
            height: 380,
            child: products(),
          )



        ],
      ),
    );
  }
}
