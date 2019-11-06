import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    Future(() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString("islogin");
    }).then((val) {
      if (val == "yes") {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => route == null);
        });
      } else {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/wel', (route) => route == null);
        });
      }
    });
  } //我要被自己秀死了

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/image/paper/loading.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
