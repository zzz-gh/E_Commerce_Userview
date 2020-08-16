import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatelessWidget {
  var card_list = [
    {
      'name':'Blazer',
      'picture': 'images/blazer1.jpg',
      'color':'Red',
      'quantity':1,
      'size': 'M',
      'price':80.0,
    },
    {
      'name':'Blazer',
      'picture': 'images/blazer2.jpg',
      'color':'Green',
      'quantity': 1,
      'size': '7',
      'price':90.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: card_list.length,
      itemBuilder: (context,index){
        return Single_Cart(
          product_cart_name: card_list[index]['name'],
          product_cart_pricture: card_list[index]['picture'],
          product_cart_color: card_list[index]['color'],
          product_cart_qty: card_list[index]['quantity'],
          product_cart_size: card_list[index]['size'],
          product_cart_price: card_list[index]['price'],
        );
      },
        );
  }
}

class Single_Cart extends StatelessWidget {
  final product_cart_name;
  final product_cart_pricture;
  final product_cart_color;
  final product_cart_qty;
  final product_cart_size;
  final product_cart_price;

  Single_Cart({
    this.product_cart_name,
    this.product_cart_pricture,
    this.product_cart_color,
    this.product_cart_qty,
    this.product_cart_size,
    this.product_cart_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      child: ListTile(
        leading: Image.asset(product_cart_pricture,height: 80.0,width: 80.0,fit: BoxFit.contain,),
        title: Text(product_cart_name,style: TextStyle(fontWeight: FontWeight.bold),),

        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Size:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product_cart_size,style: TextStyle(color: Colors.red),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 8.0, 8.0, 8.0),
                  child: Text('Color:'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product_cart_color,style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text('\$$product_cart_price',style: TextStyle(color: Colors.red,fontSize: 18.0,fontWeight: FontWeight.bold),),
            )
          ],
        ),
        trailing: Column    (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 11.0, 0.0, 0.0),
              child: Text('1'),
            ),
            Expanded(child: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){},)),
          ],
        ),
      ),
    );
  }
}



