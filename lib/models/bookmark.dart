class Bookmark {
  int userId;
  int newsId;
  
  Bookmark({this.newsId, this.userId});

  Bookmark.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    newsId = json['newsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['newsId'] = this.newsId;
    return data;
  }
}