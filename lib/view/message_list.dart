import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: convs.length,
      itemBuilder: _listbuilder,
    );
  }

  Widget _listbuilder(BuildContext context, int index) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Row(
          children: <Widget>[
            Container(
              height: 44,
              width: 44,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(image: AssetImage(convs[index].avatar)),
                // color: Colors.amberAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 64,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey[400], width: .3),
                )),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              convs[index].name,
                              style: TextStyle(
                                color: Color.fromRGBO(3, 8, 26, 1),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              convs[index].lastest,
                              style: TextStyle(
                                  color: Color.fromRGBO(135, 139, 153, 1),
                                  fontSize: 13.0),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            convs[index].time,
                            style: TextStyle(
                              color: Color.fromRGBO(178, 178, 178, 1),
                            ),
                          ),
                          Offstage(
                            offstage: convs[index].noshow,
                            child: Icon(
                              Icons.notifications_off,
                              color: Color.fromRGBO(178, 178, 178, 1),
                              size: 18.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class Conv {
  Conv({
    this.avatar,
    this.name,
    this.lastest,
    this.time,
    this.unread,
    this.noshow,
  });

  final String avatar;
  final String name;
  final String lastest;
  final String time;
  final int unread;
  final bool noshow;
}

final List<Conv> convs = [
  Conv(
    avatar: "assets/image/avatar/lz.png",
    name: "李霑",
    lastest: "你还好么？",
    time: "20:56",
    unread: 12,
    noshow: true,
  ),
  Conv(
    avatar: "assets/image/avatar/yyh.png",
    name: "于樱慧",
    lastest: "我还好。",
    time: "20:57",
    unread: 64,
    noshow: true,
  ),
  Conv(
    avatar: "assets/image/avatar/a1.png",
    name: "mouse",
    lastest: "im a mouse.im a mouse.im a mouse.im a mouse.",
    time: "19:32",
    unread: 7,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a2.png",
    name: "cattle",
    lastest: "im a cattle.im a cattle.im a cattle.im a cattle.",
    time: "19:34",
    unread: 5,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a3.png",
    name: "tiger",
    lastest: "im a tiger.im a tiger.im a tiger.im a tiger.",
    time: "19:34",
    unread: 3,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a4.png",
    name: "rabbit",
    lastest: "im a rabbit.im a rabbit.im a rabbit.im a rabbit.",
    time: "19:34",
    unread: 4,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a5.png",
    name: "dragon",
    lastest: "im a dragon.im a dragon.im a dragon.im a dragon.",
    time: "19:35",
    unread: 5,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a6.png",
    name: "snake",
    lastest: "im a snake.im a snake.im a snake.im a snake.",
    time: "19:35",
    unread: 6,
    noshow: false,
  ),
];
