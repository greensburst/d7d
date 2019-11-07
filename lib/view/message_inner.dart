import 'package:flutter/material.dart';
import 'message_list.dart';

class MessInner extends StatefulWidget {
  @override
  _MessInnerState createState() => _MessInnerState();
}

class _MessInnerState extends State<MessInner> {
  var _content = "";
  List<Msg> _messages = <Msg>[];
  final TextEditingController _textController = new TextEditingController();

  _send(String v) {
    Msg msg = new Msg(
      content: v,
    );
    setState(() {
      _messages.insert(0, msg);
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Conv conv = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(236, 236, 236, 1),
        titleSpacing: -15,
        title: Text(
          conv.name,
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
          Expanded(
            flex: 1,
            child: Container(
              color: Color.fromRGBO(228, 228, 228, 1),
              // child: ChatPage(),
              child: Column(children: <Widget>[
                Flexible(
                    child: ListView.builder(
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                      reverse: true,
                      padding: new EdgeInsets.all(6.0),
                )),
              ]),
            ),
          ),
          Container(
            height: 48,
            decoration: BoxDecoration(
                color: Color.fromRGBO(246, 246, 246, 1),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(218, 218, 218, 1), blurRadius: 5)
                ]),
            child: Row(
              children: <Widget>[
                // TextField(),
                Expanded(
                  child: Container(
                    height: 36,
                    margin: EdgeInsets.only(left: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(28.0))),
                    child: TextField(
                      controller: _textController,
                      onChanged: (v) {
                        _content = v;
                      },
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 16, top: 10, bottom: 10, right: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                Container(
                  height: 36,
                  width: 72,
                  margin: EdgeInsets.only(right: 8, left: 8),
                  child: FlatButton(
                    onPressed: (){
                      _send(_content);
                    },
                    child: Text("发送"),
                    color: Colors.yellow,
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Msg extends StatelessWidget {

  Msg({this.content});
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(content),
    );
  }
}

class Blink {
  Blink({
    this.avatar,
    this.content,
    this.who,
  });

  String avatar;
  String content;
  String who;
}
