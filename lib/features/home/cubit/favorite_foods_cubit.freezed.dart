// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_foods_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteFoodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String emptyListMessage) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodRoot favoriteFood)
        favoriteFoodsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(EmptyFavoriteFoods value) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodsLoaded value) favoriteFoodsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteFoodsStateCopyWith<$Res> {
  factory $FavoriteFoodsStateCopyWith(
          FavoriteFoodsState value, $Res Function(FavoriteFoodsState) then) =
      _$FavoriteFoodsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteFoodsStateCopyWithImpl<$Res>
    implements $FavoriteFoodsStateCopyWith<$Res> {
  _$FavoriteFoodsStateCopyWithImpl(this._value, this._then);

  final FavoriteFoodsState _value;
  // ignore: unused_field
  final $Res Function(FavoriteFoodsState) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$FavoriteFoodsStateCopyWithImpl<$Res>
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
    return 'FavoriteFoodsState.loading()';
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
    required TResult Function() loading,
    required TResult Function(String emptyListMessage) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodRoot favoriteFood)
        favoriteFoodsLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
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
    required TResult Function(Loading value) loading,
    required TResult Function(EmptyFavoriteFoods value) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodsLoaded value) favoriteFoodsLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements FavoriteFoodsState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$EmptyFavoriteFoodsCopyWith<$Res> {
  factory _$$EmptyFavoriteFoodsCopyWith(_$EmptyFavoriteFoods value,
          $Res Function(_$EmptyFavoriteFoods) then) =
      __$$EmptyFavoriteFoodsCopyWithImpl<$Res>;
  $Res call({String emptyListMessage});
}

/// @nodoc
class __$$EmptyFavoriteFoodsCopyWithImpl<$Res>
    extends _$FavoriteFoodsStateCopyWithImpl<$Res>
    implements _$$EmptyFavoriteFoodsCopyWith<$Res> {
  __$$EmptyFavoriteFoodsCopyWithImpl(
      _$EmptyFavoriteFoods _value, $Res Function(_$EmptyFavoriteFoods) _then)
      : super(_value, (v) => _then(v as _$EmptyFavoriteFoods));

  @override
  _$EmptyFavoriteFoods get _value => super._value as _$EmptyFavoriteFoods;

  @override
  $Res call({
    Object? emptyListMessage = freezed,
  }) {
    return _then(_$EmptyFavoriteFoods(
      emptyListMessage: emptyListMessage == freezed
          ? _value.emptyListMessage
          : emptyListMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmptyFavoriteFoods implements EmptyFavoriteFoods {
  const _$EmptyFavoriteFoods({required this.emptyListMessage});

  @override
  final String emptyListMessage;

  @override
  String toString() {
    return 'FavoriteFoodsState.emptyFavoriteFoods(emptyListMessage: $emptyListMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyFavoriteFoods &&
            const DeepCollectionEquality()
                .equals(other.emptyListMessage, emptyListMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(emptyListMessage));

  @JsonKey(ignore: true)
  @override
  _$$EmptyFavoriteFoodsCopyWith<_$EmptyFavoriteFoods> get copyWith =>
      __$$EmptyFavoriteFoodsCopyWithImpl<_$EmptyFavoriteFoods>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String emptyListMessage) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodRoot favoriteFood)
        favoriteFoodsLoaded,
  }) {
    return emptyFavoriteFoods(emptyListMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
  }) {
    return emptyFavoriteFoods?.call(emptyListMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) {
    if (emptyFavoriteFoods != null) {
      return emptyFavoriteFoods(emptyListMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(EmptyFavoriteFoods value) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodsLoaded value) favoriteFoodsLoaded,
  }) {
    return emptyFavoriteFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
  }) {
    return emptyFavoriteFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) {
    if (emptyFavoriteFoods != null) {
      return emptyFavoriteFoods(this);
    }
    return orElse();
  }
}

abstract class EmptyFavoriteFoods implements FavoriteFoodsState {
  const factory EmptyFavoriteFoods({required final String emptyListMessage}) =
      _$EmptyFavoriteFoods;

  String get emptyListMessage;
  @JsonKey(ignore: true)
  _$$EmptyFavoriteFoodsCopyWith<_$EmptyFavoriteFoods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoriteFoodsLoadedCopyWith<$Res> {
  factory _$$FavoriteFoodsLoadedCopyWith(_$FavoriteFoodsLoaded value,
          $Res Function(_$FavoriteFoodsLoaded) then) =
      __$$FavoriteFoodsLoadedCopyWithImpl<$Res>;
  $Res call({FavoriteFoodRoot favoriteFood});
}

/// @nodoc
class __$$FavoriteFoodsLoadedCopyWithImpl<$Res>
    extends _$FavoriteFoodsStateCopyWithImpl<$Res>
    implements _$$FavoriteFoodsLoadedCopyWith<$Res> {
  __$$FavoriteFoodsLoadedCopyWithImpl(
      _$FavoriteFoodsLoaded _value, $Res Function(_$FavoriteFoodsLoaded) _then)
      : super(_value, (v) => _then(v as _$FavoriteFoodsLoaded));

  @override
  _$FavoriteFoodsLoaded get _value => super._value as _$FavoriteFoodsLoaded;

  @override
  $Res call({
    Object? favoriteFood = freezed,
  }) {
    return _then(_$FavoriteFoodsLoaded(
      favoriteFood: favoriteFood == freezed
          ? _value.favoriteFood
          : favoriteFood // ignore: cast_nullable_to_non_nullable
              as FavoriteFoodRoot,
    ));
  }
}

/// @nodoc

class _$FavoriteFoodsLoaded implements FavoriteFoodsLoaded {
  const _$FavoriteFoodsLoaded({required this.favoriteFood});

  @override
  final FavoriteFoodRoot favoriteFood;

  @override
  String toString() {
    return 'FavoriteFoodsState.favoriteFoodsLoaded(favoriteFood: $favoriteFood)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteFoodsLoaded &&
            const DeepCollectionEquality()
                .equals(other.favoriteFood, favoriteFood));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(favoriteFood));

  @JsonKey(ignore: true)
  @override
  _$$FavoriteFoodsLoadedCopyWith<_$FavoriteFoodsLoaded> get copyWith =>
      __$$FavoriteFoodsLoadedCopyWithImpl<_$FavoriteFoodsLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String emptyListMessage) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodRoot favoriteFood)
        favoriteFoodsLoaded,
  }) {
    return favoriteFoodsLoaded(favoriteFood);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
  }) {
    return favoriteFoodsLoaded?.call(favoriteFood);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String emptyListMessage)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodRoot favoriteFood)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) {
    if (favoriteFoodsLoaded != null) {
      return favoriteFoodsLoaded(favoriteFood);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading value) loading,
    required TResult Function(EmptyFavoriteFoods value) emptyFavoriteFoods,
    required TResult Function(FavoriteFoodsLoaded value) favoriteFoodsLoaded,
  }) {
    return favoriteFoodsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
  }) {
    return favoriteFoodsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading value)? loading,
    TResult Function(EmptyFavoriteFoods value)? emptyFavoriteFoods,
    TResult Function(FavoriteFoodsLoaded value)? favoriteFoodsLoaded,
    required TResult orElse(),
  }) {
    if (favoriteFoodsLoaded != null) {
      return favoriteFoodsLoaded(this);
    }
    return orElse();
  }
}

abstract class FavoriteFoodsLoaded implements FavoriteFoodsState {
  const factory FavoriteFoodsLoaded(
      {required final FavoriteFoodRoot favoriteFood}) = _$FavoriteFoodsLoaded;

  FavoriteFoodRoot get favoriteFood;
  @JsonKey(ignore: true)
  _$$FavoriteFoodsLoadedCopyWith<_$FavoriteFoodsLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}
