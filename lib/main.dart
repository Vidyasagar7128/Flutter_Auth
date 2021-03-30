import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/screens/homescreen.dart';
import 'package:shop/screens/loginscreen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => LoginScreen());
        },
        tooltip: 'Login',
        child: Icon(Icons.account_box),
      ),
    );
  }
}
