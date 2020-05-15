import 'package:flutter/material.dart';
import 'package:shoppingapp/DatabaseClasses/model/item.dart';
import 'package:shoppingapp/DatabaseClasses/databaseservice.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<List<Item>> items;
  List<Item> item;
  int count = 0;
  @override
  void initState() {
    super.initState();
    items = DataBaseService.getAllItem();
    items.then((value) {
      setState(() {
        this.item = value;
        this.count = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (item != null) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            title: Text('Cart')),
        body: getlist(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            title: Text('Cart')),
        body: Center(child: Text('You not have any item')),
      );
    }
  }

  ListView getlist() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            onTap: () {},
            leading: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(this.item[position].imageurl))),
            ),
            title: Text(this.item[position].pname),
            subtitle: Text(this.item[position].price),
            trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                _delete(context, item[position]);
              },
            ),
          ),
        );
      },
    );
  }

  void _delete(BuildContext context, Item item) async {
    int result = await DataBaseService.deleteitem(item.id);
    if (result != 0) {
      _snackbarshow(context, 'Item deleted Suceesfully');
      // updatelistview();
      Future<List<Item>> items = DataBaseService.getAllItem();
      items.then((value) {
        setState(() {
          this.item = value;
          this.count = value.length;
        });
      });
    }
  }

  void _snackbarshow(BuildContext context, String str) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      content: Text(
        str,
        style: TextStyle(color: Colors.black),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
