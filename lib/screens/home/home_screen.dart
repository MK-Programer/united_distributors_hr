import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';
import '../../widgets/screen_widget.dart';
import 'card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            childAspectRatio: AppSize.s0_8,
          ),
        ),
      ),
    );
  }
}
