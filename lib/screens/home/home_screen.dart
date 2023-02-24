import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../resources/values_manager.dart';
import '../../widgets/screen_widget.dart';
import 'card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final parentCardsList = authProvider.getParentCardsList;
    return ScreenWidget(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: GridView.builder(
          itemCount: parentCardsList.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              value: parentCardsList[index],
              child: const CardWidget(),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: AppSize.s2.toInt(),
            mainAxisSpacing: AppMargin.m10,
            crossAxisSpacing: AppMargin.m10,
            // childAspectRatio: size.width / (size.width * AppSize.s0_9),
          ),
        ),
      ),
    );
  }
}
