class RequestPackage {
  int code;
  String target;
  String source;
  String body;

  RequestPackage({
    this.code,
    this.target,
    this.source,
    this.body,
  });

  RequestPackage.fromJson(Map<String, dynamic> json) {
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

class ResponsePackage {
  int code;
  String body;

  ResponsePackage({
    this.code,
    this.body,
  });

  ResponsePackage.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() => {
    'code': code,
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

class SigninInfo {
  String account;
  String passwd;

  SigninInfo({
    this.account,
    this.passwd,
  });

  SigninInfo.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    passwd = json['passwd'];
  }

  Map<String, dynamic> toJson() => {
        'account': account,
        'passwd': passwd,
      };
}