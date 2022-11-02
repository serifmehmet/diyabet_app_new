import 'package:bloc/bloc.dart';
import 'package:diyabet_app/core/init/usecase/usecase.dart';
import 'package:diyabet_app/domain/entities/favorite_food_root.dart';
import 'package:diyabet_app/domain/usecases/food/get_favorite_foods_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_foods_state.dart';
part 'favorite_foods_cubit.freezed.dart';

class FavoriteFoodsCubit extends Cubit<FavoriteFoodsState> {
  FavoriteFoodsCubit({required GetFavoriteFoodsUsecase getFavoriteFoodsUsecase})
      : _getFavoriteFoodsUsecase = getFavoriteFoodsUsecase,
        super(const FavoriteFoodsState.loading()) {
    getFavoriteFoods();
  }

  final GetFavoriteFoodsUsecase _getFavoriteFoodsUsecase;

  Future<void> getFavoriteFoods() async {
    final res = await _getFavoriteFoodsUsecase.call(const NoParams());
    if (res.favoriteFoods!.isEmpty) {
      emit(const EmptyFavoriteFoods(
          emptyListMessage: "Henüz eklediğiniz bir besin bulunmamakta. Eklemeye arama ekranından besin arayarak başlayabilirsiniz."));
    } else {
      emit(FavoriteFoodsLoaded(favoriteFood: res));
    }
  }
}
