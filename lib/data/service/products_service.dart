import 'package:http/http.dart' as http;

class productService {
  Future<dynamic> getProductFromAPI() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    return response;
  }
}
