import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friend_up/main.dart';

class settingScreen extends StatefulWidget {
  const settingScreen({Key? key}) : super(key: key);

  @override
  _settingScreenState createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("AmiTA"),
    automaticallyImplyLeading: false,
        ),
      body: Center(
        child: Column(

          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 250, top: 10),
              child: FlatButton(

                onPressed: () => {
                  _signOut(),
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: 'AmiTA',)))
                },

                color: Colors.orange,
                padding: EdgeInsets.all(10.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Icon(Icons.arrow_back),
                    Text("Sign out"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
