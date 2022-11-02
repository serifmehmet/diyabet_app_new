part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.profileUpdateError({required String errorMessage}) = ProfileUpdateError;
  const factory ProfileState.profileUpdated({required String message}) = ProfileUpdated;
}
