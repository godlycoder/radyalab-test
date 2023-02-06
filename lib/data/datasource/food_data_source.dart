import 'dart:convert';

import 'package:list_foods/data/service/api_services.dart';

import '../service/dto/food_dto.dart';

abstract class FoodRemoteDataSource {
  Future<List<FoodDTO>> getFoodLists();
}

class FoodRemoteDataSourceImpl extends FoodRemoteDataSource {
  final ApiServices _apiServices;

  FoodRemoteDataSourceImpl(this._apiServices);

  @override
  Future<List<FoodDTO>> getFoodLists() async {
    final response = await _apiServices.fetchAllFood();

    return (response.data as List).map((e) => FoodDTO.fromJson(e)).toList();
  }

}