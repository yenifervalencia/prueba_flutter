import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const _baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProducts(int limit, int skip) async {
    final response = await http.get(
      Uri.parse('$_baseUrl?limit=$limit&skip=$skip'),
    );

    final data = json.decode(response.body);
    final List products = data['products'];
    return products.map((e) => Product.fromJson(e)).toList();
  }
}
