import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/uimodel/food_ui_model.dart';
import '../../../../domain/usecase/get_list_foods.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetListFoods _getListFoods;

  HomeCubit(this._getListFoods) : super(InitialHomeState());

  void getListFoods() async {
    emit(LoadingHomeState());
    final result = await _getListFoods.execute();
    result.fold(
      (error) => emit(ErrorHomeState(error.message)),
      (result) => emit(HasDataHomeState(result))
    );
  }

}

abstract class HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);

}

class LoadingHomeState extends HomeState {}

class InitialHomeState extends HomeState {}

class HasDataHomeState extends HomeState {
  final List<FoodUiModel> data;

  HasDataHomeState(this.data);
}