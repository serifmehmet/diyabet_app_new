// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ErrorObject errorObject) unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ErrorObject errorObject)? unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ErrorObject errorObject)? unAuthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(UnAuthorizedUser value) unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(UnAuthorizedUser value)? unAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(UnAuthorizedUser value)? unAuthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AppState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ErrorObject errorObject) unAuthorized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ErrorObject errorObject)? unAuthorized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ErrorObject errorObject)? unAuthorized,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(UnAuthorizedUser value) unAuthorized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(UnAuthorizedUser value)? unAuthorized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(UnAuthorizedUser value)? unAuthorized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$UnAuthorizedUserCopyWith<$Res> {
  factory _$$UnAuthorizedUserCopyWith(
          _$UnAuthorizedUser value, $Res Function(_$UnAuthorizedUser) then) =
      __$$UnAuthorizedUserCopyWithImpl<$Res>;
  $Res call({ErrorObject errorObject});
}

/// @nodoc
class __$$UnAuthorizedUserCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res>
    implements _$$UnAuthorizedUserCopyWith<$Res> {
  __$$UnAuthorizedUserCopyWithImpl(
      _$UnAuthorizedUser _value, $Res Function(_$UnAuthorizedUser) _then)
      : super(_value, (v) => _then(v as _$UnAuthorizedUser));

  @override
  _$UnAuthorizedUser get _value => super._value as _$UnAuthorizedUser;

  @override
  $Res call({
    Object? errorObject = freezed,
  }) {
    return _then(_$UnAuthorizedUser(
      errorObject: errorObject == freezed
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject,
    ));
  }
}

/// @nodoc

class _$UnAuthorizedUser implements UnAuthorizedUser {
  const _$UnAuthorizedUser({required this.errorObject});

  @override
  final ErrorObject errorObject;

  @override
  String toString() {
    return 'AppState.unAuthorized(errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnAuthorizedUser &&
            const DeepCollectionEquality()
                .equals(other.errorObject, errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorObject));

  @JsonKey(ignore: true)
  @override
  _$$UnAuthorizedUserCopyWith<_$UnAuthorizedUser> get copyWith =>
      __$$UnAuthorizedUserCopyWithImpl<_$UnAuthorizedUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(ErrorObject errorObject) unAuthorized,
  }) {
    return unAuthorized(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ErrorObject errorObject)? unAuthorized,
  }) {
    return unAuthorized?.call(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(ErrorObject errorObject)? unAuthorized,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(errorObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(UnAuthorizedUser value) unAuthorized,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(UnAuthorizedUser value)? unAuthorized,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(UnAuthorizedUser value)? unAuthorized,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class UnAuthorizedUser implements AppState {
  const factory UnAuthorizedUser({required final ErrorObject errorObject}) =
      _$UnAuthorizedUser;

  ErrorObject get errorObject;
  @JsonKey(ignore: true)
  _$$UnAuthorizedUserCopyWith<_$UnAuthorizedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
