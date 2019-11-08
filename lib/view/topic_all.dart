import 'package:flutter/material.dart';
import '../model/topic.dart';
//explore 里的话题榜

class TopicAll extends StatefulWidget {
  @override
  _TopicAllState createState() => _TopicAllState();
}

class _TopicAllState extends State<TopicAll> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: _topicListbuilder,
    );
  }

  Widget _topicListbuilder(BuildContext context, int index) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.grey.withOpacity(0.3),
        highlightColor: Colors.grey.withOpacity(0.1),
        child: Row(
          children: <Widget>[
            Container(
              height: 66,
              width: 66,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image:
                    DecorationImage(image: AssetImage(topics[index].topicimg)),
                // color: Colors.amberAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 86,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.grey[500], width: .5),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      topics[index].topicname,
                      style: TextStyle(
                        color: Color.fromRGBO(3, 8, 26, 1),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      topics[index].topicinfo,
                      style: TextStyle(
                          color: Color.fromRGBO(135, 139, 153, 1),
                          fontSize: 13.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      topics[index].popindex.toString(),
                      style: TextStyle(
                        color: Color.fromRGBO(178, 178, 178, 1),
                      ),
                    ),
                  ],
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
