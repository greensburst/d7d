import 'package:flutter/material.dart';
import '../model/contact_info.dart';

class ContInner extends StatefulWidget {
  @override
  _ContInnerState createState() => _ContInnerState();
}

class _ContInnerState extends State<ContInner> {
  @override
  Widget build(BuildContext context) {
    final ContactInfo ci = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          iconSize: 16,
          alignment: Alignment.centerLeft,
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 25, left: 15, right: 10),
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(image: AssetImage(ci.avatar)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              ci.remarks,
                              style: TextStyle(
                                color: Color.fromRGBO(3, 8, 26, 1),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(254, 191, 0, 1),
                            ),
                          ],
                        ),
                        Text(
                          "vbxid:10010",
                          style: TextStyle(
                              color: Color.fromRGBO(135, 139, 153, 1),
                              fontSize: 13.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                      top: BorderSide(color: Colors.grey[200],width: .5),
                      bottom: BorderSide(color: Colors.grey[300],width: .5),
                    )
                  ),
                  height: 50,
                  padding: EdgeInsets.only(right: 10,left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "设置备注和标签",
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
                onTap: () {},
                splashColor: Colors.grey.withOpacity(0.3),
                highlightColor: Colors.grey.withOpacity(0.1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey[300],width: .5),
                      bottom: BorderSide(color: Colors.grey[300],width: .5),
                    )
                  ), 
                  child: Center(
                    child: Text(
                      "发消息",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(87, 107, 149, 1),
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
