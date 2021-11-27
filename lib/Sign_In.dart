import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friend_up/Email.dart';
import 'package:friend_up/Home.dart';
import 'package:friend_up/LogInEmail.dart';
import 'package:friend_up/verify.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  _Sign_InState createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  var loading = false;

  void _logInWithFaceBook() async {
    setState(() {
      loading = true;
    });

    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      var content = '';
      switch (e.code) {
        case 'account-exists-with-different-credential':
          content = 'This account exists already';
          break;
        case 'user-not-found':
          content = 'The user entered was not found';
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Log in with facebook failed'),
                //content: Text(content),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok'))
                ],
              ));
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
               decoration: BoxDecoration(
               image: DecorationImage(
               image: AssetImage("assets/connect2.jpg"),
               fit: BoxFit.cover,
               ),
              ),
              ),
      Column(
        children: [
          Expanded(
            flex: 65,
            child: Row(),
          ),
          Expanded(
            flex: 35,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: Color.fromRGBO(162, 57, 202, 1),
                    onPressed: () async {
                      _logInWithFaceBook();
                    },
                    child: Text("Use Facebook"),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(bottom: 10),
                //   child: FlatButton(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(18.0),
                //     ),
                //     color: Color.fromRGBO(162, 57, 202, 1),
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (context) => verify()));
                //     },
                //     child: Text("Use phone number"),
                //   ),
                // ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Color.fromRGBO(162, 57, 202, 1),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginEmail()));
                  },
                  child: Text("Use Email"),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
    ));
  }
}
