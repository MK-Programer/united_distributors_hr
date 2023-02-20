import 'package:flutter/material.dart';
import 'package:united_distributors_hr/resources/values_manager.dart';

import '../resources/color_manager.dart';

class LoadingManager extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingManager({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        isLoading
            ? Container(
                color: Colors.black.withOpacity(AppSize.s0_8),
              )
            : Container(),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.deepOrange,
                ),
              )
            : Container()
      ],
    );
  }
}
