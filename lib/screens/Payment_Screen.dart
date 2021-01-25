import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              child: Card(
                margin: EdgeInsets.only(top: 10, right: 5.0, left: 5.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.orange,
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album, size: 70),
                      title: Text('Visa Card',
                          style: TextStyle(color: Colors.white)),
                      subtitle: Text('2356 6785 345 345',
                          style: TextStyle(color: Colors.white)),
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('Edit',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {},
                          ),
                          FlatButton(
                            child: const Text('Delete',
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Card Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Valid Card  Number',
                ),
              ),
            ),
            Container(
                height: 50,
                width: 200,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.orange,
                  child: Text('Buy Now'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.orange)),
                  onPressed: () {},
                ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.payment,color: Colors.orange,),
                title: Text(
                  "Payment",
                )),
                 BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  "Home",
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), title: Text("History"))
          ],
        ));
  }
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
