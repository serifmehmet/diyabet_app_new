part of 'blood_target_cubit.dart';

@freezed
class BloodTargetState with _$BloodTargetState {
  const factory BloodTargetState.initial() = _Initial;
  const factory BloodTargetState.loading() = _Loading;

  const factory BloodTargetState.loaded({required UserBloodTarget userBloodTarget}) = _Loaded;
  const factory BloodTargetState.success({required String successMessage, required UserBloodTarget userBloodTarget}) = _Success;
  const factory BloodTargetState.failure({required ErrorObject errorObject}) = _Failure;
}
