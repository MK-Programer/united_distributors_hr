import 'package:flutter/material.dart';
import '../resources/color_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/screen_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Container(
              padding: const EdgeInsets.all(AppPadding.p8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(AppSize.s18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppString.hrBook,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: AppMargin.m8,
                  ),
                  Text(
                    AppString.aboutHrBook,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: AppMargin.m8,
                  ),
                  Text(
                    '${AppString.version}: 2.0',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: AppMargin.m8,
                  ),
                  Divider(
                    thickness: AppSize.s1,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    height: AppMargin.m8,
                  ),
                  Text(
                    AppString.copyRight,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
