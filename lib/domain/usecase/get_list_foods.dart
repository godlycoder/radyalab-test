import 'package:dartz/dartz.dart';
import 'package:list_foods/domain/failure.dart';

import '../repository/food_repository.dart';
import '../uimodel/food_ui_model.dart';

class GetListFoods {
  final FoodRepository _repository;

  GetListFoods(this._repository);

  Future<Either<Failure, List<FoodUiModel>>> execute() {
    return _repository.getFoodList();
  }

}