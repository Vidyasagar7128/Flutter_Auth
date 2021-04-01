import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/models/bakery.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/models/cake.dart';

class BakeryApi {
  static Future<List<Bakery>> getBakeries() async {
    var res = await http
        .get(Uri.http('localhost:3000', '/bakery'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': "*/*",
      'connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
    });
    var data = res.body;

    print(data.length);
    return bakeryFromJson(data);
  }

  static login(email, password) async {
    var res = await http.post(Uri.http('localhost:3000', '/login'), body: {
      'email': email,
      'password': password,
    });
    SharedPreferences shared = await SharedPreferences.getInstance();
    var data = res.body;
    var jsonData = jsonDecode(data);
    await shared.setString('token', jsonData['token']);
    var sR1 = shared.getString('token');
    print('from SR $sR1');

    print(jsonData['token']);
  }

  static Future<List<Bakery>> getProfile() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    var sR1 = shared.getString('token');
    var res = await http.get(Uri.http('localhost:3000', '/find'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $sR1',
    });

    var data = res.body;
    //var jsonData = jsonDecode(data);
    print(data);
    print('from Decode ======= ${data.runtimeType}');

    return bakeryFromJson(data);
  }

  static Future<List<Cake>> getCakes() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    var sR1 = shared.getString('token');
    var res = await http.get(Uri.http('localhost:3000', '/cakes'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $sR1',
    });
    var data = res.body;

    print(data);
    return cakeFromJson(data);
  }
}
//goaassweets@gmail.com
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImdvYWFzc3dlZXRzQGdtYWlsLmNvbSIsImlhdCI6MTYxNzA4ODYwNn0.YPpRzrGVX8dinftssdceExBu74b-Vf3JlnHO9HCJWnU
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNoYXVkaGFyeXN3ZWV0c0BnbWFpbC5jb20iLCJpYXQiOjE2MTY2MDQzMDR9.GJ30RvGkSNkCWm0Pq3DgfUAU0p8rxOoXa9nZmpDbkKc
