import 'dart:convert';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/services/data_model/product/product_response.dart';
import 'package:http/http.dart' as http;

abstract class IProductRepository {
  Future<ProductResponse> getProductList();
}

class ProductRepository implements IProductRepository {
  @override
  Future<ProductResponse> getProductList() async {
    final token = await CacheUtil.getString(cacheTOKEN);
    var url = Uri.parse('${baseURL}produk');
    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };

    final response = await http.get(url, headers: header);
    final jsonResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final result = ProductResponse.fromJson(jsonResult);

      return result;
    }
    throw Exception();
  }
}
