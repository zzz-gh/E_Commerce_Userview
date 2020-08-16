import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[

          Category(image_location: 'images/formal.jpg',image_caption: 'Formal'),
          Category(image_location: 'images/shoe.jpg',image_caption: 'Shoe'),
          Category(image_location: 'images/jean.png',image_caption: 'Jean'),
          Category(image_location: 'images/jewley.webp',image_caption: 'Jewellery'),
          Category(image_location: 'images/shirt.png',image_caption: 'Shirt'),
          Category(image_location: 'images/tshirt.jpg',image_caption: 'Skirt'),
          Category(image_location: 'images/dress.webp',image_caption: 'Dress'),



        ],
      ),
    );
  }
}


class Category extends StatelessWidget {
  String image_location = '';
  String image_caption = '';
  Category({this.image_location,this.image_caption});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_location,height: 80.0,width: 100.0,),
            subtitle:  Container(
              child: Text(image_caption,style: TextStyle(fontSize: 7.0),),
            ),
          ),
        ),
      ),
    );
  }
}

