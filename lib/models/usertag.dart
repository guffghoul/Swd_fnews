class UserTag {
  int userId;
  int tagId;

  UserTag({this.userId, this.tagId});

  UserTag.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    tagId = json['tagId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['tagId'] = this.tagId;
    return data;
  }
}
