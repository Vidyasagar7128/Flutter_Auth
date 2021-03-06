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
  }

  getBake() async {
    List<Bakery> bakery = await BakeryApi.getBakeries();
    bakeries.assignAll(bakery);
  }

  loginUser(email, password) async {
    await BakeryApi.login(email.text, password.text);
    // List<Bakery> bake =
    //bakeries.assignAll(bake);
  }

  profile() async {
    var bake = await BakeryApi.getProfile();
    bakes.assignAll(bake);
  }

  getcakes() async {
    List<Cake> cake = await BakeryApi.getCakes();
    cakes.assignAll(cake);
  }
}
