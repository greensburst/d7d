import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../model/user.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  User u = User(
    mail: null,
    nickname: null,
    password: null,
  );

  _onsubmit() {
    Socket.connect("192.168.31.104", 8888).then((Socket sock1) {
      Socket sock2;
      String signupinfo = json.encode(u.toJson());
      sock1.write(signupinfo);
      sock1.close();
      sock2.listen((data){
        print(utf8.decode(data));
      });
      sock2.close();
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
                "邮箱注册",
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    onChanged: (v) {
                      u.nickname = v;
                    },
                    decoration: InputDecoration(
                      labelText: "昵称",
                      prefixIcon: Icon(Icons.perm_identity),
                      hintText: "例如：韩梅梅",
                      errorText: u.nickname == "" 
                                ? "昵称不能为空" 
                                : null,
                      errorStyle: TextStyle(
                        
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 60,
                  height: 60,
                  child:_image == null
                      ? IconButton(
                          icon: Icon(
                            Icons.add_photo_alternate,
                            color: Color.fromRGBO(129, 129, 129, 1),
                          ),
                          iconSize: 40,
                          onPressed: getImage,
                          splashColor: Colors.grey.withOpacity(0.3),
                          highlightColor: Colors.grey.withOpacity(0.1),
                        )
                      : Image.file(_image), 
                )
              ],
            ),
            Container(
              // padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (v) {
                  u.mail = v;
                },
                decoration: InputDecoration(
                  labelText: "邮箱",
                  prefixIcon: Icon(Icons.email),
                  hintText: "请填写邮箱",
                  errorText: u.mail == "" 
                            ? "邮箱不能为空" 
                            : null,
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
                  labelText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  hintText: "填写密码",
                  errorText: u.password == "" 
                          ? "密码不能为空" 
                          : null,
                ),
              ),
            ),
            FlatButton(
              color: Color.fromRGBO(6, 192, 95, 1),
              textColor: Colors.white,
              child: Container(
                height:40,
                width: 200,
                child:Text('注册'),
                alignment: Alignment.center
              ),
              disabledColor: Color.fromRGBO(224, 224, 224, 1),
              disabledTextColor: Color.fromRGBO(180, 180, 180, 1),
              onPressed: u.nickname != null && u.mail != null && u.password != null && u.nickname != "" && u.mail != "" && u.password != ""
                        ? _onsubmit
                        : null,
            ),
          ],
        ),
      ),
    );
  }
}
