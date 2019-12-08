import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shoppesta/db/product.dart';
import 'package:shoppesta/pages/product_profile.dart';

class products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _products();
  }
}

class _products extends State<products> {
  List<DocumentSnapshot> product_list = <DocumentSnapshot>[];
  ProductService _productService = ProductService();

  @override
  initState() {
    _getProducts();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return product(
            id: product_list[index].data['id'],
            name: product_list[index].data['name'],
            image1: product_list[index].data['images'][0],
            image2: product_list[index].data['images'][1],
            image3: product_list[index].data['images'][2],
            sizes: product_list[index].data['sizes'].cast<String>(),
            price: product_list[index].data['price'].toString(),
            quantity: product_list[index].data['quantity'].toString(),
            //product_list[index].data['quantity'].toString(),
            brand: product_list[index].data['brand'],
            category: product_list[index].data['category'],
          );

        });
  }

  _getProducts() async {
    List<DocumentSnapshot> data = await _productService.getProducts();

    setState(() {
      product_list = data;
    });
  }
}

class product extends StatelessWidget {
  var id;
  final String name;
  final String image1;
  final String image2;
  final String image3;
  final String price;
  List<dynamic> sizes;
  final String quantity;
  final String brand;
  final String category;
  product({
    this.id,
    this.name,
    this.image1,
    this.image2,
    this.image3,
    this.sizes,
    this.price,
    this.quantity,
    this.brand,
    this.category,

  });
  @override
  Widget build(BuildContext context) {




    // TODO: implement build
    return Card(
      child: Hero(
        tag: image1,
        child: Material(
          child: InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=>new Product_Profile
                  (
              profile_id: id,
              profile_name: name,
              profile_image1: image1,
              profile_image2: image2,
              profile_image3: image3,
              profile_sizes: sizes,
              profile_brand: brand,
              profile_price: price,

            )
            )
            ),
            child: GridTile(footer: Container(
              color: Colors.white30,
              child: ListTile(
                leading: Text(name , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),
                ),
                title: Text("\$$price", style: TextStyle(color: Colors.black87 , fontWeight: FontWeight.w600),),
//                subtitle: Text("\$$old_price",style: TextStyle(color: Colors.black54,
//                    fontWeight: FontWeight.w800,
//                    decoration: TextDecoration.lineThrough),),
              ),
            ),
              child: Image.network(image1,fit: BoxFit.cover  ,),
            ),
          )
          ,
        ),
      ),
    );
  }
}
