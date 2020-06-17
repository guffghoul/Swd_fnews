class Comment {
  int id;
  int newsId;
  int userId;
  String comment1;
  int masterCommentId;

  Comment(
      {this.id, this.newsId, this.userId, this.comment1, this.masterCommentId});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newsId = json['newsId'];
    userId = json['userId'];
    comment1 = json['comment1'];
    masterCommentId = json['masterCommentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['newsId'] = this.newsId;
    data['userId'] = this.userId;
    data['comment1'] = this.comment1;
    data['masterCommentId'] = this.masterCommentId;
    return data;
  }
}
