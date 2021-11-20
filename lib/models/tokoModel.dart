class Toko {
  int userId;
  String role;
  String name;
  String username;
  String desc;
  String category;
  String location;
  Null picture;
  Null banner;

  Toko({
    this.userId,
    this.role,
    this.name,
    this.username,
    this.desc,
    this.category,
    this.location,
    this.picture,
    this.banner,
  });

  Toko.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    role = json['role'];
    name = json['name'];
    username = json['username'];
    desc = json['desc'];
    category = json['category'];
    location = json['location'];
    picture = json['picture'];
    banner = json['banner'];
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
    return data;
  }
}
