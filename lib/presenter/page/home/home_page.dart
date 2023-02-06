import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:list_foods/presenter/page/home/cubit/home_cubit.dart';

import '../../../domain/uimodel/food_ui_model.dart';
import '../../component/food_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context)
      .getListFoods();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (_, state) {
        if (state is ErrorHomeState) {
          Fluttertoast.showToast(msg: state.message);
        }
      },
      child: Scaffold(
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Daftar Masakan',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                'Resep masakan favorit pilihan khusus buat kamu!',
                style: TextStyle(
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (_, state) {
                List<FoodUiModel>? list;

                if (state is HasDataHomeState) {
                  list = state.data;
                }

                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ),
                    itemCount: list?.length ?? 10,
                    itemBuilder: (_, index) {
                      return UiKitFoodItem(data: list?[index]);
                    }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
