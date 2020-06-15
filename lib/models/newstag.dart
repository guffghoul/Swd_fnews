class NewsTag {
  int tagId;
  int newsId;

  NewsTag({this.tagId, this.newsId});

  NewsTag.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    newsId = json['newsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagId'] = this.tagId;
    data['newsId'] = this.newsId;
    return data;
  }
}
