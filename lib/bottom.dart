// ignore_for_file: prefer__ructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/Home/Home.dart';
import 'Screens/Reminder/reminder.dart';
import 'Screens/chat/chat.dart';
import 'Screens/Request/request.dart';
import 'Screens/SignIn/sign_in.dart';
import 'drawer.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  late String _title;
  @override
  // ignore: must_call_super
  initState() {
    _title = 'Home';
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Request(),
    ChatScreen(),
    Reminder(),
  ];

  final gradientColor = Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.green,
          // Colors.red,
          Colors.lightBlue,
        ],
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(const Sign_In());
              // FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.purple,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        flexibleSpace: gradientColor,
      ),
      drawer: drawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_history),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_notifications),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_home_work_outlined),
            label: 'Blood Banks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Reminder',
          ),
        ],
        backgroundColor: Colors.green,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        selectedFontSize: 18,
        selectedIconTheme: IconThemeData(size: 30, color: Colors.teal),
        unselectedIconTheme: IconThemeData(size: 29),
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 17,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
            _title = 'Home';
          break;
        case 1:
            _title = 'Requests';
          break;
        case 2:
            _title = 'Blood Banks';
          break;
        case 3:
            _title = 'Reminder';
          break;
      }
    });
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: Text("Would you like to sign out?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Get.to(Sign_In());
            },
            child: Text(
              "Sign Out",
              style: TextStyle(color: Colors.red),
            ),
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("Cancel"),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            // Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
