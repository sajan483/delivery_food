import 'package:flutter/material.dart';
import 'package:flutter_app/screens/List_Screen.dart';
import 'package:flutter_app/screens/Payment_Screen.dart';

class ProductDetailsPage extends StatefulWidget {
  Prod product;
  ProductDetailsPage({Key key, this.product});
  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Image.network(
            widget.product.imageUrl,
            fit: BoxFit.fill,
          ),
          Text(widget.product.name),
          RaisedButton(
            textColor: Colors.white,
            color: Colors.orange,
            child: Text('Book'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentPage()));
            },
          )
        ],
      )),
    );
  }
}
