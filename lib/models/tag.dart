class Tag {
  int tagId;
  String tagName;
  bool isActive;

  Tag({this.tagId, this.tagName, this.isActive});

  Tag.fromJson(Map<String, dynamic> json) {
    tagId = json['tagId'];
    tagName = json['tagName'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagId'] = this.tagId;
    data['tagName'] = this.tagName;
    data['isActive'] = this.isActive;
    return data;
  }
}
