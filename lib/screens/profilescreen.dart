import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/services/bakeryservice.dart';

class ProfileScreen extends StatelessWidget {
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
        title: Text('Bakery'),
      ),
      body: Center(
        child: GetX<BakeryService>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.bakes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.bakes[index].name.toString()),
                subtitle: Text(controller.bakes[index].email.toString()),
                trailing: IconButton(
                  splashRadius: 25.0,
                  icon: Icon(Icons.logout),
                  tooltip: 'Logout',
                  onPressed: () async {
                    SharedPreferences shared =
                        await SharedPreferences.getInstance();
                    shared.remove('token');
                    //Get.defaultDialog();
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
//"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImluZGlhbnN3ZWV0c0BnbWFpbC5jb20iLCJpYXQiOjE2MTcyNjYwNzN9.V0mlUlQfHgXIdy3gIy3eLKFk6lfYpJW1WmiBtNu3Lhc"
//flutter.token
