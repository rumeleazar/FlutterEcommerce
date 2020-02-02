import 'package:flutter/material.dart';
import 'models.dart';
import 'product.dart';
import 'cart.dart';

var shoename;
var image;
var price;
var brand;

class CategoriesPage extends StatefulWidget {

  final label;
  CategoriesPage({this.label});

  @override
  _CategoriesPageState createState() => _CategoriesPageState(label);
}

class _CategoriesPageState extends State<CategoriesPage> {

  String label;
  _CategoriesPageState(this.label);

  //  LIST FOR BRANDS LOGOS
  List<Logo> logo = [
    Logo(imagename: 'images/logo/logokobe_logo.png', label: 'kobe'),
    Logo(imagename: 'images/logo/logolebron_logo.png', label: 'lebron'),
    Logo(imagename: 'images/logo/logojordan_logo.png', label: 'jordan'),
    Logo(imagename: 'images/logo/logonike_logo.png', label: 'nike'),
    Logo(imagename: 'images/logo/logoadidas_logo.png', label: 'adidas'),
  ];

  Widget logoName(logo) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 25, 0),
      child: InkWell(
        onTap: () {

        },
        child: Column(
          children: [
            Center(
              child: Text('${logo.label}',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.grey[900],
                fontWeight: FontWeight.bold,
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
          ],
        ),
      ),
    );
  }


  // SHOES GRID VIEW WIDGET

   List<Shoes> jordan = [
    Shoes(
        name: 'Jordan1Breds',
        imagename: 'images/products/Jordan/jordan1breds.jpg',
        price: 10000,
        brand: 'Jordan',
        ),
    Shoes(
        name: 'Jordan1Btoe', imagename: 'images/products/Jordan/jordan1btoe.jpg', price: 10000, brand: 'Jordan'),
    Shoes(
        name: 'Jordan1Chicago',
        imagename: 'images/products/Jordan/jordan1chicago.jpg',
        price: 10000,
        brand: 'Jordan',
        ),
   
  ];

   List<Shoes> kobe = [
    Shoes(
        name: 'Kobe Black',
        imagename: 'images/products/Kobe/KobeBlack.png',
        price: 10000,
        brand: 'Kobe',
        ),
    Shoes(
        name: 'Kobe Venice Beach',
        imagename: 'images/products/Kobe/KobeVeniceBeach.png', 
        price: 10000,
        brand: 'Kobe',
         ),
    Shoes(
        name: 'Kobe WTK',
        imagename: 'images/products/Kobe/KobeWTK.png',
        price: 10000,
        brand: 'Kobe',
         ),

  ];

   List<Shoes> lebron = [
    Shoes(
        name: 'Lebron 11',
        imagename: 'images/products/Lebron/Lebron11.png',
        price: 10000,
        brand: 'Lebron',
        ),
    Shoes(
        name: 'Lebron123', 
        imagename: 'images/products/Lebron/Lebron123.png',
        price: 10000,
        brand: 'Lebron',
        ),
    Shoes(
        name: 'LebronSoldier11',
        imagename: 'images/products/Lebron/LebronSoldier11.png',
        price: 10000,
        brand: 'Lebron',
        ),

  ];


  // METHOD FOR GETTING THE LIST NAME FOR GRIDVIEW
  labelGetter(var label) {

    if (label == 'kobe') {
      return kobe.map((label) => featuredItemsTemplate(label)).toList();
    }

    if (label == 'lebron') {
      return lebron.map((label) => featuredItemsTemplate(label)).toList();
    }

    if (label == 'jordan') {
      return jordan.map((label) => featuredItemsTemplate(label)).toList();
    }

  }


 

  Widget featuredItemsTemplate(label) {
      return Container(
        decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color:Colors.grey[200].withOpacity(0.1),
          spreadRadius: 0,
            ),
          ]
        ),
        child: Card(
            margin: EdgeInsets.all(3),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(brand : brand, image : image, price: price, shoename: shoename),));
                shoename = label.name;
                image = label.imagename;
                price = label.price;
                brand = label.brand;
              },
              child: Column(children: [
                Center(
                  child: Image.asset(
                    '${label.imagename}',
                    height: 190,
                    width: 190,
                  ),
                ),
              ]),
            ),
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
              Text(label, style: TextStyle(color: Colors.black)),
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
      
    // This is the body for the categories page

    body: Container(
      color: Colors.white,
      child: Column(
        children:[
          // BRAND SLIDER
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 20, 5),
            height: 60.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: logo.map((logo) => logoName(logo)).toList(),
              padding: EdgeInsets.all(5),   
            ),
          ),

          // SPECIFIC PRODUCT BRAND GRID VIEW
          Expanded(
            child: GridView.count(
              physics: new NeverScrollableScrollPhysics(),
                primary: false,
                  padding: EdgeInsets.all(1),
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: labelGetter(label)

            ),
          ),
      ]
      ),
    ),
    );
  }
}
      