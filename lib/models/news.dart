import 'package:swdmobileapp/models/bookmark.dart';
import 'package:swdmobileapp/models/channel.dart';
import 'package:swdmobileapp/models/comment.dart';
import 'package:swdmobileapp/models/newstag.dart';

class News {
  int newsId;
  String newsTitle;
  String newsContent;
  String dayOfPost;
  int channelId;
  bool isActive;
  String linkImage;
  Channel channel;
  List<Bookmark> bookmark;
  List<Comment> comment;
  List<NewsTag> newsTag;

  News(
      {this.newsId,
      this.newsTitle,
      this.newsContent,
      this.dayOfPost,
      this.channelId,
      this.isActive,
      this.linkImage,
      this.channel,
      this.bookmark,
      this.comment,
      this.newsTag});

  News.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    newsTitle = json['newsTitle'];
    newsContent = json['newsContent'];
    dayOfPost = json['dayOfPost'];
    channelId = json['channelId'];
    isActive = json['isActive'];
    linkImage = json['linkImage'];
    channel = json['channel'];
    if (json['bookmark'] != null) {
      bookmark = new List<Bookmark>();
      json['bookmark'].forEach((v) {
        bookmark.add(new Bookmark.fromJson(v));
      });
    }
    if (json['comment'] != null) {
      comment = new List<Comment>();
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
    if (json['newsTag'] != null) {
      newsTag = new List<NewsTag>();
      json['newsTag'].forEach((v) {
        newsTag.add(new NewsTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newsId'] = this.newsId;
    data['newsTitle'] = this.newsTitle;
    data['newsContent'] = this.newsContent;
    data['dayOfPost'] = this.dayOfPost;
    data['channelId'] = this.channelId;
    data['isActive'] = this.isActive;
    data['linkImage'] = this.linkImage;
    data['channel'] = this.channel;
    if (this.bookmark != null) {
      data['bookmark'] = this.bookmark.map((v) => v.toJson()).toList();
    }
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    if (this.newsTag != null) {
      data['newsTag'] = this.newsTag.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
