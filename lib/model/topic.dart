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