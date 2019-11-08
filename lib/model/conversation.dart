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
    lastest: "他穿过街口，又冬雪白头，衰于艳阳最好的火候，他步步回首，在盛世游走，却也只想潦倒你眼中。",
    time: "20:44",
    unread: 12,
    noshow: true,
  ),
  Conv(
    avatar: "assets/image/avatar/yyh.png",
    name: "于樱慧",
    lastest: "雪莉走了，我很忧伤，她如一个用雪堆出的美人，终究不能长久，雪曝光在美光灯下，消融得极迅速，雪化了，却留给世界无尽的遗憾与怀想。",
    time: "20:57",
    unread: 64,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a1.png",
    name: "张容涵",
    lastest: "越活越冷清，不指望谁做我的救星。",
    time: "19:32",
    unread: 7,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a2.png",
    name: "尹成麒",
    lastest: "时光不会倒着走我也不要再回头。",
    time: "19:34",
    unread: 5,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a3.png",
    name: "王号",
    lastest: "有些伤疤会被记忆所掩藏，但它终会刻在记忆的年轮中，某时某刻的想起，突然发现，有些事情还是无法去面对它。",
    time: "09:34",
    unread: 3,
    noshow: true,
  ),
  Conv(
    avatar: "assets/image/avatar/a4.png",
    name: "刘宇昕",
    lastest: "最怕的感觉是，他伸出手要握住你的手，你小心翼翼的终于确定了他是真的喜欢你，才敢伸出手去握住他的手，他却收回了手嘲笑你这个好骗的傻子。",
    time: "12:30",
    unread: 4,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a5.png",
    name: "高玮珩",
    lastest: "可惜我还没有遍历山河，值得的人已经不值得。",
    time: "13:35",
    unread: 5,
    noshow: false,
  ),
  Conv(
    avatar: "assets/image/avatar/a6.png",
    name: "王若梅",
    lastest: "最糟糕的感觉，就是不知道该等待还是放弃。",
    time: "07:00",
    unread: 6,
    noshow: false,
  ),
];