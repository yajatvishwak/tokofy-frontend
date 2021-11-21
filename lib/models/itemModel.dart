class ItemModel {
  Item item;

  ItemModel({this.item});

  ItemModel.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    return data;
  }
}

class Item {
  int id;
  String name;
  int quantity;
  String desc;
  int price;
  String image;
  int userId;

  Item({this.id, this.name, this.quantity, this.desc, this.price, this.userId});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    desc = json['desc'];
    price = json['price'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['desc'] = this.desc;
    data['price'] = this.price;

    data['user_id'] = this.userId;
    return data;
  }
}
