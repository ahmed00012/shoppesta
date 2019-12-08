import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoppesta/components/cart_items.dart';
import 'package:shoppesta/db/CartMethod.dart';
import 'package:shoppesta/db/Users.dart';
import 'package:shoppesta/db/product.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Product_Profile extends StatefulWidget {
  var profile_id;
  final String profile_name;
  List<String> profile_sizes = List<String>();
  final String profile_image1;
  final String profile_image2;
  final String profile_image3;
  final String profile_price;
  final String profile_quantity;
  final String profile_brand;



  Product_Profile(
      {this.profile_id,
      this.profile_name,
      this.profile_image1,
      this.profile_image2,
      this.profile_image3,
      this.profile_sizes,
      this.profile_price,
      this.profile_quantity,
      this.profile_brand,
      });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Product_Profile();
  }
}

class _Product_Profile extends State<Product_Profile> {
  String _currentSize;
  String _currentQty;

  single_item cartItem;

  UserService userService = new UserService();

  setcurrentSize() {
    setState(() {
      _currentSize = widget.profile_sizes[0];
    });
  }

  List<DropdownMenuItem<String>> getSizesDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < widget.profile_sizes.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
              child: Text(" " + widget.profile_sizes[i]),
              value: widget.profile_sizes[i],
            ));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getQtyDown() {
    List<DropdownMenuItem<String>> items = new List();

    setState(() {
      items.insert(0, DropdownMenuItem(child: Text(" 1 "), value: '1'));
      items.insert(1, DropdownMenuItem(child: Text(" 2 "), value: '2'));
      items.insert(2, DropdownMenuItem(child: Text(" 3 "), value: '3'));
    });

    return items;
  }

  _getQty() async {
    setState(() {
      _currentQty = '1';
    });
  }

  changeSelectedQty(String selectedQty) {
    setState(() => _currentQty = selectedQty);
  }

  changeSelectedSize(String selectedSize) {
    setState(() => _currentSize = selectedSize);
  }

  @override
  initState() {
    _getQty();
    setcurrentSize();

  }

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      widget.profile_image1,
      widget.profile_image2,
      widget.profile_image3
    ];

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
              onPressed: null)
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 250,
            child: GridTile(
              child: Container(
                child: CarouselSlider(
                  height: 250.0,
                  items: [
                    Image.network(images[0]),
                    Image.network(images[1]),
                    Image.network(images[2]),
                  ],
                  enableInfiniteScroll: false,
                ),
              ),
              footer: new Container(
                color: Colors.white,
                height: 70,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          widget.profile_name,
                          style: TextStyle(fontSize: 18),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Row(
                          children: <Widget>[
                            Text(
                              "price:  ",
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                            Text(
                              widget.profile_price,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(30)),
                    Row(
                      children: <Widget>[
                        Text(
                          "brand: ",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                        Text(
                          widget.profile_brand,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 15),
              ),
              Text(
                "size: ",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              DropdownButton(
                items: getSizesDropDown(),
                onChanged: changeSelectedSize,
                value: _currentSize,
              ),
              Padding(padding: EdgeInsets.only(right: 50)),
              Text(
                "Qty: ",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              DropdownButton(
                items: getQtyDown(),
                onChanged: changeSelectedQty,
                value: _currentQty,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Buy"),
                      ),
                    ),
                  ],
                ),
              )),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  color: Colors.red,
                  onPressed: () {
                    CartMethod.addUser(new single_item(

                      cart_prod_name: widget.profile_name,
                      cart_prod_picture: widget.profile_image1,
                      cart_prod_size: _currentSize,
                      cart_prod_qty: _currentQty,
                      cart_prod_price: widget.profile_price,
                    ));
                  }),
              new IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {})
            ],
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Text(" similiar products"),
          ),
          Container(
            height: 360,
            child: similiar(),
          )
        ],
      ),
    );
  }
}

class similiar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _similiar();
  }
}

class _similiar extends State<similiar> {
  List<DocumentSnapshot> product_list = <DocumentSnapshot>[];
  ProductService _productService = ProductService();

  @override
  initState() {
    _getProducts();
  }

  _getProducts() async {
    List<DocumentSnapshot> data = await _productService.getProducts();

    setState(() {
      product_list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return similiar1(
            similiar_id: product_list[index].data['id'],
            similiar_name: product_list[index].data['name'],
            similiar_image1: product_list[index].data['images'][0],
            similiar_image2: product_list[index].data['images'][1],
            similiar_image3: product_list[index].data['images'][2],
            similiar_price: product_list[index].data['price'].toString(),
            similiar_sizes: product_list[index].data['sizes'].cast<String>(),
            similiar_quantity: product_list[index].data['quantity'].toString(),
            similiar_brand: product_list[index].data['brand'],
            similiar_category: product_list[index].data['category'],
          );
        });
  }
}

class similiar1 extends StatelessWidget {
  var similiar_id;
  final String similiar_name;
  final String similiar_image1;
  final String similiar_image2;
  final String similiar_image3;
  List<dynamic> similiar_sizes;
  final String similiar_price;
  final String similiar_quantity;
  final String similiar_brand;
  final String similiar_category;

  similiar1(
      {this.similiar_id,
      this.similiar_name,
      this.similiar_image1,
      this.similiar_image2,
      this.similiar_image3,
      this.similiar_sizes,
      this.similiar_price,
      this.similiar_quantity,
      this.similiar_brand,
      this.similiar_category});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Hero(
        tag: similiar_image1,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new Product_Profile(
                      profile_id: similiar_id,
                      profile_name: similiar_name,
                      profile_image1: similiar_image1,
                      profile_image2: similiar_image2,
                      profile_image3: similiar_image3,
                      profile_sizes: similiar_sizes,
                      profile_price: similiar_price,
                      profile_brand: similiar_brand,
//                   profile_old_price: si,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white30,
                child: ListTile(
                  leading: Text(
                    similiar_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  title: Text(
                    "\$$similiar_price",
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w600),
                  ),
//                 subtitle: Text("\$$similiar_old_price",style: TextStyle(color: Colors.black54,
//                     fontWeight: FontWeight.w800,
//                     decoration: TextDecoration.lineThrough),),
                ),
              ),
              child: Image.network(
                similiar_image1,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
