import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:new_ukm_desk/services/data_model/profile/profile_user_response.dart';
import 'package:new_ukm_desk/services/repository/profile/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit(this.profileRepository) : super(ProfileInitial());

  Future<void> getProfile() async {
    try {
      emit(ProfileLoading());
      final profileResult = await profileRepository.profileUser();
      emit(ProfileLoaded(profileResult));
    } catch (e) {
      emit(ProfileFailed(e.toString()));
    }
  }
}
