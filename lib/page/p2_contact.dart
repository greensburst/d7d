import 'package:flutter/material.dart';
import 'package:vbx/view/contact_list.dart';
import '../view/app_bar.dart';

class Contact extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(title: "联系人"),
      body: ContactList(),
    );
  }
}