import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/services/bakeryservice.dart';

class CakeScreen extends StatelessWidget {
  final bakeryService = Get.put(BakeryService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Abhishek Mishra'),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.cake_rounded, color: Colors.deepOrange),
                title: Text(
                  'Ice Cakes',
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.cake_rounded, color: Colors.deepOrange),
                title: Text('Normal Cakes'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Cakes'),
          actions: [
            IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () async {
                  SharedPreferences shared =
                      await SharedPreferences.getInstance();
                  shared.remove('token');
                })
          ],
        ),
        body: GetX<BakeryService>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.cakes.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.cake, color: Colors.deepOrange),
                title: Text(controller.cakes[index].name.toString()),
                subtitle: Text(controller.cakes[index].price.toString()),
                trailing: IconButton(
                  splashRadius: 25.0,
                  icon: Icon(Icons.shopping_bag_rounded, color: Colors.pink),
                  onPressed: () {},
                ),
              );
            },
          );
        }));
  }
}
