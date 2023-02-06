import 'package:dartz/dartz.dart';
import 'package:list_foods/data/mapper/food_extensions.dart';
import 'package:list_foods/domain/failure.dart';
import 'package:list_foods/domain/repository/food_repository.dart';
import 'package:list_foods/domain/uimodel/food_ui_model.dart';

import '../datasource/food_data_source.dart';

class FoodRepositoryImpl extends FoodRepository {
  final FoodRemoteDataSource _remoteDataSource;

  FoodRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<FoodUiModel>>> getFoodList() async {
    try {
      final response = await _remoteDataSource.getFoodLists();
      final list = response.map((e) => e.toUiModel()).toList();
      return Right(list);
    } on Error catch(e) {
      return Left(
        Failure(e.toString())
      );
    }
  }

}