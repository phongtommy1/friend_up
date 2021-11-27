import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'Content.dart';
import 'package:uuid/uuid.dart';


class swipeScreen extends StatefulWidget {
  const swipeScreen({Key? key}) : super(key: key);

  @override
  _swipeScreenState createState() => _swipeScreenState();
}

// List<String> getStringElement() {
//   var item = List<String>.generate((1000), (index) => "Item$index");
//   return item;
// }
//
// Widget<String>  getListElements() {
//   var item = getStringElement();
// }
class _swipeScreenState extends State<swipeScreen> {
  final DatabaseReference _context = FirebaseDatabase.instance.reference().child("context");
  final dbRef = FirebaseDatabase.instance.reference().child("context").orderByChild('text');
  final dbRefLike = FirebaseDatabase.instance.reference().child("context").orderByChild('like');
  final dbRefDislike = FirebaseDatabase.instance.reference().child("context").orderByChild('dislike');
  final dbRefUUID = FirebaseDatabase.instance.reference().child("context").orderByChild('uuid');


  List<String> _names = [];
  List<int> _likes = [];
  List<int> _dislike = [];
  List<String> _uuid = [];

  @override
  void initState() {
    super.initState();
    dbRef.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        _names.add(values["text"]);

      });
    });
    dbRefLike.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        _likes.add(values["like"]);
      });
    });
    dbRefDislike.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        _dislike.add(values["dislike"]);
      });
    });
    dbRefUUID.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        _uuid.add(values["uuid"]);
      });
    });
  }

  TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('AmiTA'),
            content: TextField(
              onChanged: (value) {
                setState(() {

                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "What's on your mind?"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                  _textFieldController.clear();
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    String contentid = Uuid().v4();
                    final content = Content(text: _textFieldController.text, dislike: 0, like: 0, uuid: contentid);
                    _context.child(contentid).set(content.toJson());
                    _names.add(content.text);
                    _likes.add(content.like);
                    _dislike.add(content.dislike);
                    _uuid.add(content.uuid);
                    _textFieldController.clear();
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }


  // List<SwipeItem> _swipeItems = <SwipeItem>[];
  // late MatchEngine _matchEngine;
  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

          title: Text("AmiTA"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right:20),
              child: GestureDetector(
                onTap: () { /* Write listener code here */
                  _displayTextInputDialog(context);
                },
                child: Icon(
                    Icons.add_circle  // add custom icons also
                ),
              ),
            ),
          ]

      ),
      body: Column(
        children: [
          Expanded(
            flex: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,top:50),
                  child: Row(
                    children: [
                      Text(
                          'Confession',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
        ],
                  ),
                ),
              ],
            ),
          ),
            Expanded(
            flex: 70,
            child: Column(
              children: [
                Container(
                  child: Column(children: [
                    Container(
                      height: 450,
                        child: ListView.separated(
                          padding: const EdgeInsets.all(8),
                          itemCount: _names.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                            Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black,
                            ),
                            height: 400,
                            width:400,
                            child: Text('${_names[index]}',
                            style: TextStyle(
                            fontSize: 14, color: Colors.white
                            ),   )
                            ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 100),
                                      child: RaisedButton(
                                        color: Colors.green,
                                        onPressed: () {
                                          setState(() {
                                            _likes[index] = _likes[index] + 1;
                                            _context.child(_uuid[index]).update({'like': _likes[index]});
                                          });
                                        },
                                        child: Container(

                                          child: Row( // Replace with a Row for horizontal icon + text
                                          children: <Widget>[
                                            Container(
                                                margin: EdgeInsets.only(right: 5),
                                                child:
                                             Text("YTA    " +'${_likes[index]}')
                                            )],
                                          ),
                                        ),
                                        // fill in required params
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Colors.red,
                                      onPressed: () {
                                      setState(() {
                                        setState(() {
                                          _dislike[index] = _dislike[index] + 1;
                                          _context.child(_uuid[index]).update({'dislike': _dislike[index]});
                                        });
                                      });
                                    },
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(right: 5),
                                              child:
                                              Text('NTA    ' +'${_dislike[index]}'),
                                          )                                        ],
                                      ),

                                      // fill in required params
                                    ),
                                  ],
                                )
                              ],
                            );

                          },
                          separatorBuilder: (BuildContext context, int index) => const Divider(),
                        ),
                        ),

                      // child: SwipeCards(
                      //
                      //   matchEngine: _matchEngine,
                      //     itemBuilder: (BuildContext context, int index) {
                      //     return Container(
                      //
                      //       alignment: Alignment.center,
                      //       color: new Color(_swipeItems[index].content.color),
                      //       child: Text(
                      //         _swipeItems[index].content.text,
                      //         style: TextStyle(fontSize: 14, color: Colors.white),
                      //
                      //       ),
                      //     );
                      //   },
                      //   onStackFinished: () {
                      //     final snackBar = (SnackBar(
                      //       content: Text("End of Confession"),
                      //       duration: Duration(milliseconds: 500),
                      //     ));
                      //   },
                      // ),
                    // );
                  ],
                  ),
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}


