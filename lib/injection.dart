import 'package:get_it/get_it.dart';
import 'package:list_foods/data/datasource/food_data_source.dart';
import 'package:list_foods/domain/repository/food_repository.dart';
import 'package:list_foods/domain/usecase/get_list_foods.dart';
import 'package:list_foods/presenter/page/home/cubit/home_cubit.dart';

import 'data/repository/food_repository.dart';
import 'data/service/api_services.dart';

final locator = GetIt.instance;

Future<void> init() async {

  final apiServices = ApiServices();

  locator.registerLazySingleton(() => apiServices);

  locator.registerLazySingleton<FoodRemoteDataSource>(() => FoodRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(locator()));

  locator.registerLazySingleton(() => GetListFoods(locator()));

  locator.registerLazySingleton(
          () => HomeCubit(locator())
  );
}