import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/services/data_model/content/content_response.dart';

abstract class IcontentRepository {
  Future<ContentResponse> getContent();
}

class ContentRepository implements IcontentRepository {
  @override
  Future<ContentResponse> getContent() async {
    final token = await CacheUtil.getString(cacheTOKEN);
    var url = Uri.parse('${baseURL}news_list?pages=1');
    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(url, headers: header);
    final jsonResult = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final result = ContentResponse.fromJson(jsonResult);
      return result;
    }
    throw Exception();
  }
}
