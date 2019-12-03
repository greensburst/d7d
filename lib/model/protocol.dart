class Package {
  int code;
  String target;
  String source;
  String body;

  Package({
    this.code,
    this.target,
    this.source,
    this.body,
  });

  Package.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    target = json['target'];
    source = json['source'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() => {
    'code': code,
    'target': target,
    'source': source,
    'body': body,
  };
}

class SignupInfo {
  String mail;
  String passwd;
  String name;

  SignupInfo({
    this.mail,
    this.passwd,
    this.name,
  });

  SignupInfo.fromJson(Map<String, dynamic> json) {
    mail = json['mail'];
    passwd = json['passwd'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() => {
        'mail': mail,
        'passwd': passwd,
        'name': name,
      };
}
