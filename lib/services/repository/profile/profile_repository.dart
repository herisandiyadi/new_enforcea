import 'dart:convert';

import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/services/data_model/profile/profile_user_response.dart';
import 'package:http/http.dart' as http;

abstract class IProfileRepository {
  Future<ProfileResponse> profileUser();
}

class ProfileRepository implements IProfileRepository {
  @override
  Future<ProfileResponse> profileUser() async {
    final token = await CacheUtil.getString(cacheTOKEN);
    var url = Uri.parse('${baseURL}profile_user');
    Map<String, String> header = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(url, headers: header);

    final jsonResult = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final result = ProfileResponse.fromJson(jsonResult);

      return result;
    }

    throw Exception();
  }
}
