import 'package:diyabet_app/data/datasources/local/food_cache/food_cache_local_datasource.dart';
import 'package:diyabet_app/data/datasources/remote/food_cache/food_cache_remote_datasource.dart';
import 'package:diyabet_app/data/repositories/remote/food_cache_repository.dart';
import 'package:diyabet_app/data/repositories/remote/food_repository.dart';
import 'package:diyabet_app/domain/usecases/food/get_food_on_name_usecase.dart';
import 'package:diyabet_app/domain/usecases/food_cache/get_all_foods_for_cache.dart';
import 'package:get_it/get_it.dart';
import 'package:vexana/vexana.dart';

import 'data/datasources/remote/food/food_remote_datasouce.dart';
import 'data/datasources/remote/user/user_remote_datasource.dart';

import 'data/repositories/remote/user_repository.dart';

import 'domain/usecases/user/user_login_usecase.dart';
import 'ui/auth/cubit/cubit/auth_cubit.dart';
import 'ui/reciept/cubit/reciept_cubit.dart';
import 'ui/search/cubit/search_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(userLoginUseCase: sl.call(), getAllFoodsForCache: sl.call()));
  sl.registerFactory<SearchCubit>(() => SearchCubit(searchUseCase: sl.call()));
  sl.registerFactory<RecieptCubit>(() => RecieptCubit(searchFoodUseCase: sl.call()));

  //UserUseCases
  sl.registerLazySingleton<GetAllFoodsForCache>(() => GetAllFoodsForCache(foodCacheRepository: sl()));
  sl.registerLazySingleton<GetFoodOnNameUseCase>(() => GetFoodOnNameUseCase(foodRepositoryImpl: sl()));
  sl.registerLazySingleton<UserLoginUseCase>(() => UserLoginUseCase(userRepositoryImpl: sl()));

  //local datasources
  sl.registerLazySingleton<FoodCacheLocalDataSource>(() => FoodCacheLocalDataSource());
  //remote datasource
  sl.registerLazySingleton<FoodCacheRemoteDataSource>(() => FoodCacheRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(sl.call()));
  sl.registerLazySingleton<FoodRemoteDataSource>(() => FoodRemoteDataSource(sl.call()));

  //Repositories
  sl.registerLazySingleton<FoodCacheRepository>(
      () => FoodCacheRepositoryImpl(foodCacheRemoteDataSource: sl.call(), foodCacheLocalDataSource: sl.call()));
  sl.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(foodRemoteDataSource: sl.call()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl.call()));

  final networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: "http://62.248.1.53",
      contentType: 'application/json',
    ),
  );
  sl.registerLazySingleton(() => networkManager);
}
