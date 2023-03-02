// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res> implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

  final RecipeState _value;
  // ignore: unused_field
  final $Res Function(RecipeState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
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
    return 'RecipeState.initial()';
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
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RecipeState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'RecipeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RecipeState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  $Res call({RecipeRoot recipeRootEntity});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_LoadSuccess));

  @override
  _$_LoadSuccess get _value => super._value as _$_LoadSuccess;

  @override
  $Res call({
    Object? recipeRootEntity = freezed,
  }) {
    return _then(_$_LoadSuccess(
      recipeRootEntity: recipeRootEntity == freezed
          ? _value.recipeRootEntity
          : recipeRootEntity // ignore: cast_nullable_to_non_nullable
              as RecipeRoot,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess({required this.recipeRootEntity});

  @override
  final RecipeRoot recipeRootEntity;

  @override
  String toString() {
    return 'RecipeState.loadSuccess(recipeRootEntity: $recipeRootEntity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            const DeepCollectionEquality()
                .equals(other.recipeRootEntity, recipeRootEntity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(recipeRootEntity));

  @JsonKey(ignore: true)
  @override
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return loadSuccess(recipeRootEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return loadSuccess?.call(recipeRootEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(recipeRootEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements RecipeState {
  const factory _LoadSuccess({required final RecipeRoot recipeRootEntity}) =
      _$_LoadSuccess;

  RecipeRoot get recipeRootEntity;
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecipeListInitialCopyWith<$Res> {
  factory _$$_RecipeListInitialCopyWith(_$_RecipeListInitial value,
          $Res Function(_$_RecipeListInitial) then) =
      __$$_RecipeListInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RecipeListInitialCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_RecipeListInitialCopyWith<$Res> {
  __$$_RecipeListInitialCopyWithImpl(
      _$_RecipeListInitial _value, $Res Function(_$_RecipeListInitial) _then)
      : super(_value, (v) => _then(v as _$_RecipeListInitial));

  @override
  _$_RecipeListInitial get _value => super._value as _$_RecipeListInitial;
}

/// @nodoc

class _$_RecipeListInitial implements _RecipeListInitial {
  const _$_RecipeListInitial();

  @override
  String toString() {
    return 'RecipeState.recipeListInitial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RecipeListInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return recipeListInitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return recipeListInitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (recipeListInitial != null) {
      return recipeListInitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return recipeListInitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return recipeListInitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (recipeListInitial != null) {
      return recipeListInitial(this);
    }
    return orElse();
  }
}

abstract class _RecipeListInitial implements RecipeState {
  const factory _RecipeListInitial() = _$_RecipeListInitial;
}

/// @nodoc
abstract class _$$_FoodAddedSuccessCopyWith<$Res> {
  factory _$$_FoodAddedSuccessCopyWith(
          _$_FoodAddedSuccess value, $Res Function(_$_FoodAddedSuccess) then) =
      __$$_FoodAddedSuccessCopyWithImpl<$Res>;
  $Res call({List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue});
}

/// @nodoc
class __$$_FoodAddedSuccessCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_FoodAddedSuccessCopyWith<$Res> {
  __$$_FoodAddedSuccessCopyWithImpl(
      _$_FoodAddedSuccess _value, $Res Function(_$_FoodAddedSuccess) _then)
      : super(_value, (v) => _then(v as _$_FoodAddedSuccess));

  @override
  _$_FoodAddedSuccess get _value => super._value as _$_FoodAddedSuccess;

  @override
  $Res call({
    Object? foodsAddedToRecipe = freezed,
    Object? carbValue = freezed,
  }) {
    return _then(_$_FoodAddedSuccess(
      foodsAddedToRecipe: foodsAddedToRecipe == freezed
          ? _value._foodsAddedToRecipe
          : foodsAddedToRecipe // ignore: cast_nullable_to_non_nullable
              as List<LocalConsumptionItem>,
      carbValue: carbValue == freezed
          ? _value.carbValue
          : carbValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_FoodAddedSuccess implements _FoodAddedSuccess {
  const _$_FoodAddedSuccess(
      {required final List<LocalConsumptionItem> foodsAddedToRecipe,
      required this.carbValue})
      : _foodsAddedToRecipe = foodsAddedToRecipe;

  final List<LocalConsumptionItem> _foodsAddedToRecipe;
  @override
  List<LocalConsumptionItem> get foodsAddedToRecipe {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodsAddedToRecipe);
  }

  @override
  final double carbValue;

  @override
  String toString() {
    return 'RecipeState.foodAddSuccess(foodsAddedToRecipe: $foodsAddedToRecipe, carbValue: $carbValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodAddedSuccess &&
            const DeepCollectionEquality()
                .equals(other._foodsAddedToRecipe, _foodsAddedToRecipe) &&
            const DeepCollectionEquality().equals(other.carbValue, carbValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foodsAddedToRecipe),
      const DeepCollectionEquality().hash(carbValue));

  @JsonKey(ignore: true)
  @override
  _$$_FoodAddedSuccessCopyWith<_$_FoodAddedSuccess> get copyWith =>
      __$$_FoodAddedSuccessCopyWithImpl<_$_FoodAddedSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return foodAddSuccess(foodsAddedToRecipe, carbValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return foodAddSuccess?.call(foodsAddedToRecipe, carbValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (foodAddSuccess != null) {
      return foodAddSuccess(foodsAddedToRecipe, carbValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return foodAddSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return foodAddSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (foodAddSuccess != null) {
      return foodAddSuccess(this);
    }
    return orElse();
  }
}

abstract class _FoodAddedSuccess implements RecipeState {
  const factory _FoodAddedSuccess(
      {required final List<LocalConsumptionItem> foodsAddedToRecipe,
      required final double carbValue}) = _$_FoodAddedSuccess;

  List<LocalConsumptionItem> get foodsAddedToRecipe;
  double get carbValue;
  @JsonKey(ignore: true)
  _$$_FoodAddedSuccessCopyWith<_$_FoodAddedSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FoodDeleteSuccessCopyWith<$Res> {
  factory _$$_FoodDeleteSuccessCopyWith(_$_FoodDeleteSuccess value,
          $Res Function(_$_FoodDeleteSuccess) then) =
      __$$_FoodDeleteSuccessCopyWithImpl<$Res>;
  $Res call({List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue});
}

/// @nodoc
class __$$_FoodDeleteSuccessCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_FoodDeleteSuccessCopyWith<$Res> {
  __$$_FoodDeleteSuccessCopyWithImpl(
      _$_FoodDeleteSuccess _value, $Res Function(_$_FoodDeleteSuccess) _then)
      : super(_value, (v) => _then(v as _$_FoodDeleteSuccess));

  @override
  _$_FoodDeleteSuccess get _value => super._value as _$_FoodDeleteSuccess;

  @override
  $Res call({
    Object? foodsAddedToRecipe = freezed,
    Object? carbValue = freezed,
  }) {
    return _then(_$_FoodDeleteSuccess(
      foodsAddedToRecipe: foodsAddedToRecipe == freezed
          ? _value._foodsAddedToRecipe
          : foodsAddedToRecipe // ignore: cast_nullable_to_non_nullable
              as List<LocalConsumptionItem>,
      carbValue: carbValue == freezed
          ? _value.carbValue
          : carbValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_FoodDeleteSuccess implements _FoodDeleteSuccess {
  const _$_FoodDeleteSuccess(
      {required final List<LocalConsumptionItem> foodsAddedToRecipe,
      required this.carbValue})
      : _foodsAddedToRecipe = foodsAddedToRecipe;

  final List<LocalConsumptionItem> _foodsAddedToRecipe;
  @override
  List<LocalConsumptionItem> get foodsAddedToRecipe {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodsAddedToRecipe);
  }

  @override
  final double carbValue;

  @override
  String toString() {
    return 'RecipeState.foodDeleteSuccess(foodsAddedToRecipe: $foodsAddedToRecipe, carbValue: $carbValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodDeleteSuccess &&
            const DeepCollectionEquality()
                .equals(other._foodsAddedToRecipe, _foodsAddedToRecipe) &&
            const DeepCollectionEquality().equals(other.carbValue, carbValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foodsAddedToRecipe),
      const DeepCollectionEquality().hash(carbValue));

  @JsonKey(ignore: true)
  @override
  _$$_FoodDeleteSuccessCopyWith<_$_FoodDeleteSuccess> get copyWith =>
      __$$_FoodDeleteSuccessCopyWithImpl<_$_FoodDeleteSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return foodDeleteSuccess(foodsAddedToRecipe, carbValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return foodDeleteSuccess?.call(foodsAddedToRecipe, carbValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (foodDeleteSuccess != null) {
      return foodDeleteSuccess(foodsAddedToRecipe, carbValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return foodDeleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return foodDeleteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (foodDeleteSuccess != null) {
      return foodDeleteSuccess(this);
    }
    return orElse();
  }
}

abstract class _FoodDeleteSuccess implements RecipeState {
  const factory _FoodDeleteSuccess(
      {required final List<LocalConsumptionItem> foodsAddedToRecipe,
      required final double carbValue}) = _$_FoodDeleteSuccess;

  List<LocalConsumptionItem> get foodsAddedToRecipe;
  double get carbValue;
  @JsonKey(ignore: true)
  _$$_FoodDeleteSuccessCopyWith<_$_FoodDeleteSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecipeSaveSuccessCopyWith<$Res> {
  factory _$$_RecipeSaveSuccessCopyWith(_$_RecipeSaveSuccess value,
          $Res Function(_$_RecipeSaveSuccess) then) =
      __$$_RecipeSaveSuccessCopyWithImpl<$Res>;
  $Res call({String successMessage});
}

/// @nodoc
class __$$_RecipeSaveSuccessCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_RecipeSaveSuccessCopyWith<$Res> {
  __$$_RecipeSaveSuccessCopyWithImpl(
      _$_RecipeSaveSuccess _value, $Res Function(_$_RecipeSaveSuccess) _then)
      : super(_value, (v) => _then(v as _$_RecipeSaveSuccess));

  @override
  _$_RecipeSaveSuccess get _value => super._value as _$_RecipeSaveSuccess;

  @override
  $Res call({
    Object? successMessage = freezed,
  }) {
    return _then(_$_RecipeSaveSuccess(
      successMessage: successMessage == freezed
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecipeSaveSuccess implements _RecipeSaveSuccess {
  const _$_RecipeSaveSuccess({required this.successMessage});

  @override
  final String successMessage;

  @override
  String toString() {
    return 'RecipeState.recipeSaveSuccess(successMessage: $successMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeSaveSuccess &&
            const DeepCollectionEquality()
                .equals(other.successMessage, successMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(successMessage));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeSaveSuccessCopyWith<_$_RecipeSaveSuccess> get copyWith =>
      __$$_RecipeSaveSuccessCopyWithImpl<_$_RecipeSaveSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return recipeSaveSuccess(successMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return recipeSaveSuccess?.call(successMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (recipeSaveSuccess != null) {
      return recipeSaveSuccess(successMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return recipeSaveSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return recipeSaveSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (recipeSaveSuccess != null) {
      return recipeSaveSuccess(this);
    }
    return orElse();
  }
}

abstract class _RecipeSaveSuccess implements RecipeState {
  const factory _RecipeSaveSuccess({required final String successMessage}) =
      _$_RecipeSaveSuccess;

  String get successMessage;
  @JsonKey(ignore: true)
  _$$_RecipeSaveSuccessCopyWith<_$_RecipeSaveSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecipeUnitListLoadedCopyWith<$Res> {
  factory _$$_RecipeUnitListLoadedCopyWith(_$_RecipeUnitListLoaded value,
          $Res Function(_$_RecipeUnitListLoaded) then) =
      __$$_RecipeUnitListLoadedCopyWithImpl<$Res>;
  $Res call({List<RecipeUnit> recipeUnitList});
}

/// @nodoc
class __$$_RecipeUnitListLoadedCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_RecipeUnitListLoadedCopyWith<$Res> {
  __$$_RecipeUnitListLoadedCopyWithImpl(_$_RecipeUnitListLoaded _value,
      $Res Function(_$_RecipeUnitListLoaded) _then)
      : super(_value, (v) => _then(v as _$_RecipeUnitListLoaded));

  @override
  _$_RecipeUnitListLoaded get _value => super._value as _$_RecipeUnitListLoaded;

  @override
  $Res call({
    Object? recipeUnitList = freezed,
  }) {
    return _then(_$_RecipeUnitListLoaded(
      recipeUnitList: recipeUnitList == freezed
          ? _value._recipeUnitList
          : recipeUnitList // ignore: cast_nullable_to_non_nullable
              as List<RecipeUnit>,
    ));
  }
}

/// @nodoc

class _$_RecipeUnitListLoaded implements _RecipeUnitListLoaded {
  const _$_RecipeUnitListLoaded(
      {required final List<RecipeUnit> recipeUnitList})
      : _recipeUnitList = recipeUnitList;

  final List<RecipeUnit> _recipeUnitList;
  @override
  List<RecipeUnit> get recipeUnitList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeUnitList);
  }

  @override
  String toString() {
    return 'RecipeState.recipeUnitListLoaded(recipeUnitList: $recipeUnitList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeUnitListLoaded &&
            const DeepCollectionEquality()
                .equals(other._recipeUnitList, _recipeUnitList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recipeUnitList));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeUnitListLoadedCopyWith<_$_RecipeUnitListLoaded> get copyWith =>
      __$$_RecipeUnitListLoadedCopyWithImpl<_$_RecipeUnitListLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return recipeUnitListLoaded(recipeUnitList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return recipeUnitListLoaded?.call(recipeUnitList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (recipeUnitListLoaded != null) {
      return recipeUnitListLoaded(recipeUnitList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return recipeUnitListLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return recipeUnitListLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (recipeUnitListLoaded != null) {
      return recipeUnitListLoaded(this);
    }
    return orElse();
  }
}

abstract class _RecipeUnitListLoaded implements RecipeState {
  const factory _RecipeUnitListLoaded(
          {required final List<RecipeUnit> recipeUnitList}) =
      _$_RecipeUnitListLoaded;

  List<RecipeUnit> get recipeUnitList;
  @JsonKey(ignore: true)
  _$$_RecipeUnitListLoadedCopyWith<_$_RecipeUnitListLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  $Res call({ErrorObject errorObject});
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, (v) => _then(v as _$_Failure));

  @override
  _$_Failure get _value => super._value as _$_Failure;

  @override
  $Res call({
    Object? errorObject = freezed,
  }) {
    return _then(_$_Failure(
      errorObject: errorObject == freezed
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject,
    ));
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure({required this.errorObject});

  @override
  final ErrorObject errorObject;

  @override
  String toString() {
    return 'RecipeState.failure(errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            const DeepCollectionEquality()
                .equals(other.errorObject, errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorObject));

  @JsonKey(ignore: true)
  @override
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return failure(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return failure?.call(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements RecipeState {
  const factory _Failure({required final ErrorObject errorObject}) = _$_Failure;

  ErrorObject get errorObject;
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetRecipeErrorCopyWith<$Res> {
  factory _$$_GetRecipeErrorCopyWith(
          _$_GetRecipeError value, $Res Function(_$_GetRecipeError) then) =
      __$$_GetRecipeErrorCopyWithImpl<$Res>;
  $Res call({ErrorObject errorObject});
}

/// @nodoc
class __$$_GetRecipeErrorCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$$_GetRecipeErrorCopyWith<$Res> {
  __$$_GetRecipeErrorCopyWithImpl(
      _$_GetRecipeError _value, $Res Function(_$_GetRecipeError) _then)
      : super(_value, (v) => _then(v as _$_GetRecipeError));

  @override
  _$_GetRecipeError get _value => super._value as _$_GetRecipeError;

  @override
  $Res call({
    Object? errorObject = freezed,
  }) {
    return _then(_$_GetRecipeError(
      errorObject: errorObject == freezed
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject,
    ));
  }
}

/// @nodoc

class _$_GetRecipeError implements _GetRecipeError {
  const _$_GetRecipeError({required this.errorObject});

  @override
  final ErrorObject errorObject;

  @override
  String toString() {
    return 'RecipeState.getRecipeFailure(errorObject: $errorObject)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRecipeError &&
            const DeepCollectionEquality()
                .equals(other.errorObject, errorObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(errorObject));

  @JsonKey(ignore: true)
  @override
  _$$_GetRecipeErrorCopyWith<_$_GetRecipeError> get copyWith =>
      __$$_GetRecipeErrorCopyWithImpl<_$_GetRecipeError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RecipeRoot recipeRootEntity) loadSuccess,
    required TResult Function() recipeListInitial,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodAddSuccess,
    required TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)
        foodDeleteSuccess,
    required TResult Function(String successMessage) recipeSaveSuccess,
    required TResult Function(List<RecipeUnit> recipeUnitList)
        recipeUnitListLoaded,
    required TResult Function(ErrorObject errorObject) failure,
    required TResult Function(ErrorObject errorObject) getRecipeFailure,
  }) {
    return getRecipeFailure(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
  }) {
    return getRecipeFailure?.call(errorObject);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RecipeRoot recipeRootEntity)? loadSuccess,
    TResult Function()? recipeListInitial,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodAddSuccess,
    TResult Function(
            List<LocalConsumptionItem> foodsAddedToRecipe, double carbValue)?
        foodDeleteSuccess,
    TResult Function(String successMessage)? recipeSaveSuccess,
    TResult Function(List<RecipeUnit> recipeUnitList)? recipeUnitListLoaded,
    TResult Function(ErrorObject errorObject)? failure,
    TResult Function(ErrorObject errorObject)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (getRecipeFailure != null) {
      return getRecipeFailure(errorObject);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_RecipeListInitial value) recipeListInitial,
    required TResult Function(_FoodAddedSuccess value) foodAddSuccess,
    required TResult Function(_FoodDeleteSuccess value) foodDeleteSuccess,
    required TResult Function(_RecipeSaveSuccess value) recipeSaveSuccess,
    required TResult Function(_RecipeUnitListLoaded value) recipeUnitListLoaded,
    required TResult Function(_Failure value) failure,
    required TResult Function(_GetRecipeError value) getRecipeFailure,
  }) {
    return getRecipeFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
  }) {
    return getRecipeFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_RecipeListInitial value)? recipeListInitial,
    TResult Function(_FoodAddedSuccess value)? foodAddSuccess,
    TResult Function(_FoodDeleteSuccess value)? foodDeleteSuccess,
    TResult Function(_RecipeSaveSuccess value)? recipeSaveSuccess,
    TResult Function(_RecipeUnitListLoaded value)? recipeUnitListLoaded,
    TResult Function(_Failure value)? failure,
    TResult Function(_GetRecipeError value)? getRecipeFailure,
    required TResult orElse(),
  }) {
    if (getRecipeFailure != null) {
      return getRecipeFailure(this);
    }
    return orElse();
  }
}

abstract class _GetRecipeError implements RecipeState {
  const factory _GetRecipeError({required final ErrorObject errorObject}) =
      _$_GetRecipeError;

  ErrorObject get errorObject;
  @JsonKey(ignore: true)
  _$$_GetRecipeErrorCopyWith<_$_GetRecipeError> get copyWith =>
      throw _privateConstructorUsedError;
}
