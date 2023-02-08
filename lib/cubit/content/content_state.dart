part of 'content_cubit.dart';

abstract class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object> get props => [];
}

class ContentInitial extends ContentState {}

class ContentLoading extends ContentState {}

class ContentLoaded extends ContentState {
  final ContentResponse contentResponse;
  const ContentLoaded(this.contentResponse);

  @override
  List<Object> get props => [contentResponse];
}

class ContentFailed extends ContentState {
  final String message;
  const ContentFailed(this.message);

  @override
  List<Object> get props => [message];
}
