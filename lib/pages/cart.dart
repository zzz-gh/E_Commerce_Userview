import 'package:flutter/material.dart';
import 'package:flutter_app/cons/cart_detail.dart';
import 'package:flutter_app/pages/home.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          leading: InkWell(
              onTap: (){
                Navigator.of(context).pop(MaterialPageRoute(builder: (context)=>MyApp()));
              },
              child: Icon(Icons.arrow_back)
          ),
          title: Text('Cart'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: (){

              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: CardDetail(),
        bottomNavigationBar: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Text('Total:'),
                  trailing: Text('\$230'),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  child: Text('Check out',style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
