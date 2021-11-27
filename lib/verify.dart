import 'package:flutter/material.dart';
import 'package:friend_up/Home.dart';

class verify extends StatefulWidget {
  const verify({Key? key}) : super(key: key);

  @override
  _verifyState createState() => _verifyState();
}

class _verifyState extends State<verify> {
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
                    child: Icon(Icons.check_circle_outline_outlined,
                      size: 50,))
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
                children:[
                  Container(
                    margin: EdgeInsets.only(left:20),
                    child: Text(
                        'Enter your vertification Code'
                    ),
                  ),
                ]
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Sent to (999) 999 9999',
                    style: TextStyle(
                      color: Colors.grey.withOpacity(1),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [

              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                    Text(
                      'Didn\'t get a code?'
                    )
                ],
              ),
            ),
          ),

          Expanded(
            flex: 50,
            child: Row(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: 300, right: 10),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const Icon(Icons.arrow_right, size: 45,),
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
