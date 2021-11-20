class Customer {
  String message;
  User user;

  Customer({this.message, this.user});

  Customer.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int userId;
  String role;
  String name;
  String username;
  String desc;
  String category;
  String location;
  Null picture;
  Null banner;
  String password;

  User(
      {this.userId,
      this.role,
      this.name,
      this.username,
      this.desc,
      this.category,
      this.location,
      this.picture,
      this.banner,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    role = json['role'];
    name = json['name'];
    username = json['username'];
    desc = json['desc'];
    category = json['category'];
    location = json['location'];
    picture = json['picture'];
    banner = json['banner'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['role'] = this.role;
    data['name'] = this.name;
    data['username'] = this.username;
    data['desc'] = this.desc;
    data['category'] = this.category;
    data['location'] = this.location;
    data['picture'] = this.picture;
    data['banner'] = this.banner;
    data['password'] = this.password;
    return data;
  }
}
