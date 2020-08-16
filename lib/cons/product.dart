import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list =[
    {
      'name':'Blazer',
      'picture': 'images/blazer1.jpg',
      'old_price':'100.0',
      'price':'80.0',
    },
    {
      'name':'Blazer',
      'picture': 'images/blazer2.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Dress',
      'picture': 'images/dress1.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Dress',
      'picture': 'images/dress2.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Pant',
      'picture': 'images/pant1.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Pant',
      'picture': 'images/pant2.webp',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Shoe',
      'picture': 'images/shoe1.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Shoe',
      'picture': 'images/shoe2.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Hill',
      'picture': 'images/hill1.png',
      'old_price':'120.0',
      'price':'90.0',
    },
    {
      'name':'Hill',
      'picture': 'images/hill2.jpg',
      'old_price':'120.0',
      'price':'90.0',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder:(BuildContext context,int index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              product_name: product_list[index]['name'],
              product_pricture: product_list[index]['picture'],
              old_price: product_list[index]['old_price'],
              new_price: product_list[index]['price'],
            ),
          );
        },);
  }
}


class Single_prod extends StatelessWidget {
  final product_name;
  final product_pricture;
  final old_price;
  final new_price;

  Single_prod({
    this.product_name,
    this.product_pricture,
    this.old_price,
    this.new_price,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shadowColor: Colors.grey,
      child: Hero(
        tag: product_pricture,
        child: Material(
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute<void>(builder: (context)=>ProductDetails(
                productdetail_name:product_name,
                productdetail_picture: product_pricture,
                productdetail_old_price: old_price,
                productdetail_new_price: new_price,

              )));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(product_name,style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Text('\$$new_price',style: TextStyle(color: Colors.red),),
                  ],
                ),
              ),
              child: Image.asset(product_pricture,fit: BoxFit.contain,),
            ),
          ),
        ),
      ),
    );
  }
}

