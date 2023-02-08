import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_ukm_desk/services/data_model/auth/login_request.dart';
import 'package:new_ukm_desk/services/data_model/auth/login_response.dart';
import 'package:new_ukm_desk/services/data_model/auth/register_request.dart';
import 'package:new_ukm_desk/services/data_model/auth/register_response.dart';
import 'package:new_ukm_desk/services/data_model/auth/reset_password_response.dart';
import 'package:new_ukm_desk/services/data_model/auth/user_firebase_model.dart';
import 'package:new_ukm_desk/services/repository/auth/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());

      final request = LoginRequest(email: email, password: password);
      final loginResponse = await authRepository.login(request);
      final loginfbase = await authRepository.loginFB(email, password);
      emit(AuthLoaded(loginResponse, loginfbase!));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  Future<void> register(RegisterRequest request) async {
    try {
      emit(RegistLoading());
      final regisResponse = await authRepository.register(request);

      emit(RegisLoaded(regisResponse));
    } catch (e) {
      emit(RegisFailed(e.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      emit(AuthLoading());
      final resetResponse = await authRepository.resetPassword(email);
      emit(
        ResetPasswordLoaded(resetResponse),
      );
    } catch (e) {
      emit(
        ResetPasswordFailed(
          e.toString(),
        ),
      );
    }
  }
}
