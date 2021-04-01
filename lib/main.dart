import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/screens/homescreen.dart';
import 'package:shop/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/screens/profilescreen.dart';
import 'package:shop/services/bakeryservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, primaryColor: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bakeryService = Get.put(BakeryService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences shared = await SharedPreferences.getInstance();
          var sR1 = shared.getString('token');
          if (sR1 == null) {
            Get.to(() => LoginScreen());
          } else {
            bakeryService.profile();
            Get.to(() => ProfileScreen());
          }
        },
        tooltip: 'Login',
        child: Icon(Icons.account_box),
      ),
    );
  }
}
