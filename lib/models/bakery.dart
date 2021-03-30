import 'dart:convert';

List<Bakery> bakeryFromJson(String str) =>
    List<Bakery>.from(json.decode(str).map((x) => Bakery.fromJson(x)));

String bakeryToJson(List<Bakery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bakery {
  Bakery({
    this.cakes,
    this.id,
    this.name,
    this.location,
    this.address,
    this.email,
    this.mobile,
    this.createdAt,
  });

  List<dynamic> cakes;
  String id;
  String name;
  String location;
  String address;
  String email;
  int mobile;
  DateTime createdAt;

  factory Bakery.fromJson(Map<String, dynamic> json) => Bakery(
        cakes: List<dynamic>.from(json["cakes"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        location: json["location"],
        address: json["address"],
        email: json["email"],
        mobile: json["mobile"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "cakes": List<dynamic>.from(cakes.map((x) => x)),
        "_id": id,
        "name": name,
        "location": location,
        "address": address,
        "email": email,
        "mobile": mobile,
        "createdAt": createdAt.toIso8601String(),
      };
}
