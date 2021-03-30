import 'dart:convert';

List<Cake> cakeFromJson(String str) =>
    List<Cake>.from(json.decode(str).map((x) => Cake.fromJson(x)));

String cakeToJson(List<Cake> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cake {
  Cake({
    this.id,
    this.name,
    this.type,
    this.price,
    this.deliveryType,
  });

  String id;
  String name;
  String type;
  int price;
  String deliveryType;

  factory Cake.fromJson(Map<String, dynamic> json) => Cake(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        price: json["price"],
        deliveryType: json["deliveryType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "price": price,
        "deliveryType": deliveryType,
      };
}
