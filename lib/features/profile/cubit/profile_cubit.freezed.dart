// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMessage) profileUpdateError,
    required TResult Function(String message) profileUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileUpdateError value) profileUpdateError,
    required TResult Function(ProfileUpdated value) profileUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  final ProfileState _value;
  // ignore: unused_field
  final $Res Function(ProfileState) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ProfileState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMessage) profileUpdateError,
    required TResult Function(String message) profileUpdated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileUpdateError value) profileUpdateError,
    required TResult Function(ProfileUpdated value) profileUpdated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ProfileState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res> extends _$ProfileStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMessage) profileUpdateError,
    required TResult Function(String message) profileUpdated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileUpdateError value) profileUpdateError,
    required TResult Function(ProfileUpdated value) profileUpdated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ProfileState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ProfileUpdateErrorCopyWith<$Res> {
  factory _$$ProfileUpdateErrorCopyWith(_$ProfileUpdateError value,
          $Res Function(_$ProfileUpdateError) then) =
      __$$ProfileUpdateErrorCopyWithImpl<$Res>;
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ProfileUpdateErrorCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements _$$ProfileUpdateErrorCopyWith<$Res> {
  __$$ProfileUpdateErrorCopyWithImpl(
      _$ProfileUpdateError _value, $Res Function(_$ProfileUpdateError) _then)
      : super(_value, (v) => _then(v as _$ProfileUpdateError));

  @override
  _$ProfileUpdateError get _value => super._value as _$ProfileUpdateError;

  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ProfileUpdateError(
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileUpdateError implements ProfileUpdateError {
  const _$ProfileUpdateError({required this.errorMessage});

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProfileState.profileUpdateError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdateError &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorMessage));

  @JsonKey(ignore: true)
  @override
  _$$ProfileUpdateErrorCopyWith<_$ProfileUpdateError> get copyWith =>
      __$$ProfileUpdateErrorCopyWithImpl<_$ProfileUpdateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMessage) profileUpdateError,
    required TResult Function(String message) profileUpdated,
  }) {
    return profileUpdateError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
  }) {
    return profileUpdateError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
    required TResult orElse(),
  }) {
    if (profileUpdateError != null) {
      return profileUpdateError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileUpdateError value) profileUpdateError,
    required TResult Function(ProfileUpdated value) profileUpdated,
  }) {
    return profileUpdateError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
  }) {
    return profileUpdateError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
    required TResult orElse(),
  }) {
    if (profileUpdateError != null) {
      return profileUpdateError(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdateError implements ProfileState {
  const factory ProfileUpdateError({required final String errorMessage}) =
      _$ProfileUpdateError;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$ProfileUpdateErrorCopyWith<_$ProfileUpdateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileUpdatedCopyWith<$Res> {
  factory _$$ProfileUpdatedCopyWith(
          _$ProfileUpdated value, $Res Function(_$ProfileUpdated) then) =
      __$$ProfileUpdatedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$ProfileUpdatedCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res>
    implements _$$ProfileUpdatedCopyWith<$Res> {
  __$$ProfileUpdatedCopyWithImpl(
      _$ProfileUpdated _value, $Res Function(_$ProfileUpdated) _then)
      : super(_value, (v) => _then(v as _$ProfileUpdated));

  @override
  _$ProfileUpdated get _value => super._value as _$ProfileUpdated;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ProfileUpdated(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileUpdated implements ProfileUpdated {
  const _$ProfileUpdated({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState.profileUpdated(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdated &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$ProfileUpdatedCopyWith<_$ProfileUpdated> get copyWith =>
      __$$ProfileUpdatedCopyWithImpl<_$ProfileUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String errorMessage) profileUpdateError,
    required TResult Function(String message) profileUpdated,
  }) {
    return profileUpdated(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
  }) {
    return profileUpdated?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String errorMessage)? profileUpdateError,
    TResult Function(String message)? profileUpdated,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(ProfileUpdateError value) profileUpdateError,
    required TResult Function(ProfileUpdated value) profileUpdated,
  }) {
    return profileUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
  }) {
    return profileUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(ProfileUpdateError value)? profileUpdateError,
    TResult Function(ProfileUpdated value)? profileUpdated,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(this);
    }
    return orElse();
  }
}

abstract class ProfileUpdated implements ProfileState {
  const factory ProfileUpdated({required final String message}) =
      _$ProfileUpdated;

  String get message;
  @JsonKey(ignore: true)
  _$$ProfileUpdatedCopyWith<_$ProfileUpdated> get copyWith =>
      throw _privateConstructorUsedError;
}
