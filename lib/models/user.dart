class User {
  int userId;
  String email;
  bool isAdmin;
  int groupId;
  bool isActive;
  String password;

  User({this.userId, this.email, this.isAdmin, this.groupId, this.isActive, this.password});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    email = json['email'];
    isAdmin = json['isAdmin'];
    groupId = json['groupId'];
    isActive = json['isActive'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['isAdmin'] = this.isAdmin;
    data['groupId'] = this.groupId;
    data['isActive'] = this.isActive;
    data['password'] = this.password;
    return data;
  }
}