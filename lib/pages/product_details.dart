import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final productdetail_name;
  final productdetail_picture;
  final productdetail_old_price;
  final productdetail_new_price;
  ProductDetails({
    this.productdetail_name,
    this.productdetail_picture,
    this.productdetail_old_price,
    this.productdetail_new_price,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
          title: Text('Shop app'),
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
        body:ListView(
          children: <Widget>[
            Container(
              height: 250,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.productdetail_picture),
                ),
                footer: Container(
                  height: 45.0,
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      widget.productdetail_name,style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text('\$${widget.productdetail_old_price}',
                              style: TextStyle(decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              ),
                            ),
                        ),
                        Expanded(
                          child: Text('\$${widget.productdetail_new_price}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context,builder:(context){
                        return AlertDialog(
                          title: Text('Size'),
                          content: Text('Choose Size'),
                          actions: <Widget>[
                            MaterialButton
                              (onPressed: (){
                                Navigator.of(context).pop(context);
                            },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      }, );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Size',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context,builder:(context){
                        return AlertDialog(
                          title: Text('Color'),
                          content: Text('Choose Color'),
                          actions: <Widget>[
                            MaterialButton
                              (onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      }, );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Color',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context,builder:(context){
                        return AlertDialog(
                          title: Text('Qty'),
                          content: Text('Choose Qty'),
                          actions: <Widget>[
                            MaterialButton
                              (onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      }, );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Qty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text('Buy Now'),
                  ),
                ),
                Container(
                  child: IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red,),onPressed: (){},),
                ),
                Container(
                  child: IconButton(icon: Icon(Icons.favorite_border,color: Colors.red,),onPressed: (){},),
                ),

              ],
            ),
            Divider(),
            ListTile(
              title: Text(
                'Product Details', style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 16.0,
                decoration: TextDecoration.underline,
              ),
              ),
              subtitle: Text(
                'FOLD-ABLE HAT & MULTIPLE-POCKET HEATED JACKETS-- Equipped with quality and professional water resistance soft shell material with excellent breath-ability. DEWBU heated jackets also has good tensile property, scratch resistance and wind resistance and keeps you warm when working outside all day even in the cold snowy day. The heated jackets give your more space which is equipped with 2 large zipper chest pockets, 2 back pockets; 2 small left arm pockets and 1 small pocket on the left sleeve. '
              ),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text('Product Name:',style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(widget.productdetail_name),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text('Product Brand:',style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Brand X'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding:const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: Text('Product Condition:',style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'NEW'
                  ),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300.0,
                child: SimilarProducts(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder:(BuildContext context,int index){
        return Similar_prod(
          product_name: product_list[index]['name'],
          product_pricture: product_list[index]['picture'],
          old_price: product_list[index]['old_price'],
          new_price: product_list[index]['price'],
        );
      },);
  }
}

class Similar_prod extends StatelessWidget {
  final product_name;
  final product_pricture;
  final old_price;
  final new_price;

  Similar_prod({
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




