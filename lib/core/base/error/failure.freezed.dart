// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnAuthorizedError value) unAuthorized,
    required TResult Function(EmptyResponseError value) emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnAuthorizedError value)? unAuthorized,
    TResult Function(EmptyResponseError value)? emptyResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnAuthorizedError value)? unAuthorized,
    TResult Function(EmptyResponseError value)? emptyResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

/// @nodoc
abstract class _$$UnAuthorizedErrorCopyWith<$Res> {
  factory _$$UnAuthorizedErrorCopyWith(
          _$UnAuthorizedError value, $Res Function(_$UnAuthorizedError) then) =
      __$$UnAuthorizedErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnAuthorizedErrorCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$$UnAuthorizedErrorCopyWith<$Res> {
  __$$UnAuthorizedErrorCopyWithImpl(
      _$UnAuthorizedError _value, $Res Function(_$UnAuthorizedError) _then)
      : super(_value, (v) => _then(v as _$UnAuthorizedError));

  @override
  _$UnAuthorizedError get _value => super._value as _$UnAuthorizedError;
}

/// @nodoc

class _$UnAuthorizedError extends UnAuthorizedError {
  const _$UnAuthorizedError() : super._();

  @override
  String toString() {
    return 'Failure.unAuthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnAuthorizedError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponse,
  }) {
    return unAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponse,
  }) {
    return unAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnAuthorizedError value) unAuthorized,
    required TResult Function(EmptyResponseError value) emptyResponse,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnAuthorizedError value)? unAuthorized,
    TResult Function(EmptyResponseError value)? emptyResponse,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnAuthorizedError value)? unAuthorized,
    TResult Function(EmptyResponseError value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class UnAuthorizedError extends Failure {
  const factory UnAuthorizedError() = _$UnAuthorizedError;
  const UnAuthorizedError._() : super._();
}

/// @nodoc
abstract class _$$EmptyResponseErrorCopyWith<$Res> {
  factory _$$EmptyResponseErrorCopyWith(_$EmptyResponseError value,
          $Res Function(_$EmptyResponseError) then) =
      __$$EmptyResponseErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyResponseErrorCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res>
    implements _$$EmptyResponseErrorCopyWith<$Res> {
  __$$EmptyResponseErrorCopyWithImpl(
      _$EmptyResponseError _value, $Res Function(_$EmptyResponseError) _then)
      : super(_value, (v) => _then(v as _$EmptyResponseError));

  @override
  _$EmptyResponseError get _value => super._value as _$EmptyResponseError;
}

/// @nodoc

class _$EmptyResponseError extends EmptyResponseError {
  const _$EmptyResponseError() : super._();

  @override
  String toString() {
    return 'Failure.emptyResponse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyResponseError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponse,
  }) {
    return emptyResponse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponse,
  }) {
    return emptyResponse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponse,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UnAuthorizedError value) unAuthorized,
    required TResult Function(EmptyResponseError value) emptyResponse,
  }) {
    return emptyResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UnAuthorizedError value)? unAuthorized,
    TResult Function(EmptyResponseError value)? emptyResponse,
  }) {
    return emptyResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UnAuthorizedError value)? unAuthorized,
    TResult Function(EmptyResponseError value)? emptyResponse,
    required TResult orElse(),
  }) {
    if (emptyResponse != null) {
      return emptyResponse(this);
    }
    return orElse();
  }
}

abstract class EmptyResponseError extends Failure {
  const factory EmptyResponseError() = _$EmptyResponseError;
  const EmptyResponseError._() : super._();
}
