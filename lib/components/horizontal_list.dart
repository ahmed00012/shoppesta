
import 'package:flutter/material.dart';

class Horizontal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
     height:110.0,
//      child: new Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
           category(
             location: 'images/men1.jpg',
             caption: 'Men',
           ),
            category(
              location: 'images/women1.jpg',
              caption: 'Women',
            ),
            category(
              location: 'images/kids1.jpg',
              caption: 'Kids',
            ),




          ],
        ),

    );
  }
}
class category extends StatelessWidget{
  final String location;
  final String caption;
  category(
  {
this.location,
    this.caption,
}
      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: const EdgeInsets.all(6),
    child: InkWell(onTap: (){},
      child: Container(
        width: 80,

    child: ListTile(
      title: CircleAvatar(
        child: Image.asset(location,height:100,width: 120,),

      ),
      subtitle:Container(
        alignment: Alignment.topCenter,
        child: Text(caption , style: new TextStyle(fontSize: 12),)
        ,)
    ),
      ),
    ),
    );
  }

}