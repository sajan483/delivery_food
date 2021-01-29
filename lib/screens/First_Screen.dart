import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Admin_Login_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title(),
          SizedBox(
            height: 100,
          ),
          Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Sign In As Admin'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () {
                  addStringToSF("admin");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminLoginPage()));
                },
              )),
          Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Sign In As User'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () {
                  addStringToSF("user");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminLoginPage()));
                },
              )),
          Container(
              height: 50,
              width: 300,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.orange,
                child: Text('Sign In As Staff'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () {
                  addStringToSF("deliverry boy");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdminLoginPage()));
                },
              ))
        ],
      ),
    );
  }

  addStringToSF(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', value);
  }
}

Widget title() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
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
