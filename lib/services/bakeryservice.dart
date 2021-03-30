import 'package:get/get.dart';
import 'package:shop/models/bakery.dart';
import 'package:shop/models/cake.dart';
import '../api/bakeryapi.dart';

class BakeryService extends GetxController {
  var bakeries = <Bakery>[].obs;
  var cakes = <Cake>[].obs;
  var bakes = <Bakery>[].obs;
  @override
  void onInit() {
    super.onInit();
    getBake();
    //profile();
  }

  getBake() async {
    List<Bakery> bakery = await BakeryApi.getBakeries();
    bakeries.assignAll(bakery);
  }

  loginUser(email, password) async {
    List<Bakery> bake = await BakeryApi.login(email.text, password.text);
    bakeries.assignAll(bake);
  }

  profile() async {
    var bake = await BakeryApi.getProfile();

    bakes.assignAll(bake);
    //print(bake);
  }
}
