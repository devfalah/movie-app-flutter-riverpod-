import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/provider.dart';
import 'package:movie_app/models/main_page_data.dart';

import '../../../search_category.dart';
import '../home_view.dart';

class CategorySelectionWidget extends StatelessWidget {
  const CategorySelectionWidget({
    Key? key,
    required this.mainPageData,
  }) : super(key: key);
  final MainPageData mainPageData;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.black38,
      value: mainPageData.searchCategory,
      icon: const Icon(
        Icons.menu,
        color: Colors.white24,
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
      onChanged: (dynamic _value) => _value.toString().isNotEmpty
          ? context
              .read(mainPageDataControllerProvider.notifier)
              .updateSearchCategory(_value)
          : null,
      items: const [
        DropdownMenuItem(
          child: Text(
            SearchCategory.popular,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.popular,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.upcoming,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.upcoming,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.latest,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.latest,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.nowPlaying,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.nowPlaying,
        ),
        DropdownMenuItem(
          child: Text(
            SearchCategory.none,
            style: TextStyle(color: Colors.white),
          ),
          value: SearchCategory.none,
        ),
      ],
    );
  }
}
