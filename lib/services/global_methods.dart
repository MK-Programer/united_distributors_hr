import 'package:flutter/material.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';

import '../resources/img_manager.dart';

class GlobalMethods {
  static Future<void> errorDialog({
    required String subTitle,
    required BuildContext context,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset(
                ImgManager.error,
                height: AppSize.s20,
                width: AppSize.s20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: AppMargin.m8,
              ),
              Text(
                AppString.anErrorOccurred,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          content: Text(subTitle),
          actions: [
            TextButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Ok',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.cyan,
                    ),
              ),
            ),
          ],
        );
      },
    );
  }
}
