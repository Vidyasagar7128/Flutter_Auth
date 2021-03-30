import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shop/screens/bakeryscreen.dart';
import 'package:shop/services/bakeryservice.dart';

class HomeScreen extends StatelessWidget {
  final bakeryService = Get.put(BakeryService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
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
        centerTitle: true,
        elevation: 1,
        title: Text(
          'Shop',
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 20.0),
              icon: Icon(Icons.cake_rounded),
              onPressed: () {
                Get.to(Bakery());
              },
              splashRadius: 25.0)
        ],
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return bakeryData(5);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return bakeryData(3);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
            return bakeryData(1);
          }

          return bakeryData(2);
        },
      ),
    );
  }
}

Widget bakeryData(count) {
  return GetX<BakeryService>(builder: (controller) {
    if (controller == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return GridView.builder(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        //scrollDirection: Axis.horizontal,
        itemCount: controller.bakeries.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: Stack(
              children: [
                ListTile(
                  leading:
                      Icon(Icons.center_focus_weak_rounded, color: Colors.pink),
                  title: Text(controller.bakeries[index].name.toString()),
                  subtitle: Text(controller.bakeries[index].address.toString()),
                  trailing: IconButton(
                    splashRadius: 25.0,
                    tooltip: controller.bakeries[index].id.toString(),
                    splashColor: Colors.deepOrange[100],
                    icon: Icon(Icons.shopping_bag_outlined),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 20,
                    child: MaterialButton(
                      color: Colors.deepOrange[400],
                      onPressed: () {},
                      child: Text(
                        'Cakes',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          );
        },
      );
    }
  });
}
