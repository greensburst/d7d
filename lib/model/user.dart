class User {
  String nickname;
  String mail;
  String password;
  String vbxid;

  User({
    this.nickname,
    this.mail,
    this.password,
    this.vbxid,
  });

  User.fromJson(Map<String, dynamic> json) {
     nickname = json['nickname'];
     mail = json['mail'];
     password = json['password'];
     vbxid = json['vbxid'];
  }

  Map<String, dynamic> toJson() =>
    {
      'nickname': nickname,
      'mail': mail,
      'password':password,
      'vbxid':vbxid,
    };
}