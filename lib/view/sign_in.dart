import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vbx/model/connection.dart';
import 'package:vbx/model/protocol.dart';
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  save() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("islogin", "yes");
  }

  SigninInfo sinfo = SigninInfo();

  _onsubmit() {
    RequestPackage pkg = RequestPackage();
    pkg.code = 1;
    pkg.body = json.encode(sinfo.toJson());
    Socket.connect(IpAddress, Port).then((Socket sock) {
      String pkginfo = json.encode(pkg.toJson());
      sock.write(pkginfo);
      sock.listen((data){
        Map resmap = json.decode(utf8.decode(data));
        var res = new ResponsePackage.fromJson(resmap);
        if(res.code == 200) {
          Toast.show("登录成功!",context);
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pushNamedAndRemoveUntil('/home',(route) => route == null);
          });          
        } else if(res.code == 402) {
          Toast.show("该账户不存在！",context);
        } else if(res.code == 403) {
          Toast.show("密码错误！",context);
        } else if(res.code == 500) {
          Toast.show("登陆失败！",context);
        }
      });
      sock.close();
    });
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
                "鸽子号/邮箱登录",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (v) {
                  sinfo.account = v;
                },
                decoration: InputDecoration(
                  labelText: "账号",
                  prefixIcon: Icon(Icons.email),
                  hintText: "请填写鸽子号/邮箱",
                  errorText: sinfo.account == "" ? "账号不能为空" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: TextField(
                obscureText: true,
                onChanged: (v) {
                  sinfo.passwd = v;
                },
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  labelText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  hintText: "请填写密码",
                  errorText: sinfo.passwd == "" ? "密码不能为空" : null,
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
              onPressed: sinfo.account != null &&
                      sinfo.passwd != null &&
                      sinfo.account != "" &&
                      sinfo.passwd != ""
                  ? _onsubmit
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
