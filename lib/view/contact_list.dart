import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azlistview/azlistview.dart';
import 'package:lpinyin/lpinyin.dart';
import '../model/contact_info.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<ContactInfo> _contactList = List();
  List<ContactInfo> _special = List();

  int _tagHeight = 40;
  int _itemHeight = 50;
  String _tag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    rootBundle.loadString('assets/data/friends.json').then((value){
      List list = json.decode(value);
      list.forEach((value){
        // if (value['remarks'] == null) {
          value['remarks'] = value['nickname'];
        // }
        if (value['tag'] == "★") {
          _special.add(ContactInfo(remarks:value['remarks'],tag: value['tag'],avatar:value['avatar']));
        }
        _contactList.add(ContactInfo(remarks:value['remarks'],avatar:value['avatar']));
        handleList(_contactList);
        setState(() {
         _tag = _special[0].getSuspensionTag(); 
        });
      });
    });
  }

  void handleList(List<ContactInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].remarks);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namepy = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tag = tag;
      } else {
        list[i].tag = "#";
      }
    }
    SuspensionUtil.sortListBySuspensionTag(_contactList);
  }

  void tagChanged(String tag) {
    setState(() {
     _tag = tag; 
    });
  }

  Widget buildTag(String tag) {
    tag = (tag == "★" ? "特别关心" : tag);
    return Container(
      height: _tagHeight.toDouble(),
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  Widget buildItem(ContactInfo model) {
    String tag = model.getSuspensionTag();
    tag = (tag == "★" ? "特别关心" : tag);
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: buildTag(tag),
        ),
        SizedBox(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  image: DecorationImage(image: AssetImage(model.avatar)),
                ),
              ),
            ),  
            title: Text(model.remarks),
            onTap: () {
              Navigator.pushNamed(context, '/cinner', arguments: model);
            },
          ),
        )
      ],
    );
  }

  Widget buildHead() {
    return Column(
      children: <Widget>[
        SizedBox(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  image: DecorationImage(image: AssetImage("assets/image/icons/new.png")),
                ),
              ),
            ),  
            title: Text("新的朋友"),
            onTap: () {
            },
          ),
        ),
        SizedBox(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.0),
                  image: DecorationImage(image: AssetImage("assets/image/icons/group.png")),
                ),
              ),
            ),  
            title: Text("群聊"),
            onTap: () {
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildHead(),
        Expanded(
            flex: 1,
            child: AzListView(
              data: _contactList,
              topData: _special,
              itemBuilder: (context, model) => buildItem(model),
              suspensionWidget: buildTag(_tag),
              isUseRealIndex: true,
              itemHeight: _itemHeight,
              suspensionHeight: _tagHeight,
              onSusTagChanged: tagChanged,
              //showCenterTip: false,
            )),
      ],
    );
  }
}