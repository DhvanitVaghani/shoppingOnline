
class Item{
  int id;
  String pname;
  String imageurl;
  String price;
  Item({this.id,this.pname,this.imageurl,this.price});
  
   
Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pname': pname,
      'imageurl': imageurl,
      'price':price
    };
}
  
}