import 'package:list_foods/data/service/dto/food_dto.dart';
import 'package:list_foods/domain/uimodel/food_ui_model.dart';

extension FoodDTOMapper on FoodDTO {
  FoodUiModel toUiModel() {
    return FoodUiModel(
      image,
      name,
      desc
    );
  }
}