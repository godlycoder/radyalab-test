import 'package:dartz/dartz.dart';
import 'package:list_foods/domain/failure.dart';
import 'package:list_foods/domain/uimodel/food_ui_model.dart';

abstract class FoodRepository {
  Future<Either<Failure, List<FoodUiModel>>> getFoodList();
}