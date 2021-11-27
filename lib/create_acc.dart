import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friend_up/verify.dart';

class Create_Acc extends StatefulWidget {
  const Create_Acc({Key? key}) : super(key: key);

  @override
  _Create_AccState createState() => _Create_AccState();
}

class _Create_AccState extends State<Create_Acc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, top: 100),
                    child: Icon(
                      Icons.phone,
                      size: 50,
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('What\'s your phone number'),
              ),
            ]),
          ),
          Expanded(
            flex: 60,
            child: Row(
              children: [],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.all(10),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => verify()));
                    },
                    child: const Icon(
                      Icons.arrow_right,
                      size: 45,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
