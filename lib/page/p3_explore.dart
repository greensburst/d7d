import 'package:flutter/material.dart';
import '../view/app_bar.dart';
import '../view/topic_all.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: Tabbar(title: "发现"),
        body: TabBarView(
          children: <Widget>[
            TopicAll(),
            TopicAll(),
            TopicAll(),
          ],
        ),
      ),
    );
  }
}
