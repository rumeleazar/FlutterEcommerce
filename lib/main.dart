import 'package:flutter/material.dart';
import 'models.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'product.dart';
import 'brands.dart';
import 'cart.dart';

var label;
var shoename;
var image;
var price;
var brand;

void main() {
  runApp(MaterialApp(
    title: 'This is my first app',
    routes: {
      '/': (context) => ShoesApp(),
      '/product': (context) => ProductPage(brand : brand, image : image, price: price, shoename: shoename),
      '/categories': (context) => CategoriesPage(label: label),

    },
  ));
}

class ShoesApp extends StatefulWidget {
  @override
  _ShoesAppState createState() => _ShoesAppState();
}

class _ShoesAppState extends State<ShoesApp> {

   // WIDGET FOR CAROUSEL PICTURES

   // LIST FOR SHOES PRODUCTS
  List<Shoes> shoes = [
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

  Widget showcaseTemplate(shoes) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              '${shoes.imagename}',
              height: 220,
              width: 330,
            ),
          ),
        ],
      ),
    );
  }

   // WIDGET FOR HORIZONTAL LIST LOGOS


    // LIST FOR BRANDS LOGOS
  List<Logo> logo = [
    Logo(imagename: 'images/logo/logokobe_logo.png', label: 'kobe'),
    Logo(imagename: 'images/logo/logolebron_logo.png', label: 'lebron'),
    Logo(imagename: 'images/logo/logojordan_logo.png', label: 'jordan'),
    Logo(imagename: 'images/logo/logonike_logo.png', label: 'nike'),
    Logo(imagename: 'images/logo/logoadidas_logo.png', label: 'adidas'),
  ];


  Widget logoTemplate(logo) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 0, 25, 0),
      child: InkWell(
        onTap: () {
          label = logo.label;
          Navigator.pushNamed(context, '/categories');
  
        },
        child: Column(
          children: [
            Center(
              child: Image.asset(
                '${logo.imagename}',
                height: 85,
                width: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '${logo.label}',
              ),
            ),
          ],
        ),
      ),
    );
  }

   //WIDGET FOR CARD IMAGES ON FEATURED ITEMS

  Widget featuredItemsTemplate(shoes) {
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
                shoename = shoes.name;
                price = shoes.price;
                image = shoes.imagename;
                brand = shoes.brand;
                Navigator.pushNamed(context, '/product');
              },
              child: Column(children: [
                Center(
                  child: Image.asset(
                    '${shoes.imagename}',
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
      // This is the AppBar Section
      drawer: new Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('This is the drawer header'),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home'),
                leading: IconButton(
                  icon: Icon(Icons.home, color: Colors.black, size: 30.0),
                  onPressed: () {},
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Account'),
                leading: IconButton(
                  icon: Icon(Icons.account_circle,
                      color: Colors.black, size: 30.0),
                  onPressed: () {},
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: IconButton(
                  icon: Icon(Icons.shopping_basket,
                      color: Colors.black, size: 30.0),
                  onPressed: () {},
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Cart'),
                leading: IconButton(
                  icon: Icon(Icons.shopping_cart,
                      color: Colors.black, size: 30.0),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Center(
          child:
              Text('Home Page', style: TextStyle(color: Colors.black)),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(object:''),));
              }
          ),
        ],
      ),

      // This is where the body starts
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height*2,
              child: Column(
                children: [
                  // THIS IS THE IMAGE CAROUSEL
                  SizedBox(
                      height: 300.0,
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        images: [
                          ExactAssetImage('images/carousel/showcaseAdidas.jpg'),
                          ExactAssetImage('images/carousel/showcaseJordan.jpg'),
                          ExactAssetImage('images/carousel/showcaseKobe.jpg'),
                          ExactAssetImage('images/carousel/showcaseNike.jpg'),
                        ],
                      )),
                  // THIS IS CATEGORIES TEXT    
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text('Categories', textAlign: TextAlign.left),
                      padding: EdgeInsets.all(10),
                    ),
                  ),

                  // THIS IS THE BRANDS LIST
                  Container(
                    height: 155.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: logo.map((logo) => logoTemplate(logo)).toList(),
                      padding: EdgeInsets.all(15),
                    ),
                  ),

                  // THIS IS FEATURED ITEMS TEXT
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text('Featured Items', textAlign: TextAlign.left),
                      padding: EdgeInsets.all(10),
                    ),
                  ),

                  // THIS IS THE FEATURED ITEMS GRID VIEW
                  Expanded(
                    child: GridView.count(
                      physics: new NeverScrollableScrollPhysics(),
                      primary: false,
                      padding: EdgeInsets.all(1),
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      crossAxisCount: 2,
                      children: shoes
                          .map((shoe) => featuredItemsTemplate(shoe))
                          .toList(),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

