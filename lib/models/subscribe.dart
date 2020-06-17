class Subscribe {
  int channelId;
  int userId;

  Subscribe({this.channelId, this.userId});

  Subscribe.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelId'] = this.channelId;
    data['userId'] = this.userId;
    return data;
  }
}
