import 'package:flutter/material.dart';
import '../model/conversation.dart';

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
        onTap: () {
          Navigator.pushNamed(context, '/minner', arguments: convs[index]);
        },
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


