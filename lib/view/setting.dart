import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(236, 236, 236, 1),
        titleSpacing: -15,
        title: Text(
          "设置",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          iconSize: 16,
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.grey[200], width: .5),
                    bottom: BorderSide(color: Colors.grey[300], width: .5),
                  )),
                  height: 50,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "鸽子号",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "10010",
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.grey[200], width: .5),
                    bottom: BorderSide(color: Colors.grey[300], width: .5),
                  )),
                  height: 50,
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "邮箱",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        "116@qq.com",
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color.fromRGBO(135, 139, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.grey[200], width: .5),
                    bottom: BorderSide(color: Colors.grey[300], width: .5),
                  )),
                  height: 50,
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "鸽子密码",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color.fromRGBO(135, 139, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(color: Colors.grey[200], width: .5),
                    bottom: BorderSide(color: Colors.grey[300], width: .5),
                  )),
                  height: 50,
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "关于鸽子",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Color.fromRGBO(135, 139, 153, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.only(top: 7),
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () async{
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("islogin", "no");
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/wel', (route) => route == null);
                },
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: Colors.grey[300], width: .5),
                      bottom: BorderSide(color: Colors.grey[300], width: .5),
                    )),
                    child: Center(
                      child: Text(
                        "退出",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(87, 107, 149, 1),
                            fontWeight: FontWeight.w700),
                      ),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
