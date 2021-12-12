import 'package:flutter/material.dart';
import 'package:movie_app/controllers/main_page_data_controller.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
    required this.mainPageDataController,
  }) : super(key: key);
  final double deviceHeight;
  final double deviceWidth;
  final MainPageDataController mainPageDataController;

  @override
  Widget build(BuildContext context) {
    final _border = InputBorder.none;
    return SizedBox(
      width: deviceWidth * 0.50,
      height: deviceHeight * 0.05,
      child: TextField(
        // controller: _searchTextFieldController,
        onSubmitted: (_input) =>
            mainPageDataController.updateTextSearch(_input),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: _border,
          border: _border,
          prefixIcon: const Icon(Icons.search, color: Colors.white24),
          hintStyle: const TextStyle(color: Colors.white54),
          filled: false,
          fillColor: Colors.white24,
          hintText: 'Search....',
        ),
      ),
    );
  }
}
