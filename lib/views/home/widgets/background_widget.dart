import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_view.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.deviceHeight,
    required this.deviceWidth,
  }) : super(key: key);
  final double deviceHeight;
  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        final imageUrl = watch(selectedMoviePosterURLProvider).state;
        return imageUrl != null
            ? Container(
                height: deviceHeight,
                width: deviceWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              )
            : Container(
                height: deviceHeight,
                width: deviceWidth,
                color: Colors.black,
              );
      },
    );
  }
}
