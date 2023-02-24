import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/utils.dart';
import '../../providers/auth_provider.dart';
import '../../resources/values_manager.dart';
import '../../widgets/screen_widget.dart';
import 'card_widget.dart';

class ChildrenWidget extends StatelessWidget {
  const ChildrenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parentCardId = ModalRoute.of(context)!.settings.arguments as int;
    final authProvider = Provider.of<AuthProvider>(context);
    final hasChildren = authProvider.hasChildrens(parentCardId: parentCardId);
    final childrenList =
        authProvider.getChildrenById(parentCardId: parentCardId);
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: ScreenWidget(
        child: hasChildren
            ? Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: GridView.builder(
                  itemCount: childrenList.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: childrenList[index],
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
              )
            : Text('2'),
      ),
    );
  }
}
