import 'package:flutter/material.dart';

class MyselfInfo extends StatefulWidget {
  @override
  _MyselfInfoState createState() => _MyselfInfoState();
}

class _MyselfInfoState extends State<MyselfInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(top: 70, bottom: 20, left: 10, right: 10),
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  height: 66,
                  width: 66,
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: AssetImage("assets/image/avatar/lz.png")),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 96,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "李素晴",
                          style: TextStyle(
                            color: Color.fromRGBO(3, 8, 26, 1),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "vbxid:10010",
                              style: TextStyle(
                                  color: Color.fromRGBO(135, 139, 153, 1),
                                  fontSize: 13.0),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Color.fromRGBO(135, 139, 153, 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.grey.withOpacity(0.3),
              highlightColor: Colors.grey.withOpacity(0.1),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: AssetImage("assets/image/icons/star.png")),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "收藏",
                            style: TextStyle(
                              fontSize: 14.0,
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
                ],
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
              child: Row(
                children: <Widget>[
                  Container(
                    height: 26,
                    width: 26,
                    margin: EdgeInsets.all(11.0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: AssetImage("assets/image/icons/album.png")),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "相册",
                            style: TextStyle(
                              fontSize: 14.0,
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
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.grey.withOpacity(0.3),
              highlightColor: Colors.grey.withOpacity(0.1),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 26,
                    width: 26,
                    margin: EdgeInsets.all(11.0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: AssetImage("assets/image/icons/setting.png")),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "设置",
                            style: TextStyle(
                              fontSize: 14.0,
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
