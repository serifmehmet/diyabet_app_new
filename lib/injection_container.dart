import 'package:diyabet_app/data/datasources/remote/food/food_remote_datasouce.dart';
import 'package:diyabet_app/data/repositories/food_repository.dart';
import 'package:diyabet_app/domain/usecases/food/get_food_on_name_usecase.dart';
import 'package:diyabet_app/ui/auth/cubit/cubit/auth_cubit.dart';
import 'package:diyabet_app/ui/reciept/cubit/reciept_cubit.dart';
import 'package:diyabet_app/ui/search/cubit/search_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:vexana/vexana.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit());
  sl.registerFactory<SearchCubit>(
    () => SearchCubit(
      searchUseCase: sl.call(),
    ),
  );

  sl.registerFactory<RecieptCubit>(
    () => RecieptCubit(
      searchFoodUseCase: sl.call(),
    ),
  );

  //UseCases
  sl.registerLazySingleton<GetFoodOnNameUseCase>(
    () => GetFoodOnNameUseCase(
      foodRepositoryImpl: sl.call(),
    ),
  );

  //remote datasource
  sl.registerLazySingleton<FoodRemoteDataSource>(
    () => FoodRemoteDataSource(sl.call()),
  );

  //Repositories
  sl.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(
      foodRemoteDataSource: sl.call(),
    ),
  );

  final networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: "https://calorieninjas.p.rapidapi.com/v1/nutrition",
      headers: {
        "x-rapidapi-host": "calorieninjas.p.rapidapi.com",
        "x-rapidapi-key": "1bdbf9c8a0mshd5da249161b7847p156b25jsn8bc4bca58523",
      },
    ),
  );
  sl.registerLazySingleton(() => networkManager);
}
