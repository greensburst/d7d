import 'package:flutter/material.dart';
import '../model/user.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  User u = User(
    // vbxid: null,
    mail: null,
    // nickname: null,
    password: null,
  );

  save() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("islogin", "yes");
  }

  _onsubmit(){
    if(u.mail == "116@qq.com" && u.password == "123") {
      save();
      Navigator.of(context).pushNamedAndRemoveUntil('/home',(route) => route == null);
    }
    // Socket.connect("192.168.31.104", 8888).then((Socket socket) {
    //   String signupinfo = json.encode(u.toJson());
    //   socket.write(signupinfo);
    //   socket.listen((res) {
    //     if (utf8.decode(res) == "access") {
    //       _signmanager();
    //       Navigator.of(context).pushNamedAndRemoveUntil('/home',(route) => route == null);
    //     } else {
    //       print("账号或密码错误！");
    //     }
    //   });
    //   socket.close();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(236, 236, 236, 1),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 90),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                "vbxid/邮箱登录",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (v) {
                  u.mail = v;
                },
                decoration: InputDecoration(
                  labelText: "账号",
                  prefixIcon: Icon(Icons.email),
                  hintText: "请填写vbxid/邮箱",
                  errorText: u.mail == "" ? "账号不能为空" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextField(
                obscureText: true,
                onChanged: (v) {
                  u.password = v;
                },
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  labelText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  hintText: "请填写密码",
                  errorText: u.password == "" ? "密码不能为空" : null,
                ),
              ),
            ),
            FlatButton(
              color: Color.fromRGBO(6, 192, 95, 1),
              textColor: Colors.white,
              child: Container(
                  height: 40,
                  width: 200,
                  child: Text('登录'),
                  alignment: Alignment.center),
              disabledColor: Color.fromRGBO(224, 224, 224, 1),
              disabledTextColor: Color.fromRGBO(180, 180, 180, 1),
              onPressed: u.mail != null &&
                      u.password != null &&
                      u.mail != "" &&
                      u.password != ""
                  ? _onsubmit
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
