import 'package:swdmobileapp/models/tag.dart';

class NewsTag {
  int tagId;
  int newsId;
  Tag tag;

  NewsTag({this.tagId, this.newsId, this.tag});

  NewsTag.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    newsId = json['newsId'];
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagId'] = this.tagId;
    data['newsId'] = this.newsId;
    if (this.tag != null) {
      data['tag'] = this.tag.toJson();
    }
    return data;
  }
}
