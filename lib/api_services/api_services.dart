import 'dart:developer';

import 'package:getx_demo/model/store_model.dart';
import 'package:http/http.dart' as http;

import '../model/products.dart';

class ApiServices {
  static Future<List<Products>?> getProducts() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"),
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productsFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<StoreModel>?> getFakeStore() async {
    http.Response response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );
    if (response.statusCode == 200) {
      var jsonStore = response.body;
      log(response.body);
      return storeFromJson(jsonStore);
    } else {
      return null;
    }
  }
}
