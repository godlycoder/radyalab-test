import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:list_foods/domain/uimodel/food_ui_model.dart';

class UiKitDetailHeader extends StatefulWidget {
  final FoodUiModel data;

  const UiKitDetailHeader({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _UiKitDetailHeader();

}

class _UiKitDetailHeader extends State<UiKitDetailHeader> {

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return SizedBox(
      height: 380,
      child: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        data.url
                    )
                )
            ),
          ),
          Container(
            height: 300,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 35,
                      ),
                      onTap: () {
                        context.router.navigateBack();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container()
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(data.url)
                          )
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}