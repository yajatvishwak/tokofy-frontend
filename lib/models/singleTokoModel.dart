class SingleToko {
  Shop shop;

  SingleToko({this.shop});

  SingleToko.fromJson(Map<String, dynamic> json) {
    shop = json['shop'] != null ? new Shop.fromJson(json['shop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shop != null) {
      data['shop'] = this.shop.toJson();
    }
    return data;
  }
}

class Shop {
  int userId;
  String role;
  String name;
  String username;
  String desc;
  String category;
  String location;
  Null picture;
  Null banner;
  List<Items> items;

  Shop(
      {this.userId,
      this.role,
      this.name,
      this.username,
      this.desc,
      this.category,
      this.location,
      this.picture,
      this.banner,
      this.items});

  Shop.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    role = json['role'];
    name = json['name'];
    username = json['username'];
    desc = json['desc'];
    category = json['category'];
    location = json['location'];
    picture = json['picture'];
    banner = json['banner'];
    if (json['Items'] != null) {
      items = new List<Items>();
      json['Items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
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
    if (this.items != null) {
      data['Items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int id;
  String name;
  int quantity;
  String desc;
  int price;
  String image;
  int userId;

  Items(
      {this.id,
      this.name,
      this.quantity,
      this.desc,
      this.price,
      this.image,
      this.userId});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    return data;
  }
}
