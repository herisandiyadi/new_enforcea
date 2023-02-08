import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_ukm_desk/constants/cache_utils.dart';
import 'package:new_ukm_desk/constants/constants.dart';
import 'package:new_ukm_desk/services/data_model/auth/login_request.dart';
import 'package:new_ukm_desk/services/data_model/auth/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:new_ukm_desk/services/data_model/auth/register_request.dart';
import 'package:new_ukm_desk/services/data_model/auth/register_response.dart';
import 'package:new_ukm_desk/services/data_model/auth/reset_password_response.dart';
import 'package:new_ukm_desk/services/data_model/auth/user_firebase_model.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(LoginRequest request);
  Future<RegisterResponse> register(RegisterRequest request);
  Future<ResetPasswordResponse> resetPassword(String email);
  // Future<UserInfo> loginFB(String email, String password);
  // Future<UserInfo> registerFB(String email, String password);
}

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    final body = jsonEncode(<String, String>{
      'email': request.email,
      'password': request.password,
      'device': 'ios'
    });
    var url = Uri.parse('${baseURL}login');

    final response = await http.post(
      url,
      body: body,
    );
    final jsonResult = json.decode(response.body);

    if (response.statusCode == 200) {
      CacheUtil.putString(cacheTOKEN, jsonResult["api_token"]);
      CacheUtil.putBoolean(cacheIsLogin, true);
      final data = LoginResponse.fromJson(jsonResult);
      return data;
    }

    throw Exception(jsonResult['message']);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final body = jsonEncode(request);
    final url = Uri.parse('${baseURL}registrasi');
    final response = await http.post(url, body: body);

    final jsonResult = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final data = RegisterResponse.fromJson(jsonResult);

      return data;
    }

    throw Exception(jsonResult['message']);
  }

  UserFirebase? _userFirebase(User user) {
    if (user != null) {
      return UserFirebase(userId: user.uid);
    } else {
      return null;
    }
  }

  Future<UserFirebase?> loginFB(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;

      return _userFirebase(firebaseUser!);
    } catch (e) {
      throw UnimplementedError(e.toString());
    }
  }

  Future registerFB(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFirebase(user!);
    } catch (e) {
      Exception(e.toString());
    }
  }

  @override
  Future<ResetPasswordResponse> resetPassword(String email) async {
    final url = Uri.parse('${baseURL}change_password');
    final body = jsonEncode(<String, dynamic>{"email": email});

    final response = await http.post(url, body: body);
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final jsonResult = ResetPasswordResponse.fromJson(json);
      return jsonResult;
    }

    throw UnimplementedError(json['message']);
  }
}
