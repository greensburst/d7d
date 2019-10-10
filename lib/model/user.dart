class User {
  String nickname;
  String mail;
  String password;

  User({
    this.nickname,
    this.mail,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
     nickname = json['nickname'];
     mail = json['mail'];
     password = json['password'];
  }

  Map<String, dynamic> toJson() =>
    {
      'nickname': nickname,
      'mail': mail,
      'password':password,
    };
}