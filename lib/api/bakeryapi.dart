import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop/models/bakery.dart';

class BakeryApi {
  static Future<List<Bakery>> getBakeries() async {
    var res = await http.get(Uri.http('localhost:3000', '/bakery'));
    var data = res.body;
    print(data);
    return bakeryFromJson(data);
  }

  static login(email, password) async {
    var res = await http.post(Uri.http('localhost:3000', '/login'),
        //headers: {'Content-type': 'application/json'},
        body: {'email': email, "password": password});

    var data = jsonEncode(res.body);
    print(data);
    return bakeryFromJson(data);
  }

  static Future<List<Bakery>> getProfile() async {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNoYXVkaGFyeXN3ZWV0c0BnbWFpbC5jb20iLCJpYXQiOjE2MTY2MDQzMDR9.GJ30RvGkSNkCWm0Pq3DgfUAU0p8rxOoXa9nZmpDbkKc';
    var res = await http.get(Uri.http('localhost:3000', '/find'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var data = res.body;
    print(data);
    return bakeryFromJson(data);
  }
}

//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImdvYWFzc3dlZXRzQGdtYWlsLmNvbSIsImlhdCI6MTYxNzA4ODYwNn0.YPpRzrGVX8dinftssdceExBu74b-Vf3JlnHO9HCJWnU
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNoYXVkaGFyeXN3ZWV0c0BnbWFpbC5jb20iLCJpYXQiOjE2MTY2MDQzMDR9.GJ30RvGkSNkCWm0Pq3DgfUAU0p8rxOoXa9nZmpDbkKc
