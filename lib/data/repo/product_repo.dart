import 'dart:convert';

import 'package:http/http.dart%20';
import 'package:skill_test_project/data/model/product.dart';

import '../service/products_service.dart';

class productRepo {
  List<Item> products = [];
  productService service = productService();
  Future<List<Item>> productList() async {
    Response responce = await service.getProductFromAPI();
    if (responce.statusCode == 200) {
      List<dynamic> data = jsonDecode(responce.body);
      // print('object$data');
      List<Item> MapData =
          (data).map((itemsds) => Item.fromJson(itemsds)).toList();
      // print('Map Data ${MapData[1].category!.index}');
      return MapData;
    } else {
      return [];
    }
  }
}
