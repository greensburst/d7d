import 'package:flutter/material.dart';
import 'package:vbx/view/message_list.dart';
import '../view/app_bar.dart';

class Message extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "消息"),
      body: MessageList(),
    );
  }
}