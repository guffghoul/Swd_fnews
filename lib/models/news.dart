class News {
  int newsId;
  String newsTitle;
  String newsContent;
  String dayOfPost;
  int channelId;
  bool isActive;

  News(
      {this.newsId,
      this.newsTitle,
      this.newsContent,
      this.dayOfPost,
      this.channelId,
      this.isActive});

  News.fromJson(Map<String, dynamic> json) {
    newsId = json['newsId'];
    newsTitle = json['newsTitle'];
    newsContent = json['newsContent'];
    dayOfPost = json['dayOfPost'];
    channelId = json['channelId'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newsId'] = this.newsId;
    data['newsTitle'] = this.newsTitle;
    data['newsContent'] = this.newsContent;
    data['dayOfPost'] = this.dayOfPost;
    data['channelId'] = this.channelId;
    data['isActive'] = this.isActive;
    return data;
  }

}