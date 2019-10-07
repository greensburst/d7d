import 'package:flutter/material.dart';
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
        onTap: (){},
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
                image: DecorationImage(image: AssetImage(topics[index].topicimg)),
                // color: Colors.amberAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 86,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[500], width: .5),
                  )
                ),
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

class Topic {
  Topic({
    this.topicimg,
    this.topicname,
    this.topicinfo,
    this.popindex,
  });

  final String topicimg;
  final String topicname;
  final double popindex;
  final String topicinfo;
}

final List<Topic> topics = [
  Topic(
    topicimg: "assets/image/topic/t1.jpg",
    topicname: "#我和国旗同框#",
    popindex: 1779000,
    topicinfo: "一起与国旗合影吧！每次被选中在@央视新闻上发出，还能获得70元红包！"
  ),
  Topic(
    topicimg: "assets/image/topic/t2.jpg",
    topicname: "#重阳节#",
    popindex: 1550000,
    topicinfo: "又到重阳节，又称老人节。今天为爱我们的他们发条微博！"
  ),
  Topic(
    topicimg: "assets/image/topic/t3.jpg",
    topicname: "#如何委婉的说我不等你了#",
    popindex: 38000,
    topicinfo: "带话题说说，如何委婉的说我不等你了？"
  ),
  Topic(
    topicimg: "assets/image/topic/t4.jpg",
    topicname: "#休斯顿火箭队讨论是否解职莫雷#",
    popindex: 12000,
    topicinfo: "根据美国当地媒体The Ringer报道，休斯顿火箭队已经开会讨论是否解除俱乐部总经理莫雷的职务。"
  ),
];

