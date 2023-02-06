import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_foods/domain/uimodel/food_ui_model.dart';

import '../../component/detail_header.dart';

class DetailPage extends StatefulWidget {
  final FoodUiModel data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UiKitDetailHeader(data: widget.data),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Cara memasak :',
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(widget.data.detail),
          )
        ],
      ),
    );
  }
}
