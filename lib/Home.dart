import 'package:flutter/material.dart';
import 'package:friend_up/Chatroom.dart';
import 'package:friend_up/Swipe.dart';
import 'package:friend_up/connect.dart';
import 'package:friend_up/setting.dart';
import 'package:swipe_cards/swipe_cards.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> screens = [
    swipeScreen(),
    // connectScreen(),
    // ChatScreen(),
    settingScreen(),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        // drawer: Container(
        //   width: 200,
        //   child: Drawer(
        //     child: ListView(
        //       children: [
        //         Container(
        //           height: 60,
        //           child: const DrawerHeader(
        //             decoration: BoxDecoration(
        //                 color: Colors.black
        //             ), child: Text(
        //                           "Menu",
        //                           style: TextStyle(
        //                             color: Colors.white,
        //                             fontWeight: FontWeight.bold,
        //                             fontStyle: FontStyle.italic,
        //                             fontSize: 20
        //                           ),
        //                          ),
        //           ),
        //         ),
        //         ListTile(
        //           title: Text('Home'),
        //           onTap: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => HomePage()));
        //           },
        //         ),
        //         ListTile(
        //           title: Text('Setting'),
        //           onTap: () {
        //             print("hello");
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => settingScreen()));
        //           },
        //         )
        //       ],
        //     ),
        //   ),
        // ),
      body: Center(
        child: screens.elementAt(_selectedIndex),
      ),
    bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
       BottomNavigationBarItem(
        icon: Icon(Icons.home, size: 30),
        label: ""
        ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.favorite_border),
    // label: 'Groups',
    // ),
    // BottomNavigationBarItem(
    // icon: Icon(Icons.messenger),
    // label: 'Chat',
    // ),
        BottomNavigationBarItem(
         icon: Icon(Icons.person, size: 30),
         label: ""
        ),
      ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.black54,
    onTap: _onItemTapped,
    ),
    );
  }
}
