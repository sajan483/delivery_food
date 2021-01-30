import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter_app/Models/Product.dart';
import 'package:flutter_app/screens/Add_Product_Screen.dart';
import 'package:flutter_app/screens/Admin_Login_Screen.dart';
import 'package:flutter_app/screens/First_Screen.dart';
import 'package:flutter_app/screens/Payment_Screen.dart';
import 'package:flutter_app/screens/Product_Dettails_Screen.dart';
import 'package:flutter_app/Service/Api_Service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<ProductList> productList = new List();
  String user;

  @override
  void initState() {
    //fetchProduct();
    getStringValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                //color: Themes.color,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30, bottom: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://cdn2.iconfinder.com/data/icons/website-icons/512/User_Avatar-512.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text(
                        'Name: user',
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                      Text(
                        'Email: user@gmail.com',
                        style: TextStyle(color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Setting',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: null,
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  print('User Signed Out');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstPage()));
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(
                user: user,
              ),
              SizedBox(height: 45),
            ],
          ),
        )),
        floatingActionButton: (user == "admin")
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddProductPage()));
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.orange,
              )
            : null,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.orange,
                ),
                title: Text("Home", style: TextStyle(fontSize: 12))),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                title: Text("History", style: TextStyle(fontSize: 12)))
          ],
        ));
  }

  fetchProduct() {
    ProductService.fetchProduct().then((value) {
      if (value != null) {
        productList.add(value);
      }
    });
    print(productList);
    
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user = prefs.getString('user');
    if (user != null) {
      setState(() {});
    }
  }
}

class FirstHalf extends StatelessWidget {
  final String user;
  const FirstHalf({
    this.user,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 20),
          title(),
          SizedBox(height: 10),
          searchBar(),
          SizedBox(height: 10),
          categories(),
          SizedBox(height: 10),
          products()
        ],
      ),
    );
  }

  Widget products() {
    List wonders = [
      Prod(
          imageUrl:
              "https://media.istockphoto.com/photos/mouthwatering-delicious-homemade-burger-used-to-chop-beef-on-the-picture-id907077304?k=6&m=907077304&s=612x612&w=0&h=N0o_NtwciuBRFPg56dD8vBYiTxJvgJBRz8Z7sRIfd38=",
          name: "Burgger",
          price: "RS:120"),
      Prod(
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRgDq2lpftUsHdJuwUny9AfbFEe7mV_sragQ&usqp=CAU",
          name: "Vanilla Cream",
          price: "RS:100"),
      Prod(
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpEyZRGVrTEKG0SGxCGiuVbJwRdR5ia6Uwlg&usqp=CAU",
          name: "Coffee",
          price: "RS:50"),
      Prod(
          imageUrl:
              "https://media.istockphoto.com/photos/mouthwatering-delicious-homemade-burger-used-to-chop-beef-on-the-picture-id907077304?k=6&m=907077304&s=612x612&w=0&h=N0o_NtwciuBRFPg56dD8vBYiTxJvgJBRz8Z7sRIfd38=",
          name: "Burgger",
          price: "RS:120"),
      Prod(
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoHXZh9ifxtm_uJ9WZpb7aBjzPW3bytkMWag&usqp=CAU",
          name: "Vanilla Cream",
          price: "RS:100"),
      Prod(
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpEyZRGVrTEKG0SGxCGiuVbJwRdR5ia6Uwlg&usqp=CAU",
          name: "Brue Coffee",
          price: "RS:50"),
    ];

    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: wonders.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                if (user == "user") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentPage()));
                }
              },
              child: Container(
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        child: FittedBox(
                          child: Image.network(wonders[index].imageUrl),
                          fit: BoxFit.fill,
                        ),
                        padding: EdgeInsets.all(10),
                      ),
                      Padding(
                          child: Text(
                            wonders[index].name,
                            style: TextStyle(fontSize: 12),
                          ),
                          padding: EdgeInsets.only(left: 10)),
                      Padding(
                          child: Text(
                            wonders[index].price,
                            style: TextStyle(fontSize: 12),
                          ),
                          padding: EdgeInsets.all(10))
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

Widget categoriess() {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        CategoryListItem(
          categoryIcon: Icons.fastfood,
          categoryName: "Burgers",
          availability: 2,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.fastfood,
          categoryName: "Pizza",
          availability: 1,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.fastfood,
          categoryName: "Samosa",
          availability: 1,
          selected: false,
        ),
        CategoryListItem(
          categoryIcon: Icons.fastfood,
          categoryName: "Idli",
          availability: 1,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.fastfood,
          categoryName: "Dosa",
          availability: 1,
          selected: true,
        ),
        CategoryListItem(
          categoryIcon: Icons.fastfood,
          categoryName: "Rolls",
          availability: 1,
          selected: true,
        ),
      ],
    ),
  );
}

Widget categories() {
  return Container(
    height: 50,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Burgger",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Pizza",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Ice Cream",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Cake",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Cold Coffee",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Brue",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Text(
            "Desert",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.hotel,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0,
                    right: leftAligned ? 0 : 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\₹$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                                children: [
                                  TextSpan(text: "by "),
                                  TextSpan(
                                      text: hotel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}

Widget listCard() {
  return Container(
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text('Card title 1'),
            subtitle: Text(
              'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(image: AssetImage('assets/burger.jpeg')),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 1'),
              ),
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 2'),
              ),
            ],
          ),
          Image.asset('assets/card-sample-image.jpg'),
          Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    ),
  );
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.orange,
        border: Border.all(
            color: selected ? Colors.transparent : Colors.grey[200],
            width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100],
            blurRadius: 15,
            offset: Offset(15, 0),
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: selected ? Colors.transparent : Colors.grey[200],
                    width: 1.5)),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categoryName,
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 15),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(width: 20),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Search....",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
      ),
      SizedBox(width: 20),
    ],
  );
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 45),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Food",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          Text(
            "Cart",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 30,
            ),
          ),
        ],
      )
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
        ],
      ),
    );
  }
}

class Prod {
  String imageUrl;
  String name;
  String price;
  Prod({this.imageUrl, this.name, this.price});
}
