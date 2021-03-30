import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shop/screens/profilescreen.dart';
import 'package:shop/services/bakeryservice.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Padding(
              padding: EdgeInsets.only(left: 400, right: 400),
              child: fields(),
            );
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return Padding(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: fields(),
            );
          }

          if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
            return Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: fields(),
            );
          }

          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: fields(),
          );
        },
      ),
    );
  }
}

Widget fields() {
  final bakeryService = Get.put(BakeryService());
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  return Form(
    key: _formKey,
    child: Card(
        elevation: 5,
        child: VxBox(
                child: VStack([
          Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 35.0),
          VxTextField(
            controller: _emailController,
            borderRadius: 50,
            prefixIcon: Icon(Icons.account_box_outlined),
            contentPaddingTop: 13,
            contentPaddingLeft: 20,
            borderType: VxTextFieldBorderType.none,
            hint: 'Username',
          ),
          SizedBox(height: 15.0),
          VxTextField(
            controller: _passwordController,
            borderRadius: 50,
            prefixIcon: Icon(Icons.remove_red_eye),
            contentPaddingTop: 13,
            contentPaddingLeft: 20,
            borderType: VxTextFieldBorderType.none,
            hint: 'Password',
            isPassword: true,
          ),
          SizedBox(height: 15.0),
          Center(
            child: MaterialButton(
                onPressed: () {
                  bakeryService.profile();
                  Get.to(ProfileScreen());
                  // bakeryService.loginUser(
                  //     _emailController, _passwordController);

                  // print(
                  //     '${_emailController.text} and ${_passwordController.text}');
                },
                child: Text('Create Account',
                    style: TextStyle(color: Colors.white)),
                color: Colors.deepOrange),
          ),
        ]).p24())
            .make()
            .centered()
            .p12()),
  );
}
