import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friend_up/Home.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {

  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Expanded(
            flex: 20,
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Column(
              children: [
                Container(
                  margin:  EdgeInsets.only(left: 35, right: 35),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email"
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 35, right: 35, top: 20),
                  child: TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password"
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      print(emailController.text);
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passController.text)
                          .then((value){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage())
                        );
                        print("Succesful");
                      }).catchError((error){
                        print(error.toString());
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomePage()),
                      // );
                    },
                    color: Color.fromRGBO(162, 57, 202, 1),
                    child: Text("Login"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [

              ],
            ),
          )
        ],
      ),
    );
  }
}