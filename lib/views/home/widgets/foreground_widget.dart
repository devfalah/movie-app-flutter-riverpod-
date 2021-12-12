import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_view.dart';
import 'movies_list_widget.dart';
import 'top_bar_widget.dart';

class ForegroundWidgets extends StatelessWidget {
  const ForegroundWidgets(
      {Key? key, required this.deviceHeight, required this.deviceWidth})
      : super(key: key);
  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, deviceHeight * 0.02, 0, 0),
      width: deviceWidth * 0.88,
      child: Consumer(
        builder: (_, watch, __) {
          final controller = watch(mainPageDataControllerProvider.notifier);
          final mainPageData = watch(mainPageDataControllerProvider);
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopBarWidget(
                deviceHeight: deviceHeight,
                deviceWidth: deviceWidth,
                controller: controller,
                mainPageData: mainPageData,
              ),
              Container(
                height: deviceHeight * 0.83,
                padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
                child: MoviesListViewWidget(
                  deviceHeight: deviceHeight,
                  deviceWidth: deviceWidth,
                  movies: mainPageData.movies!,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
