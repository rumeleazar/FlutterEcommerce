import 'package:flutter/material.dart';

class Cart extends StatefulWidget {

  final object;
  Cart({this.object});

  @override
  _CartState createState() => _CartState(object: object);
}

class _CartState extends State<Cart> {

  var object;

  _CartState({this.object});

  var cart = new List();

  cartSetter() {
    if (object == object) {
      setState(() {
        cart.add(object);
      });
      return cart.map((cart) => cartTemplate(cart)).toList();
    }
    else {
      return Text('There is no items in here');
    }
  }

  Widget cartTemplate(cart) {
      return Card(
          child: ListTile(
          leading: Image.asset('${cart.imagename}',
          height: 100,
          width: 80,
          ),
          title: Text(cart.name ?? ''),
          trailing: Text('${cart.price}' ),
        ),
      );
  }

  

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      // This is the appBar for the categories page
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child:
              Text('Cart', style: TextStyle(color: Colors.black)),
        ),
      ),

      body: Container(
        child: ListView(
          children: [
            // ITEMS ON CART
            Container(
                    height: 155.0,
                    child: ListView(
                      children: cartSetter(),
                      padding: EdgeInsets.all(15),
              ),
            ),
             // CHECKOUT BUTTON
            Container(
              child: SizedBox(
               width: 400.0,
               height: 50.0,
               child: RaisedButton(
                onPressed: () {},
                color: Colors.black,
                textColor: Colors.white,
                child: Text('Checkout'),
               ),
              ),
          
            ),


          ],
        )
      ),
      
    );
  }
}