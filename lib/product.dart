import 'package:flutter/material.dart';
import 'cart.dart';
import 'models.dart';

class ProductPage extends StatefulWidget {

 
  final brand;
  final shoename;
  final price;
  final image;

  ProductPage({this.brand,this.shoename,this.price,this.image});

  @override
  _ProductPageState createState() => _ProductPageState(brand: brand, shoename: shoename, price: price, image: image);
}

class _ProductPageState extends State<ProductPage> {

  final brand;
  final shoename;
  final price;
  final image;

  _ProductPageState({this.brand,this.shoename,this.price,this.image});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This is the appBar for the product page
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Product Details', style: TextStyle(color: Colors.black)),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
              }),
        ],
      ),

      // This is the body for the product page
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // PRODUCT IMAGE
            Container(
              child: SizedBox(
                height: 275.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  '$image',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),

            // PRODUCT BRAND
            Container(
              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Align(
                child: Text(
                  brand,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            // PRODUCT NAME
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 8),
              child: Align(
                child: Text(
                  shoename,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            // PRODUCT PRICE
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 8),
              child: Align(
                child: Text(
                  '$price',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            // PRODUCT DESCRIPTION
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 15),
              child: Align(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            // ADD TO CART BUTTON
            Container(
              child: SizedBox(
               width: 400.0,
               height: 50.0,
               child: RaisedButton(
                onPressed: () {
                  Shoes cartItem = new Shoes(brand: brand, price: price, imagename: image , name : shoename );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(object: cartItem),));
                },
                color: Colors.black,
                textColor: Colors.white,
                child: Text('ADD TO CART'),
               ),
              ),
          
            ),
          ],
        ),
      ),
    );
  }
}
