import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/color_manager.dart';
import '../../models/card_model.dart';
import '../../resources/route_manager.dart';
import '../../resources/values_manager.dart';
import '../../services/utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardModel = Provider.of<CardModel>(context);
    Size size = Utils(context).getScreenSize;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.childrenRoute, arguments: cardModel.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
        child: Column(
          children: [
            Container(
              height: size.width * AppSize.s0_3,
              width: size.width * AppSize.s0_3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://drive.google.com/uc?export=view&id=${cardModel.imageUrl}',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: AppMargin.m8,
            ),
            Text(
              cardModel.nameEn,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
