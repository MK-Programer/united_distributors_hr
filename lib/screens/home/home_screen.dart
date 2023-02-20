import 'package:flutter/material.dart';

import '../../resources/values_manager.dart';
import '../../utils/utils.dart';
import '../../widgets/screen_widget.dart';
import 'card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: ScreenWidget(
        child: GridView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const CardWidget();
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppSize.s3.toInt(),
            mainAxisSpacing: AppMargin.m10,
            childAspectRatio: 0.8,
          ),
        ),
      ),
    );
  }
}
