import 'package:diyabet_app/domain/usecases/food/get_food_on_id_usecase.dart';
import 'package:diyabet_app/features/food/cubit/food_cubit.dart';
import 'package:diyabet_app/features/food/cubit/food_unit_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:vexana/vexana.dart';

import 'data/datasources/local/cache_food/cache_food_local_datasource.dart';
import 'data/datasources/remote/food/food_remote_datasouce.dart';
import 'data/datasources/remote/food_cache/food_cache_remote_datasource.dart';
import 'data/datasources/remote/user/user_remote_datasource.dart';
import 'data/repositories/local/local_food_repository.dart';
import 'data/repositories/remote/food_cache_repository.dart';
import 'data/repositories/remote/food_repository.dart';
import 'data/repositories/remote/user_repository.dart';
import 'domain/usecases/cache_food/get_all_foods_for_cache.dart';
import 'domain/usecases/cache_food/get_foods_from_cache_on_name.dart';
import 'domain/usecases/food/get_food_on_name_usecase.dart';
import 'domain/usecases/user/user_login_usecase.dart';
import 'features/auth/cubit/cubit/auth_cubit.dart';
import 'features/reciept/cubit/reciept_cubit.dart';
import 'features/search/cubit/search_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(userLoginUseCase: sl.call(), getAllFoodsForCache: sl.call()));
  sl.registerFactory<SearchCubit>(() => SearchCubit(getFoodFromCacheUseCase: sl.call()));
  sl.registerFactory<FoodCubit>(() => FoodCubit(getFoodOnIdUseCase: sl.call()));
  sl.registerFactory<FoodUnitCubit>(() => FoodUnitCubit());
  sl.registerFactory<RecieptCubit>(() => RecieptCubit(searchFoodUseCase: sl.call()));

  //UserUseCases
  sl.registerLazySingleton<GetAllFoodsForCache>(() => GetAllFoodsForCache(foodCacheRepository: sl()));
  sl.registerLazySingleton<GetFoodOnNameUseCase>(() => GetFoodOnNameUseCase(foodRepositoryImpl: sl()));
  sl.registerLazySingleton<UserLoginUseCase>(() => UserLoginUseCase(userRepositoryImpl: sl()));
  sl.registerLazySingleton<GetFoodOnIdUseCase>(() => GetFoodOnIdUseCase(foodRepository: sl()));
  //LocalUseCases
  sl.registerLazySingleton<GetFoodsFromCacheOnName>(() => GetFoodsFromCacheOnName(localFoodRepository: sl()));

  //local datasources
  sl.registerLazySingleton<CacheFoodLocalDataSource>(() => CacheFoodLocalDataSource());
  //remote datasource
  sl.registerLazySingleton<FoodCacheRemoteDataSource>(() => FoodCacheRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(sl.call()));
  sl.registerLazySingleton<FoodRemoteDataSource>(() => FoodRemoteDataSource(sl.call()));

  //Repositories
  sl.registerLazySingleton<FoodCacheRepository>(
      () => FoodCacheRepositoryImpl(foodCacheRemoteDataSource: sl.call(), foodCacheLocalDataSource: sl.call()));
  sl.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(foodRemoteDataSource: sl.call()));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(userRemoteDataSource: sl.call()));
  //Local Repositoties
  sl.registerLazySingleton<LocalFoodRepository>(() => LocalFoodRepositoryImpl(cacheFoodLocalDataSource: sl.call()));

  final networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: "http://62.248.1.53",
      contentType: 'application/json',
    ),
  );
  sl.registerLazySingleton(() => networkManager);
}
