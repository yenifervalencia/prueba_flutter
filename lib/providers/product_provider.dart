import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> products = [];
  int _limit = 15;
  int _skip = 0;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> loadMoreProducts() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    notifyListeners();

    final newProducts = await _apiService.fetchProducts(_limit, _skip);

    products.addAll(newProducts);
    _skip += _limit;

    if (newProducts.length < _limit) {
      hasMore = false;
    }

    isLoading = false;
    notifyListeners();
  }
}
