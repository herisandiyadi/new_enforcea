import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ukm_desk/services/data_model/content/content_response.dart';
import 'package:new_ukm_desk/services/repository/content/content_repository.dart';

part 'content_state.dart';

class ContentCubit extends Cubit<ContentState> {
  final ContentRepository contentRepository;
  ContentCubit(this.contentRepository) : super(ContentInitial());

  Future<void> getContent() async {
    try {
      emit(ContentLoading());
      final response = await contentRepository.getContent();
      emit(ContentLoaded(response));
    } catch (e) {
      emit(ContentFailed(e.toString()));
    }
  }
}
