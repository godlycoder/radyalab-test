import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:list_foods/presenter/router/router.gr.dart';

import '../../domain/uimodel/food_ui_model.dart';

class UiKitFoodItem extends StatelessWidget {
  final FoodUiModel? data;

  const UiKitFoodItem({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (data != null) {
          context.router.navigate(DetailRoute(data: data!));
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: Colors.grey,
                  image: getImage()
              ),
            ),
            Column(
              children: [
                Expanded(child: Container()),
                getTitle()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getTitle() {
    final title = data?.title;
    return Visibility(
      visible: title != null,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.maxFinite,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
          color: Colors.black38
        ),
        child: Text(
          title ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      )
    );
  }

  DecorationImage? getImage() {
    final url = data?.url;

    if (url != null) {
      return DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
              url
          )
      );
    }

    return null;
  }
}
