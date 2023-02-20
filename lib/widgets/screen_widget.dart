import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/img_manager.dart';
import '../resources/values_manager.dart';
import '../utils/utils.dart';

class ScreenWidget extends StatelessWidget {
  final Widget child;
  const ScreenWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height,
          decoration: BoxDecoration(
            color: ColorManager.orange,
            image: DecorationImage(
              alignment: Alignment.bottomCenter,
              colorFilter: ColorFilter.mode(
                ColorManager.black.withOpacity(AppSize.s0_8),
                BlendMode.dstATop,
              ),
              image: const AssetImage(ImgManager.background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
