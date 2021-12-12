//Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/main_page_data.dart';

//Controllers
import '../../controllers/main_page_data_controller.dart';
//widgets
import 'widgets/background_widget.dart';
import 'widgets/foreground_widget.dart';

final mainPageDataControllerProvider =
    StateNotifierProvider<MainPageDataController, MainPageData>((ref) {
  return MainPageDataController();
});

final selectedMoviePosterURLProvider = StateProvider<String?>((ref) {
  final _movies = ref.watch(mainPageDataControllerProvider).movies!;
  return _movies.isNotEmpty ? _movies[0].posterURL() : null;
});

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _deviceHeight = MediaQuery.of(context).size.height;
    final _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SizedBox(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Consumer(
              builder: (_, watch, Widget? child) => BackgroundWidget(
                deviceHeight: _deviceHeight,
                deviceWidth: _deviceWidth,
              ),
            ),
            ForegroundWidgets(
              deviceHeight: _deviceHeight,
              deviceWidth: _deviceWidth,
            ),
          ],
        ),
      ),
    );
  }
}
