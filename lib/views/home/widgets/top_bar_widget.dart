import 'package:flutter/material.dart';
import 'package:movie_app/controllers/main_page_data_controller.dart';
import 'package:movie_app/models/main_page_data.dart';

import 'category_selection_widget.dart';
import 'search_feild_widget.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.controller,
    required this.mainPageData,
  }) : super(key: key);
  final double deviceHeight;
  final double deviceWidth;
  final MainPageDataController controller;
  final MainPageData mainPageData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SearchFieldWidget(
            deviceHeight: deviceHeight,
            deviceWidth: deviceWidth,
            mainPageDataController: controller,
          ),
          CategorySelectionWidget(
            mainPageData: mainPageData,
          ),
        ],
      ),
    );
  }
}
