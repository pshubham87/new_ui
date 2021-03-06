// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:task__furnitureapp/screens/Payment_page/Payment_Page.dart';
import 'package:task__furnitureapp/screens/Filter_Page/filter_Page.dart';
import 'package:task__furnitureapp/reusable/appcolor.dart';
import 'package:task__furnitureapp/Namepages.dart';

import '../Notification_Page/Notification_Page.dart';
import '../Cart_Page/Cart_Page.dart';

void main() {
  runApp(const Name());
}

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  int _selectedItems = 0;
  var _pages = [
    filter(),
    increment(),
    PaymentPage(),
    notifi(),
    Firstpages(),
  ];

  var _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
      ),
      Icon(
        Icons.card_travel,
        size: 30,
      ),
      Icon(
        Icons.person,
        size: 30,
      ),
      Icon(
        Icons.settings,
        size: 30,
      ),
      Icon(
        Icons.menu,
        size: 30,
      ),
    ];

    return MaterialApp(
        home: Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedItems = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          height: 60,
          buttonBackgroundColor: Colors.red,

          color: Color(0XFFD35E2D),
          backgroundColor: Colors.transparent,
          // selectedItemColor: Colors.black,
          // unselectedItemColor: Colors.grey,
          items: items,
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: "",
          // ),
          // BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: ""),
          // BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          // BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          // BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),

          // currentIndex: _selectedItems,
          onTap: (index) {
            setState(() {
              _selectedItems = index;
              _pageController.animateToPage(_selectedItems,
                  duration: Duration(microseconds: 200), curve: Curves.linear);
            });
          },
        ),
      ),
    ));
  }
}
