import 'package:diyabet_app/data/datasources/remote/recipe/recipe_remote_datasource.dart';
import 'package:diyabet_app/data/repositories/remote/recipe_repository.dart';
import 'package:diyabet_app/domain/usecases/recipe/remote/get_user_remote_recipe_usecase.dart';
import 'package:diyabet_app/domain/usecases/recipe/remote/save_remote_recipe_usecase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:vexana/vexana.dart';

import 'core/constants/enums/preferences_keys.dart';
import 'core/init/cache/cache_manager.dart';
import 'data/datasources/local/cache_food/cache_food_local_datasource.dart';
import 'data/datasources/local/food/food_local_datasource.dart';
import 'data/datasources/local/receipt/local_receipt_datasource.dart';
import 'data/datasources/local/user_blood_target/local_user_blood_target_datasource.dart';
import 'data/datasources/local/user_idf/local_user_idf_datasource.dart';
import 'data/datasources/local/user_iko/local_user_iko_datasource.dart';
import 'data/datasources/remote/food/food_remote_datasouce.dart';
import 'data/datasources/remote/food_cache/food_cache_remote_datasource.dart';
import 'data/datasources/remote/food_consumption/food_consumption_remote_datasource.dart';
import 'data/datasources/remote/user/user_bloodtarget_remote_datasource.dart';
import 'data/datasources/remote/user/user_bolus_remote_datasource.dart';
import 'data/datasources/remote/user/user_idf_remote_datasource.dart';
import 'data/datasources/remote/user/user_iko_remote_datasource.dart';
import 'data/datasources/remote/user/user_remote_datasource.dart';
import 'data/repositories/local/local_food_repository.dart';
import 'data/repositories/local/local_receipt_repository.dart';
import 'data/repositories/local/local_user_blood_target_repository.dart';
import 'data/repositories/local/local_user_idf_repository.dart';
import 'data/repositories/local/local_user_iko_repository.dart';
import 'data/repositories/remote/food_cache_repository.dart';
import 'data/repositories/remote/food_consumption_repository.dart';
import 'data/repositories/remote/food_repository.dart';
import 'data/repositories/remote/user_repository.dart';
import 'domain/usecases/cache_food/get_all_foods_for_cache.dart';
import 'domain/usecases/cache_food/get_foods_from_cache_on_name.dart';
import 'domain/usecases/food/delete_all_foods_usecase.dart';
import 'domain/usecases/food/delete_single_food_usecase.dart';
import 'domain/usecases/food/get_food_on_id_usecase.dart';
import 'domain/usecases/food/get_food_on_name_usecase.dart';
import 'domain/usecases/food/get_saved_local_foods_usecase.dart';
import 'domain/usecases/food/get_single_food_from_local_usecase.dart';
import 'domain/usecases/food/save_local_food_usecase.dart';
import 'domain/usecases/food/update_local_food_usecase.dart';
import 'domain/usecases/food_consumption/get_meal_by_filter_usecase.dart';
import 'domain/usecases/food_consumption/save_food_consumption_usecase.dart';
import 'domain/usecases/user/user_login_usecase.dart';
import 'domain/usecases/user/user_register_usecase.dart';
import 'domain/usecases/user_blood_target/local/get_local_user_bloodtarget_usecase.dart';
import 'domain/usecases/user_blood_target/local/save_local_user_bloodtarget_usecase.dart';
import 'domain/usecases/user_blood_target/remote/save_remote_bloodtarget_usecase.dart';
import 'domain/usecases/user_blood_target/remote/update_remote_bloodtarget_usecase.dart';
import 'domain/usecases/user_bolus/save_calculated_userbolus_usecase.dart';
import 'domain/usecases/user_idf/local/delete_single_user_idf_usecase.dart';
import 'domain/usecases/user_idf/local/get_all_user_idf_usecase.dart';
import 'domain/usecases/user_idf/local/save_user_idf_usecase.dart';
import 'domain/usecases/user_idf/remote/delete_remote_useridf_usecase.dart';
import 'domain/usecases/user_idf/remote/save_remote_useridf_usecase.dart';
import 'domain/usecases/user_iko/local/delete_single_user_iko_usecase.dart';
import 'domain/usecases/user_iko/local/get_all_user_iko_list_usecase.dart';
import 'domain/usecases/user_iko/local/save_local_user_iko_usecase.dart';
import 'domain/usecases/user_iko/remote/delete_remote_useriko_usecase.dart';
import 'domain/usecases/user_iko/remote/save_remote_useriko_usecase.dart';
import 'features/auth/cubit/cubit/auth_cubit.dart';
import 'features/food/cubit/food_cubit.dart';
import 'features/food/cubit/food_unit_cubit.dart';
import 'features/home/cubit/bottom_nav_cubit.dart';
import 'features/meal/cubit/bolus_cubit.dart';
import 'features/meal/cubit/meal_consumption_cubit.dart';
import 'features/my_diabet/cubit/iko_cubit.dart';
import 'features/my_diabet/cubit/my_diabet_cubit.dart';
import 'features/my_diabet/cubit/user_blood_target_cubit.dart';
import 'features/reciept/cubit/reciept_cubit.dart';
import 'features/reciept/cubit/recipe_cubit.dart';
import 'features/search/cubit/search_cubit.dart';
import 'features/totals/cubit/totals_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc

  sl.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      userLoginUseCase: sl.call(),
      getAllFoodsForCache: sl.call(),
      userRegisterUseCase: sl.call(),
      saveLocalUserIdfUseCase: sl.call(),
      saveLocalUserIkoUseCase: sl.call(),
      saveLocalUserBloodTargetUseCase: sl.call(),
    ),
  );
  sl.registerFactory<SearchCubit>(() => SearchCubit(getFoodFromCacheUseCase: sl.call()));
  sl.registerFactory<FoodCubit>(() => FoodCubit(getFoodOnIdUseCase: sl.call(), getSingleFoodFromLocal: sl.call()));
  sl.registerFactory<FoodUnitCubit>(() => FoodUnitCubit(foodCubit: sl.call()));
  sl.registerFactory<RecipeCubit>(() => RecipeCubit(saveRemoteRecipeUseCase: sl.call()));

  sl.registerFactory<FoodSearchCubit>(() => FoodSearchCubit(searchFoodUseCase: sl.call()));
  sl.registerFactory<TotalsCubit>(() => TotalsCubit(
        0,
        0,
        saveLocalFoodUseCase: sl.call(),
        getSavedLocalFoodsUseCase: sl.call(),
        deleteAllFoodsUseCase: sl.call(),
        deleteSingleFoodUseCase: sl.call(),
        updateLocalFoodUseCase: sl.call(),
        foodConsumptionUseCase: sl.call(),
      ));
  sl.registerFactory<MealConsumptionCubit>(() => MealConsumptionCubit(getMealByFilterUseCase: sl.call()));
  sl.registerFactory<IkoCubit>(() => IkoCubit(
        getAllUserIkoListUseCase: sl.call(),
        saveLocalUserIkoUseCase: sl.call(),
        deleteSingleUserIkoUseCase: sl.call(),
        saveRemoteUserIkoUseCase: sl.call(),
        deleteRemoteUserIkoUseCase: sl.call(),
      ));
  sl.registerFactory<MyDiabetCubit>(() => MyDiabetCubit(
        saveLocalUserIdfUseCase: sl.call(),
        getAllUserIdfUseCase: sl.call(),
        deleteSingleUserIdfUseCase: sl.call(),
        saveRemoteUserIdf: sl.call(),
        deleteRemoteUserIdfUseCase: sl.call(),
      ));
  sl.registerFactory<UserBloodTargetCubit>(
    () => UserBloodTargetCubit(
      saveLocalUserBloodTargetUseCase: sl.call(),
      getLocalUserBloodTargetUseCase: sl.call(),
      saveRemoteBloodTargetUseCase: sl.call(),
      updateRemoteBloodTargetUseCase: sl.call(),
    ),
  );

  sl.registerFactory<BolusCubit>(
    () => BolusCubit(
      getAllUserIdfUseCase: sl.call(),
      getAllUserIkoListUseCase: sl.call(),
      getLocalUserBloodTargetUseCase: sl.call(),
      saveCalculatedUserBolusUsecase: sl.call(),
    ),
  );
  //RemoteUseCasess
  sl.registerLazySingleton<GetAllFoodsForCache>(() => GetAllFoodsForCache(foodCacheRepository: sl()));
  sl.registerLazySingleton<GetFoodOnNameUseCase>(() => GetFoodOnNameUseCase(foodRepositoryImpl: sl()));
  sl.registerLazySingleton<UserLoginUseCase>(() => UserLoginUseCase(userRepositoryImpl: sl()));
  sl.registerLazySingleton<UserRegisterUseCase>(() => UserRegisterUseCase(userRepository: sl()));
  sl.registerLazySingleton<GetFoodOnIdUseCase>(() => GetFoodOnIdUseCase(foodRepository: sl()));
  sl.registerLazySingleton<SaveFoodConsumptionUseCase>(() => SaveFoodConsumptionUseCase(foodConsumptionRepository: sl()));
  sl.registerLazySingleton<GetMealByFilterUseCase>(() => GetMealByFilterUseCase(foodConsumptionRepository: sl()));
  sl.registerLazySingleton<SaveRemoteUserIdf>(() => SaveRemoteUserIdf(userRepository: sl()));
  sl.registerLazySingleton<DeleteRemoteUserIdfUseCase>(() => DeleteRemoteUserIdfUseCase(userRepository: sl()));
  sl.registerLazySingleton<SaveRemoteUserIkoUseCase>(() => SaveRemoteUserIkoUseCase(userRepository: sl()));
  sl.registerLazySingleton<DeleteRemoteUserIkoUseCase>(() => DeleteRemoteUserIkoUseCase(userRepository: sl()));
  sl.registerLazySingleton<SaveRemoteBloodTargetUseCase>(() => SaveRemoteBloodTargetUseCase(userRepository: sl()));
  sl.registerLazySingleton<UpdateRemoteBloodTargetUseCase>(() => UpdateRemoteBloodTargetUseCase(userRepository: sl()));
  sl.registerLazySingleton<SaveCalculatedUserBolusUsecase>(() => SaveCalculatedUserBolusUsecase(userRepository: sl()));
  sl.registerLazySingleton<SaveRemoteRecipeUseCase>(() => SaveRemoteRecipeUseCase(recipeRepository: sl()));
  sl.registerLazySingleton<GetUserRemoteRecipeUseCase>(() => GetUserRemoteRecipeUseCase(recipeRepository: sl()));

  //LocalUseCases
  sl.registerLazySingleton<GetFoodsFromCacheOnName>(() => GetFoodsFromCacheOnName(localFoodRepository: sl()));
  sl.registerLazySingleton<SaveLocalFoodUseCase>(() => SaveLocalFoodUseCase(localFoodRepository: sl()));
  sl.registerLazySingleton<GetSavedLocalFoodsUseCase>(() => GetSavedLocalFoodsUseCase(localFoodRepository: sl()));
  sl.registerLazySingleton<DeleteAllFoodsUseCase>(() => DeleteAllFoodsUseCase(localFoodRepository: sl()));
  sl.registerLazySingleton<DeleteSingleFoodUseCase>(() => DeleteSingleFoodUseCase(localFoodRepository: sl()));
  sl.registerLazySingleton<GetSingleFoodFromLocalUseCase>(() => GetSingleFoodFromLocalUseCase(localFoodRepository: sl()));
  sl.registerLazySingleton<UpdateLocalFoodUseCase>(() => UpdateLocalFoodUseCase(localFoodRepository: sl()));
  sl.registerLazySingleton<SaveLocalUserIdfUseCase>(() => SaveLocalUserIdfUseCase(localUserIdfRepository: sl()));
  sl.registerLazySingleton<GetAllUserIdfUseCase>(() => GetAllUserIdfUseCase(localUserIdfRepository: sl()));
  sl.registerLazySingleton<DeleteSingleUserIdfUseCase>(() => DeleteSingleUserIdfUseCase(localUserIdfRepository: sl()));
  sl.registerLazySingleton<SaveLocalUserIkoUseCase>(() => SaveLocalUserIkoUseCase(localUserIkoRepository: sl()));
  sl.registerLazySingleton<GetAllUserIkoListUseCase>(() => GetAllUserIkoListUseCase(localUserIkoRepository: sl()));
  sl.registerLazySingleton<DeleteSingleUserIkoUseCase>(() => DeleteSingleUserIkoUseCase(localUserIkoRepository: sl()));
  sl.registerLazySingleton<SaveLocalUserBloodTargetUseCase>(() => SaveLocalUserBloodTargetUseCase(localUserBloodTargetRepository: sl()));
  sl.registerLazySingleton<GetLocalUserBloodTargetUseCase>(() => GetLocalUserBloodTargetUseCase(localUserBloodTargetRepository: sl()));
  // sl.registerLazySingleton<SaveLocalRecipeUseCase>(() => SaveLocalRecipeUseCase(localReceiptRepository: sl()));

  //local datasources
  sl.registerLazySingleton<CacheFoodLocalDataSource>(() => CacheFoodLocalDataSource());
  sl.registerLazySingleton<FoodLocalDataSource>(() => FoodLocalDataSource());
  sl.registerLazySingleton<LocalUserIdfLocalDataSource>(() => LocalUserIdfLocalDataSource());
  sl.registerLazySingleton<LocalUserIkoDataSource>(() => LocalUserIkoDataSource());
  sl.registerLazySingleton<LocalUserBloodTargetDataSource>(() => LocalUserBloodTargetDataSource());
  sl.registerLazySingleton<LocalReceiptDataSource>(() => LocalReceiptDataSource());
  //remote datasource
  sl.registerLazySingleton<FoodCacheRemoteDataSource>(() => FoodCacheRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(sl.call()));
  sl.registerLazySingleton<FoodRemoteDataSource>(() => FoodRemoteDataSource(sl.call()));
  sl.registerLazySingleton<FoodConsumptionRemoteDataSource>(() => FoodConsumptionRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserIdfRemoteDataSource>(() => UserIdfRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserIkoRemoteDataSource>(() => UserIkoRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserBloodTargetRemoteDataSource>(() => UserBloodTargetRemoteDataSource(sl.call()));
  sl.registerLazySingleton<UserBolusRemoteDataSource>(() => UserBolusRemoteDataSource(sl.call()));
  sl.registerLazySingleton<RemoteRecipeDataSource>(() => RemoteRecipeDataSource(sl.call()));

  //Repositories
  sl.registerLazySingleton<FoodCacheRepository>(
      () => FoodCacheRepositoryImpl(foodCacheRemoteDataSource: sl.call(), foodCacheLocalDataSource: sl.call()));
  sl.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(foodRemoteDataSource: sl.call()));

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: sl.call(),
      userIdfRemoteDataSource: sl.call(),
      userIkoRemoteDataSource: sl.call(),
      userBloodTargetRemoteDataSource: sl.call(),
      userBolusRemoteDataSource: sl.call(),
    ),
  );
  sl.registerLazySingleton<FoodConsumptionRepository>(() => FoodConsumptionRepositoryImpl(consumptionRemoteDataSource: sl.call()));
  sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(remoteRecipeDataSource: sl.call()));
  //Local Repositoties
  sl.registerLazySingleton<LocalFoodRepository>(() => LocalFoodRepositoryImpl(cacheFoodLocalDataSource: sl.call(), foodLocalDataSource: sl.call()));
  sl.registerLazySingleton<LocalUserIdfRepository>(() => LocalUserIdfRepositoryImpl(localUserIdfLocalDataSource: sl.call()));
  sl.registerLazySingleton<LocalUserIkoRepository>(() => LocalUserIkoRepositoryImpl(localUserIkoDataSource: sl.call()));
  sl.registerLazySingleton<LocalUserBloodTargetRepository>(() => LocalUserBloodTargetRepositoryImpl(localUserBloodTargetDataSource: sl.call()));
  sl.registerLazySingleton<LocalReceiptRepository>(() => LocalReceiptRepositoryImpl(localReceiptDataSource: sl.call()));

  final networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(
      headers: {
        "X-Session-Id": CacheManager.instance.getStringValue(PreferencesKeys.X_SESSION_ID),
        "X-User-Id": CacheManager.instance.getStringValue(PreferencesKeys.USERID),
      },
      baseUrl: dotenv.env["APIURL"].toString(),
      contentType: 'application/json',
    ),
  );
  sl.registerLazySingleton(() => networkManager);
}
