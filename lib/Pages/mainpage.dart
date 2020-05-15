import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/DatabaseClasses/databaseservice.dart';
import 'package:shoppingapp/DatabaseClasses/model/item.dart';
import 'cart.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Item item;
  GlobalKey<ScaffoldState> scaffoldState;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      key: scaffoldState,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(),
                    ));
              }),
        ],
        title: Text('Online Shopping'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SafeArea(
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 650,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.white,
                    child: Text(
                      'Top deals in speakers',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: GridView.count(
                      primary: false,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      shrinkWrap: true,
                      children: <Widget>[
                        _getcard(
                            context,
                            'JBL Flip 3  Bluetooth Speaker(Black)',
                            'https://images-eu.ssl-images-amazon.com/images/I/41dTPHU90DL._AC_SX184_.jpg',
                            '₹4,399'),
                        _getcard(
                            context,
                            'boAt Stone 1000 Portable Wireless Speaker',
                            'https://images-eu.ssl-images-amazon.com/images/I/51CI0HFZi+L._AC_SX184_.jpg',
                            '₹2,999'),
                        _getcard(
                            context,
                            'Infinity (JBL) Fuze 100 Wireless Speaker ',
                            'https://images-eu.ssl-images-amazon.com/images/I/51UH57Cs5hL._AC_SX184_.jpg',
                            '₹1,299'),
                        _getcard(
                            context,
                            'Sony SA-D40 4.1 Channel Multimedia Speaker System with Bluetooth',
                            'https://images-na.ssl-images-amazon.com/images/I/61EW1LZ2NHL._SX355_.jpg',
                            '₹7,999'),
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                height: 650,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.white,
                    child: Text(
                      'Top deals on Tablates',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: GridView.count(
                      primary: false,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      shrinkWrap: true,
                      children: <Widget>[
                        _getcard(
                            context,
                            'Apple iPad (10.2-inch, Wi-Fi, 32GB)',
                            'https://images-eu.ssl-images-amazon.com/images/I/41ZVE4X+z8L._AC_US160_FMwebp_QL70_.jpg',
                            '₹29,900'),
                        _getcard(
                            context,
                            'Samsung Galaxy Tab A 10.1 (10.1 inch, 32GB, Wi-Fi), Black',
                            'https://images-eu.ssl-images-amazon.com/images/I/41jhKmQGdlL._AC_US160_FMwebp_QL70_.jpg',
                            '₹14,999'),
                        _getcard(
                            context,
                            'Lenovo Tab M10 HD (2GB, 32GB, WiFi) Slate Black ',
                            'https://images-eu.ssl-images-amazon.com/images/I/41XdmiswAvL._AC_US160_FMwebp_QL70_.jpg',
                            '₹10,999'),
                        _getcard(
                            context,
                            'Samsung Galaxy Tab A 8.0 (Black, 2GB RAM, 32GB Storage) WiFi + 4G',
                            'https://images-eu.ssl-images-amazon.com/images/I/31Xf6c1siBL._AC_US160_FMwebp_QL70_.jpg',
                            '₹11,999'),
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                height: 650,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.white,
                    child: Text(
                      'Top deals in Laptops',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: GridView.count(
                      primary: false,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      shrinkWrap: true,
                      children: <Widget>[
                        _getcard(
                            context,
                            'HP 14 7th Gen Intel Core i3 Processor 14-inch Thin and Light Laptop (8GB/256GB SSD/Windows 10 Home/MS Office/Jet Black/1.43 kg), 14q-cs0023TU',
                            'https://m.media-amazon.com/images/I/71-wF9anccL._AC_UY218_.jpg',
                            '₹32,940'),
                        _getcard(
                            context,
                            'Lenovo Ideapad S145 AMD A6-9225 15.6 inch HD Thin and Light Laptop (4GB/1TB/Windows 10/Grey/1.85Kg), 81N30063IN',
                            'https://m.media-amazon.com/images/I/81EoCoV-8tL._AC_UY218_.jpg',
                            '₹19,479'),
                        _getcard(
                            context,
                            'Dell Inspiron 3583 15.6-inch FHD Laptop (8th Gen Core i5-8265U/8GB/1TB/Window 10 + MS Office/2 GB AMD Graphics/Silver) ',
                            'https://m.media-amazon.com/images/I/51y58-Y75BL._AC_UY218_.jpg',
                            '₹45,990'),
                        _getcard(
                            context,
                            'HP 14-inch Laptop (9th Gen A4-9125/4GB/1TB HDD/Win 10/MS Office 2019/AMD Radeon R3 Graphics), 14-cm0123au',
                            'https://m.media-amazon.com/images/I/813r7wcmwNL._AC_UY218_.jpg',
                            '₹20,351'),
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                height: 650,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.white,
                    child: Text(
                      'Top deals in Printers',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: GridView.count(
                      primary: false,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      shrinkWrap: true,
                      children: <Widget>[
                        _getcard(
                            context,
                            'HP DeskJet 2131 Inkjet Colour Printer (Print, Copy, Scan)',
                            'https://m.media-amazon.com/images/I/61d78mD4zSL._AC_UY218_.jpg',
                            '₹4,399'),
                        _getcard(
                            context,
                            'HP DeskJet 3835 Advantage Wireless Colour Printer (Black)',
                            'https://m.media-amazon.com/images/I/61pQjxytKML._AC_UY218_.jpg',
                            '₹2,999'),
                        _getcard(
                            context,
                            'Epson EcoTank L3150 Wi-Fi Ink Tank Printer (Black)',
                            'https://m.media-amazon.com/images/I/51VC5qV7cQL._AC_UY218_.jpg',
                            '₹12,699'),
                        _getcard(
                            context,
                            'HP Deskjet 2621 printer (Works with Alexa and Google Assistant)',
                            'https://m.media-amazon.com/images/I/61t+9LW7OGL._AC_UY218_.jpg',
                            '₹4,149'),
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                height: 650,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.white,
                    child: Text(
                      'Top deals in Routers',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    child: GridView.count(
                      primary: false,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      shrinkWrap: true,
                      children: <Widget>[
                        _getcard(
                            context,
                            'D-Link DIR-615 Wireless-N300 Router',
                            'https://images-eu.ssl-images-amazon.com/images/I/31mbv+6ZDRL._AC_US160_FMwebp_QL70_.jpg',
                            '₹1,099'),
                        _getcard(
                            context,
                            'Tenda N301 Wireless-N300 Router',
                            'https://images-eu.ssl-images-amazon.com/images/I/31mbv+6ZDRL._AC_US160_FMwebp_QL70_.jpg',
                            '₹950'),
                        _getcard(
                            context,
                            'Tenda F3 300Mbps Wireless Router ',
                            'https://images-eu.ssl-images-amazon.com/images/I/31MV8c+qr9L._AC_US160_FMwebp_QL70_.jpg',
                            '₹1,032'),
                        _getcard(
                            context,
                            'Netgear WNR614 N300 Wi-Fi Router',
                            'https://images-eu.ssl-images-amazon.com/images/I/41HnwDILBGL._AC_US160_FMwebp_QL70_.jpg',
                            '₹1,370'),
                      ],
                    ),
                  )
                ]),
              ),
              Container(
                height: 650,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Wrap(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    color: Colors.white,
                    child: Text(
                      'Top deals in Mouses',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  Container(
                    color: Colors.black38,
                    child: GridView.count(
                      primary: false,
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.5,
                      mainAxisSpacing: 1.5,
                      shrinkWrap: true,
                      children: <Widget>[
                        _getcard(
                            context,
                            'Dell Ms116 275-BBCB Optical Mouse',
                            'https://m.media-amazon.com/images/I/81VXoI0y+kL._AC_UY218_.jpg',
                            '₹219'),
                        _getcard(
                            context,
                            'HP X1000 Wired Mouse (Black/Grey)',
                            'https://m.media-amazon.com/images/I/61mucoT+ifL._AC_UY218_.jpg',
                            '₹280'),
                        _getcard(
                            context,
                            'Dell MS116 1000DPI USB Wired Optical Mouse',
                            'https://m.media-amazon.com/images/I/51kdFjyPRAL._AC_UY218_.jpg',
                            '₹352'),
                        _getcard(
                            context,
                            'Logitech B170 Wireless Mouse (Black)',
                            'https://m.media-amazon.com/images/I/61sskFEsc0L._AC_UY218_.jpg',
                            '₹619'),
                      ],
                    ),
                  )
                ]),
              ),
            ])),
      ),
    );
  }

  Widget _getcard(
      BuildContext context, String productname, String im, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      height: 720,
      width: 180,
      margin: EdgeInsets.all(2),
      child: Wrap(
          runAlignment: WrapAlignment.center,
          runSpacing: 10,
          children: <Widget>[
            Image.network(
              im,
              fit: BoxFit.fill,
              height: 130,
              width: 180,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                productname,
                style: TextStyle(color: Colors.black, fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                price,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 12),
                child: FlatButton(
                    shape: Border.all(),
                    onPressed: () {
                      _save(context, productname, im, price);
                    },
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(color: Colors.black),
                    )))
          ]),
    );
  }

  void _save(
      BuildContext context, String iname, String iimage, String iprize) async {
    int result;
    item = Item(pname: iname, imageurl: iimage, price: iprize);
    print(item.pname);
    result = await DataBaseService.additem(item);
    print(result);
    if (result != 0) {
      // scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text('Added To Cart')));
      AlertDialog alertDialog = AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Added to Cart"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
      print(result);
    } else {
      // scaffoldState.currentState.showSnackBar(new SnackBar(content: new Text('Added To Cart')));}
      AlertDialog alertDialog = AlertDialog(
        backgroundColor: Colors.white,
        title: Text("Failed! Added to Cart"),
      );
      showDialog(context: context, builder: (_) => alertDialog);
      print(result);
    }
  }
}
