import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  Appbar({Key key, this.title, this.callBack}) : super(key: key);
  final callBack;
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {
            showSearch(context: context, delegate: SearchBarDelegate());
          },
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          color: Colors.black,
          onPressed: () {
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(100, 90, 0, 10),
              items: <PopupMenuItem>[
                PopupMenuItem(value: '1', child: Text('创建Topic')),
                PopupMenuItem(value: '2', child: Text('添加朋友')),
                PopupMenuItem(value: '3', child: Text('扫一扫')),
                PopupMenuItem(value: '4', child: Text('帮助与反馈'))
              ],
            ).then((value) {
              print(value);
            });
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => getSize();
  Size getSize() {
    return Size(50.0, 50.0);
  }
}

class SearchBarDelegate extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: ()=>query="",
      )
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: ()=>close(context, null),
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {

    List recentSuggest,searchList;
    recentSuggest = [];
    searchList = [];
    final suggestionList = query.isEmpty ? recentSuggest : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context,index) => ListTile(
        title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              children:[
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey
                  )
                )
              ]
            )
        ),
      ),
    );
  }
}

class Tabbar extends StatelessWidget implements PreferredSizeWidget {
  Tabbar({Key key, this.title, this.callBack}) : super(key: key);
  final callBack;
  String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(236, 236, 236, 1),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 19.0,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          color: Colors.black,
          onPressed: () {
            showSearch(context: context, delegate: SearchBarDelegate());
          },
        ),
        IconButton(
          icon: Icon(Icons.add_circle_outline),
          color: Colors.black,
          onPressed: () {
            showMenu(
              context: context,
              position: RelativeRect.fromLTRB(100, 90, 0, 10),
              items: <PopupMenuItem>[
                PopupMenuItem(value: '1', child: Text('创建Topic')),
                PopupMenuItem(value: '2', child: Text('添加朋友')),
                PopupMenuItem(value: '3', child: Text('扫一扫')),
                PopupMenuItem(value: '4', child: Text('帮助与反馈'))
              ],
            ).then((value) {
              print(value);
            });
          },
        ),
      ],
      bottom: TabBar(
        unselectedLabelColor: Colors.black38,
        indicatorColor: Colors.black54,
        labelColor: Colors.black,
        tabs: <Widget>[
          Tab(text: "话题榜"),
          Tab(text: "同城榜"),
          Tab(text: "好友榜"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => getSize();
  Size getSize() {
    return Size(100.0, 100.0);
  }
}