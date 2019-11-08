import 'package:azlistview/azlistview.dart';

class ContactInfo extends ISuspensionBean {
  ContactInfo({
    this.remarks,
    this.avatar,
    this.namepy,
    this.tag,
    this.nickname,
  });

  String remarks; //备注？我自己都忘了...
  String avatar;
  String namepy;
  String tag;
  String nickname;

  @override
  String getSuspensionTag() => tag;
}