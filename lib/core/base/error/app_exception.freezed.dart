// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverException,
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponseList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerException value) serverException,
    required TResult Function(UnAuthorized value) unAuthorized,
    required TResult Function(EmptyResponseList value) emptyResponseList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res> implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  final AppException _value;
  // ignore: unused_field
  final $Res Function(AppException) _then;
}

/// @nodoc
abstract class _$$ServerExceptionCopyWith<$Res> {
  factory _$$ServerExceptionCopyWith(
          _$ServerException value, $Res Function(_$ServerException) then) =
      __$$ServerExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerExceptionCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$ServerExceptionCopyWith<$Res> {
  __$$ServerExceptionCopyWithImpl(
      _$ServerException _value, $Res Function(_$ServerException) _then)
      : super(_value, (v) => _then(v as _$ServerException));

  @override
  _$ServerException get _value => super._value as _$ServerException;
}

/// @nodoc

class _$ServerException implements ServerException {
  const _$ServerException();

  @override
  String toString() {
    return 'AppException.serverException()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerException);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverException,
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponseList,
  }) {
    return serverException();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
  }) {
    return serverException?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerException value) serverException,
    required TResult Function(UnAuthorized value) unAuthorized,
    required TResult Function(EmptyResponseList value) emptyResponseList,
  }) {
    return serverException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
  }) {
    return serverException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(this);
    }
    return orElse();
  }
}

abstract class ServerException implements AppException {
  const factory ServerException() = _$ServerException;
}

/// @nodoc
abstract class _$$UnAuthorizedCopyWith<$Res> {
  factory _$$UnAuthorizedCopyWith(
          _$UnAuthorized value, $Res Function(_$UnAuthorized) then) =
      __$$UnAuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnAuthorizedCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$UnAuthorizedCopyWith<$Res> {
  __$$UnAuthorizedCopyWithImpl(
      _$UnAuthorized _value, $Res Function(_$UnAuthorized) _then)
      : super(_value, (v) => _then(v as _$UnAuthorized));

  @override
  _$UnAuthorized get _value => super._value as _$UnAuthorized;
}

/// @nodoc

class _$UnAuthorized implements UnAuthorized {
  const _$UnAuthorized();

  @override
  String toString() {
    return 'AppException.unAuthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnAuthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverException,
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponseList,
  }) {
    return unAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
  }) {
    return unAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
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
    required TResult Function(ServerException value) serverException,
    required TResult Function(UnAuthorized value) unAuthorized,
    required TResult Function(EmptyResponseList value) emptyResponseList,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class UnAuthorized implements AppException {
  const factory UnAuthorized() = _$UnAuthorized;
}

/// @nodoc
abstract class _$$EmptyResponseListCopyWith<$Res> {
  factory _$$EmptyResponseListCopyWith(
          _$EmptyResponseList value, $Res Function(_$EmptyResponseList) then) =
      __$$EmptyResponseListCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyResponseListCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$EmptyResponseListCopyWith<$Res> {
  __$$EmptyResponseListCopyWithImpl(
      _$EmptyResponseList _value, $Res Function(_$EmptyResponseList) _then)
      : super(_value, (v) => _then(v as _$EmptyResponseList));

  @override
  _$EmptyResponseList get _value => super._value as _$EmptyResponseList;
}

/// @nodoc

class _$EmptyResponseList implements EmptyResponseList {
  const _$EmptyResponseList();

  @override
  String toString() {
    return 'AppException.emptyResponseList()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyResponseList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() serverException,
    required TResult Function() unAuthorized,
    required TResult Function() emptyResponseList,
  }) {
    return emptyResponseList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
  }) {
    return emptyResponseList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? serverException,
    TResult Function()? unAuthorized,
    TResult Function()? emptyResponseList,
    required TResult orElse(),
  }) {
    if (emptyResponseList != null) {
      return emptyResponseList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerException value) serverException,
    required TResult Function(UnAuthorized value) unAuthorized,
    required TResult Function(EmptyResponseList value) emptyResponseList,
  }) {
    return emptyResponseList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
  }) {
    return emptyResponseList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerException value)? serverException,
    TResult Function(UnAuthorized value)? unAuthorized,
    TResult Function(EmptyResponseList value)? emptyResponseList,
    required TResult orElse(),
  }) {
    if (emptyResponseList != null) {
      return emptyResponseList(this);
    }
    return orElse();
  }
}

abstract class EmptyResponseList implements AppException {
  const factory EmptyResponseList() = _$EmptyResponseList;
}
