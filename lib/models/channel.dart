class Channel {
  int channelId;
  String channelName;
  int groupId;
  bool isActive;

  Channel({this.channelId, this.channelName, this.groupId, this.isActive});

  Channel.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'];
    channelName = json['channelName'];
    groupId = json['groupId'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['channelId'] = this.channelId;
    data['channelName'] = this.channelName;
    data['groupId'] = this.groupId;
    data['isActive'] = this.isActive;
    return data;
  }
}