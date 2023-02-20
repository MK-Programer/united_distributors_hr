import 'package:flutter/material.dart';
import '../../resources/img_manager.dart';
import '../../resources/values_manager.dart';
import '../../utils/utils.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Container(
        width: size.width,
        height: size.height * AppSize.s0_2,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImgManager.logo),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
