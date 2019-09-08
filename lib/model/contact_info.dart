import 'package:azlistview/azlistview.dart';

class ContactInfo extends ISuspensionBean {
  ContactInfo({
    this.remarks,
    this.avatar,
    this.namepy,
    this.tag,
    this.nickname,
  });

  String remarks;
  String avatar;
  String namepy;
  String tag;
  String nickname;

  @override
  String getSuspensionTag() => tag;
}