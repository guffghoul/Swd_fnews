import 'package:swdmobileapp/models/newstag.dart';
import 'package:swdmobileapp/models/usertag.dart';

class Tag {
  int tagId;
  String tagName;
  bool isActive;
  List<NewsTag> newsTag;
  List<UserTag> userTag;

  Tag({this.tagId, this.tagName, this.isActive, this.newsTag, this.userTag});

  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    tagName = json['tagName'];
    isActive = json['isActive'];
    if (json['newsTag'] != null) {
      newsTag = new List<NewsTag>();
      json['newsTag'].forEach((v) {
        newsTag.add(new NewsTag.fromJson(v));
      });
    }
    if (json['userTag'] != null) {
      userTag = new List<UserTag>();
      json['userTag'].forEach((v) {
        userTag.add(new UserTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagId'] = this.tagId;
    data['tagName'] = this.tagName;
    data['isActive'] = this.isActive;
    if (this.newsTag != null) {
      data['newsTag'] = this.newsTag.map((v) => v.toJson()).toList();
    }
    if (this.userTag != null) {
      data['userTag'] = this.userTag.map((v) => v.toJson()).toList();
    }
    return data;
  }
}