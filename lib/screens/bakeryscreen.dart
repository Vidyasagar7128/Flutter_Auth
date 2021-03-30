import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shop/services/bakeryservice.dart';

class Bakery extends StatelessWidget {
  final bakeryService = Get.put(BakeryService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive'),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return data(5);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return data(3);
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
            return data(1);
          }

          return data(2);
        },
      ),
    );
  }
}

Widget data(count) {
  return GetX<BakeryService>(builder: (controller) {
    if (controller == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return GridView.builder(
        itemCount: controller.cakes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            child: Column(
              children: [
                ListTile(
                  title: Text(controller.cakes[index].name.toString()),
                  subtitle: Text(controller.cakes[index].price.toString()),
                  trailing: IconButton(
                    splashRadius: 25.0,
                    tooltip: 'Add to Cart',
                    splashColor: Colors.deepOrange[100],
                    icon: Icon(Icons.shopping_bag_outlined),
                    onPressed: () {},
                  ),
                  //dense: true,
                ),
              ],
            ),
          );
        },
      );
    }
  });
}
