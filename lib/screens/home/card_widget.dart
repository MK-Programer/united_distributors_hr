import 'package:flutter/material.dart';
import '../../resources/values_manager.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppMargin.m10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.person,
            size: 80,
          ),
          Text(
            'Title',
          ),
        ],
      ),
    );
  }
}
