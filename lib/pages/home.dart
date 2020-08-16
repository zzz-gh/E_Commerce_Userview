import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_app/cons/product.dart';
import 'package:flutter_app/cons/horizontallistview.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Widget _imagecaro = Container(
      height: 180.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('images/m1.jpg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpg'),
          AssetImage('images/w2.jpg'),
          AssetImage('images/w3.jpg'),
          AssetImage('images/c1.jpg'),
        ],
        autoplay: true,
        dotSize: 5.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('Shop app'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('ZPO'),
              accountEmail: Text('example@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person),
                ),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('T'),
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text('T'),
                ),
              ],
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.red),
                title: Text('Home'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.red),
                title: Text('My Account'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.shopping_basket, color: Colors.red),
                title: Text('My Order'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
                title: Text('Shopping Cart'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text('Favourite'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('About'),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Log out'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          _imagecaro,
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              title: Text('Categories'),
            ),
          ),
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListTile(
              title: Text('Recent Products'),
            ),
          ),
          Flexible(
            child: Products(),
          ),
        ],
      ),
    );
  }
}
