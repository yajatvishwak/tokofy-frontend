class RetailerOrder {
  int id;
  int userId;
  int sellerId;
  String status;
  int itemId;
  String createdAt;
  String updatedAt;
  Item item;
  User user;

  RetailerOrder(
      {this.id,
      this.userId,
      this.sellerId,
      this.status,
      this.itemId,
      this.createdAt,
      this.updatedAt,
      this.item,
      this.user});

  RetailerOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sellerId = json['seller_id'];
    status = json['status'];
    itemId = json['item_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['seller_id'] = this.sellerId;
    data['status'] = this.status;
    data['item_id'] = this.itemId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Item {
  int id;
  String name;

  Item({this.id, this.name});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class User {
  String name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
