import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vbx/model/connection.dart';
import 'package:vbx/model/protocol.dart';
import 'package:toast/toast.dart';

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

  SignupInfo suinfo = SignupInfo();

  _onsubmit() {
    RequestPackage pkg = RequestPackage();
    pkg.code = 0;
    pkg.body = json.encode(suinfo.toJson());
    Socket.connect(IpAddress, Port).then((Socket sock) {
      String pkginfo = json.encode(pkg.toJson());
      sock.write(pkginfo);
      sock.listen((data){
        Map resmap = json.decode(utf8.decode(data));
        var res = new ResponsePackage.fromJson(resmap);
        if(res.code == 200) {
          Toast.show("注册成功!",context);
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pushNamedAndRemoveUntil('/signin',(route) => route == null);
          });          
        } else if(res.code == 401) {
          Toast.show("该邮箱已被注册!",context);
        } else if(res.code == 500) {
          Toast.show("注册失败!",context);
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
                      suinfo.name = v;
                    },
                    decoration: InputDecoration(
                      labelText: "昵称",
                      prefixIcon: Icon(Icons.perm_identity),
                      hintText: "例如：韩梅梅",
                      errorText: suinfo.name == "" 
                                ? "昵称不能为空" 
                                : null,
                      errorStyle: TextStyle(
                        
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey)
                  ),
                  margin: EdgeInsets.only(left: 10),
                  width: 60,
                  height: 60,
                  child:_image == null
                      ? IconButton(
                          icon: Icon(
                            Icons.album,
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
                  suinfo.mail = v;
                },
                decoration: InputDecoration(
                  labelText: "邮箱",
                  prefixIcon: Icon(Icons.email),
                  hintText: "请填写邮箱",
                  errorText: suinfo.mail == "" 
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
                    suinfo.passwd = v;
                },
                decoration: InputDecoration(
                  labelText: "密码",
                  prefixIcon: Icon(Icons.lock),
                  hintText: "填写密码",
                  errorText: suinfo.passwd == "" 
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
              onPressed: suinfo.name != null && suinfo.mail != null && suinfo.passwd != null && suinfo.name != "" && suinfo.mail != "" && suinfo.passwd != ""
                        ? _onsubmit
                        : null,
            ),
          ],
        ),
      ),
    );
  }
}
