import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:vbx/route.dart';
import 'package:vbx/view/loading.dart';
import 'package:vbx/view/sign_in.dart';
import 'package:vbx/view/sign_up.dart';
import './view/welcome.dart';
import './view/message_inner.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _StateMyApp createState() => _StateMyApp();
}

class _StateMyApp extends State<MyApp> {
  int _index = 0;
  bool _badge = false;
  String _unread = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "vbx",
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/wel': (context) => Welcome(),
        '/signup': (context) => SignUp(),
        '/signin': (context) => SignIn(),
        '/minner':(context) => MessInner(),
        '/home': (context) => Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                currentIndex: _index,
                onTap: (index) {
                  setState(() {
                    _index = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.green,
                items: [
                  BottomNavigationBarItem(
                    icon: Badge(
                      badgeContent: Text(_unread),
                      child: Icon(Icons.chat_bubble_outline),
                      showBadge: _badge,
                    ),
                    title: Text('消息'),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.people_outline), title: Text('联系人')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.explore), title: Text('发现')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_outline), title: Text('我的')),
                ],
              ),
              body: pages[_index],
            ),
      },
    );
  }
}
